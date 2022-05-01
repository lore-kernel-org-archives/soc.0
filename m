Return-Path: <SRS0=ovHZ=VJ=startmail.com=hanetzer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3592EC433F5
	for <soc@archiver.kernel.org>; Sun,  1 May 2022 11:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3B28C385AA; Sun,  1 May 2022 11:38:04 +0000 (UTC)
Received: from mx-out1.startmail.com (mx-out1.startmail.com [145.131.90.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A34B7C385A9;
	Sun,  1 May 2022 11:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A34B7C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=startmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=startmail.com
Date: Sun, 1 May 2022 06:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1651405073;
	bh=XaQB/bDfL05mxHX/W7B5FozwTL67msdQW3AyRnhRTCI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=IMM2ZHxxw8//ifayT/L6KtpTjjYFJ/Mb3WGrwaqYA2r1SVZvNlFk6mpsK0Y0oW7VX
	 gS//o+5LAjo/P82fkXl1FmQZ4SFChs6jjOh3xeD2NOq0xL/TqH85jCcgOG6Kf1LeUa
	 Cl8CpjbnQ6ahHm79JBVfDaiDEN0EpfsVLIn6e/puaJxgp/YPYs8P5urkoRxwvHO7pe
	 YWlNBtBzcsgYXRjTHTAJNNP3taoeuKrQIEd6CBV1awTe/59+cQcK5v7lLT6NtB7RRs
	 jwVk4c7Jn1eniOvXZVqgYF+wEWrB0Oto4yusbNr6jpqEkn2UioghRm6kli8tZyU8g4
	 3QucZwlKVEzaA==
From: "Marty E. Plummer" <hanetzer@startmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm: hisi: enable Hi3521a soc
Message-ID: <20220501113749.vcwimgv3vzbl45qp@proprietary-killer>
References: <20220501051020.2432338-1-hanetzer@startmail.com>
 <20220501051020.2432338-3-hanetzer@startmail.com>
 <e68f9371-e111-d357-c224-a0067774db73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e68f9371-e111-d357-c224-a0067774db73@linaro.org>

On Sun, May 01, 2022 at 10:36:17AM +0200, Krzysztof Kozlowski wrote:
> On 01/05/2022 07:10, Marty E. Plummer wrote:
> > Enable Hisilicon Hi3521A/Hi3520DCV300 SoC. This SoC series includes
> > hardware mutlimedia codec cores, commonly used in consumer cctv/dvr
> > security systems and ipcameras. The arm core is a Cortex A7.
> > 
> > Add hi3521a.dtsi and hi3521a-rs-dm290e.dts for RaySharp CCTV systems,
> > marketed under the name Samsung SDR-B74301N.
> 
> Where?
> 
> > 
> > Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
> > ---
> >  arch/arm/boot/dts/Makefile | 2 ++
> >  arch/arm/mach-hisi/Kconfig | 9 +++++++++
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 7c16f8a2b738..535cef3b14ab 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -242,6 +242,8 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
> >  	gemini-ssi1328.dtb \
> >  	gemini-wbd111.dtb \
> >  	gemini-wbd222.dtb
> > +dtb-$(CONFIG_ARCH_HI3521A) += \
> > +	hi3521a-rs-dm290e.dtb
> 
> There is no such DTS.
> 
Ugh. Sorry, I've been fighting this for a while and must have missed it
out of exaustion. will resend.
> 
> Best regards,
> Krzysztof
