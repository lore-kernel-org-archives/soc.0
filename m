Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1E7C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 21:29:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CBDAD64F97; Thu,  4 Feb 2021 21:29:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A35CD64E0F;
	Thu,  4 Feb 2021 21:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612474187;
	bh=WfOm//AouO5GEFC/NDTYG5g6sUxXU6vyrEU6VhLu32c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZsR2vrwQDimGX8XYrmxEjBtWFZTQuUe3j0XMRkaZ8tJfia6pJYKoeKkzH17rtmzjp
	 YlrmOq0KvrtEuUcgwJuaodAzMeYvF1gsSjhu2DgEQ9lHuDQ24bSy7OFbifKJXSaYfF
	 cQgMsDt9a1yEr1zMjyPP40CgqpKK7xuXlrKkSSA/vedLD07aqhgjw/BRPyAioTvHcY
	 WageBFdSbtcwoBarirQtrFu9cU96g4SntJtCWavUdOn+OTxGKuiyMHEDswW3ygMqEm
	 hNGejzAYgs/x5T7L/4iIphIPEOk/81EkZaYZ+1K/Xk6vnersH+TMyx8vX4MsaFr9Rp
	 UfU+TfNnmS8Hw==
Received: by mail-ot1-f45.google.com with SMTP id t25so4901985otc.5;
        Thu, 04 Feb 2021 13:29:47 -0800 (PST)
X-Gm-Message-State: AOAM533/0lSYpd/9ei3s0rge7v0X4wEOdL/h2930VKlLNcJuNY3CWefZ
	dQKWcZSMRMjzSvM5JT8wEz3RLGTgAz0cay65JG0=
X-Google-Smtp-Source: ABdhPJzGUQYl/7aBl6uwyNJC0ArI8+SQW9MmRInBUnVTFc9xeLvDUS1HjdXbiBeuCrwAw6MrzeiBqhHqOQx5nOr+2Z0=
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr999787otq.305.1612474186974;
 Thu, 04 Feb 2021 13:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-19-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-19-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 22:29:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
Message-ID: <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1) devicetree
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:

> +/ {
> +       model = "Apple Mac Mini M1 2020";
> +       compatible = "AAPL,j274", "AAPL,m1", "AAPL,arm-platform";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       chosen {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               bootargs = "earlycon";
> +               stdout-path = "serial0:1500000";
> +
> +               framebuffer0: framebuffer@0 {
> +                       compatible = "AAPL,simple-framebuffer", "simple-framebuffer";
> +                       reg = <0 0 0 0>; // To be filled by loader
> +                       // Format properties will be added by loader
> +                       status = "disabled";
> +               };
> +       };
> +
> +       memory@800000000 {
> +               device_type = "memory";
> +               reg = <0 0 0 0>; // To be filled by loader
> +       };
> +
> +       aliases {
> +               serial0 = &serial0;
> +       };

We tend to split the dts file into one file per SoC and one for the
specific board. I guess in this case the split can be slightly different,
but it does feel better to be prepared for sharing a lot of the contents
between the different products.

In most cases, you'd want the 'aliases' and 'chosen' nodes to be
in the board specific file.

> +       cpus {
> +               #address-cells = <2>;
> +               #size-cells = <0>;
> +
> +               cpu0: cpu@0 {
> +                       compatible = "AAPL,icestorm";
> +                       device_type = "cpu";
> +                       reg = <0x0 0x0>;
> +                       enable-method = "spin-table";
> +                       cpu-release-addr = <0 0>; // To be filled by loader
> +               };

Did you see the discussion on the #armlinux channel about the possibility
of moving the cpu-enable method to PSCI based on a UEFI runtime
interface?

There are a few open questions about what that would look like in the
end, but Ard has come up with a prototype for the kernel side of it
(obviously untested), which would interface either into the UEFI side
of u-boot, or a simple already-instantiated version that could be
kept inside of m1n1 and stay resident in memory.

I would like to see that model get adopted here eventually. If
we manage to get the other patches ready for an initial merge in
v5.12, we can probably start out with spin-table and move to that
in a following release though.

        Arnd
