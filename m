Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E1CC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 21:31:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F9D64E0F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 21:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7F9D64E0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wQ89Z723jEga36l4b/lqiXl+PoT2t8VGVuP3HGDxfqg=; b=DxAWiWcGxQlV3yI5lLOWpqEzU
	m69TYIHmCcQcO0lIpkLPmkGfXtSRc78mypldHTRxLhtAPjWShStd4QgHpaBJZYsUpnpvQTdJL2O/p
	zE0byq7HVFHRQO/JK0AXUu4sJuqGkW+xiK/NWejTSyiFbmnjHeiXf/Wz9Kjf3L7mVdx8tnWCgZbel
	o/mxePtAVJ1z0ZfVlHoYyLa9neAtyWpooFyBCbJlZH9GV8fgw3zrXQmcrifcnNH0IuoLiVXRskc9v
	MkFwQn9eyZ3OxFVrlxIRrIjFg8sFbiSGwsgc8YIf00WreJsXTTgMRMiFHg27cduQkTjIXnvRE8keF
	Q0mqy75vQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7mCF-0005e4-J4; Thu, 04 Feb 2021 21:29:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7mCC-0005dP-LZ
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 21:29:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFEA964F58
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-ot1-f51.google.com with SMTP id v1so4863674ott.10
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Feb 2021 13:29:47 -0800 (PST)
X-Gm-Message-State: AOAM531dN3MXs3UzQwLkbjSEll7CmaNjA4gvnDjlxYRkHbMqiWFc7obh
 pmrTw0y4XhuUaxFuyxrlcBNd+qRb1vh60Sw45uY=
X-Google-Smtp-Source: ABdhPJzGUQYl/7aBl6uwyNJC0ArI8+SQW9MmRInBUnVTFc9xeLvDUS1HjdXbiBeuCrwAw6MrzeiBqhHqOQx5nOr+2Z0=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr999787otq.305.1612474186974; 
 Thu, 04 Feb 2021 13:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-19-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 22:29:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
Message-ID: <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_162948_860951_BFC31398 
X-CRM114-Status: GOOD (  16.25  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204212930.--d8yByv-lKCatRmNuw9pgjMP4Ez74ukcycIWZkOrEA@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
