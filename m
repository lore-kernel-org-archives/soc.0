Return-Path: <SRS0=vn2X=JD=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E634C433B4
	for <soc@archiver.kernel.org>; Tue,  6 Apr 2021 16:15:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 10334613D2; Tue,  6 Apr 2021 16:15:27 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C8E613C7
	for <soc@kernel.org>; Tue,  6 Apr 2021 16:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C8E613C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ed1-f71.google.com ([209.85.208.71])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lToMO-0005kU-FA
	for soc@kernel.org; Tue, 06 Apr 2021 16:15:24 +0000
Received: by mail-ed1-f71.google.com with SMTP id j18so10631075edv.6
        for <soc@kernel.org>; Tue, 06 Apr 2021 09:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pc7Mc2iBHF1g8Xf3WZmYYKPrF2SwmZQ5FMyrEN7WVwU=;
        b=LElfT8pyvYXUWmD+mmI87fVz9VXDP/rqnGjMD//FxJmY4EtGRM9Q1m2LoKGETagTeU
         5s4ETlkw7PWQPZcLP6BylfyNmp5R0h1SY5SwN/NzqSSfjNc2NeQLy1MRatTQu5gRegpW
         ErAMkH9f9lJBhGJa/OP+rX5TrQq1Upw94fHx9TQo8qaook7/aai5WCw7Et2kgkQ5Ytbc
         jbDbPsZciqcT1uQGKvZSLme2U/6xM2fII96F0fqFsu7C/O75bYTkUCLk6UCtG0657mt/
         BLOTWp+GA+gBURVWjNdBxOUSUo3IKg/xu6FJ8KKPBDWzgGrv2gx5GWId9XrhWBEroXmd
         MQvQ==
X-Gm-Message-State: AOAM530I7AkYx/hK1XyUtCUiRKBTH6zd5EHjQzfQuz1Azk8QT/oDzPHQ
	w2XOeM+du6g4xf/rK1NcyExwmlXnwzTVUoyESQBVGcJdMIsQ5x8Dzbb6fuDR2ULO71QgMgOwuVZ
	XtsDfwHcg5NTSbq7zH/IgT10o1x5wifsdHH1Zno8=
X-Received: by 2002:a17:906:ff15:: with SMTP id zn21mr20674053ejb.296.1617725724098;
        Tue, 06 Apr 2021 09:15:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw804Texr+Avxb2Xtww4+jktrq8ZbSClHDrPU8KBZum7liZCTe94GVIXgCnwrVcGVlgqfayCTK8SXCiOhy7+HI=
X-Received: by 2002:a17:906:ff15:: with SMTP id zn21mr20674031ejb.296.1617725723902;
 Tue, 06 Apr 2021 09:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-9-krzysztof.kozlowski@canonical.com> <20210406160959.GA208060@roeck-us.net>
In-Reply-To: <20210406160959.GA208060@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Tue, 6 Apr 2021 18:15:13 +0200
Message-ID: <CA+Eumj6C60r4DF24W2GobwB1GrQADLpm5YXLAzHjcjWmrrsE3g@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] arm64: socfpga: merge Agilex and N5X into ARCH_INTEL_SOCFPGA
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, 
	Robert Richter <rric@kernel.org>, Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>, 
	Lee Jones <lee.jones@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Apr 2021 at 18:10, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Mar 11, 2021 at 04:25:38PM +0100, Krzysztof Kozlowski wrote:
> > Agilex, N5X and Stratix 10 share all quite similar arm64 hard cores and
> > SoC-part.  Up to a point that N5X uses the same DTSI as Agilex.  From
> > the Linux kernel point of view these are flavors of the same
> > architecture so there is no need for three top-level arm64
> > architectures.  Simplify this by merging all three architectures into
> > ARCH_INTEL_SOCFPGA and dropping the other ARCH* arm64 Kconfig entries.
> >
> > The side effect is that the INTEL_STRATIX10_SERVICE will now be
> > available for both 32-bit and 64-bit Intel SoCFPGA, even though it is
> > used only for 64-bit.
>
> Did you try to compile, say, arm:allmodconfig with this patch applied ?
> Because for me that results in:
>
> In file included from <command-line>:
> drivers/firmware/stratix10-rsu.c: In function 'rsu_status_callback':
> include/linux/compiler_types.h:320:38: error:
>         call to '__compiletime_assert_177' declared with attribute error:
>         FIELD_GET: type of reg too small for mask
>
> and lots of similar errors.

Thanks for the report. I fixed that already with:
https://lore.kernel.org/lkml/20210321184650.10926-1-krzysztof.kozlowski@canonical.com/
(and https://lore.kernel.org/lkml/20210404124609.122377-1-dinguyen@kernel.org/ )
but for some reason it did not go to the same tree.

Best regards,
Krzysztof
