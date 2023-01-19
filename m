Return-Path: <SRS0=/O8t=5Q=armlinux.org.uk=linux+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EA9C00A5A
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 16:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D1E0C433F0; Thu, 19 Jan 2023 16:00:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4879BC433EF
	for <soc@kernel.org>; Thu, 19 Jan 2023 16:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4879BC433EF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F6rkBamTRJ2YGFGe+C7H+93L+0VqPQvHhb1kLuqbzzs=; b=rGgCskEam2irrZf7vdBWEit9uc
	MQwYFqegpOS1ZtsNWJ7UKIQq7CA5Gp3REyShc2t2Wkz1XWZUOItrHHHO9MlikzdaEN01/m4tKzWXB
	Is6/5rDuQHAWsTI84/ovFMJ1+H5R7wiwxfhcYNHROIpX1UMmP+5MKFEE0hTlTkIPnMyBNoLHb12Bl
	RyDF4MKebGScd10yXB0pGNvpYXNre19Ti2iQ8eCA+sNiM56UacZy3Isb8dkYesPU4+jbS4hg1ZxPp
	L5jSzx3n3XcaJt0lsGigxqYP1bVGYwcaDD1BFXwVVeSJlKHSFUIsDC9+SLeh+EtK1DUnbl4KgJ8Hl
	KPnYJ98g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36206)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pIXL7-0004XI-5a; Thu, 19 Jan 2023 16:00:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pIXL4-0000b5-RT; Thu, 19 Jan 2023 16:00:30 +0000
Date: Thu, 19 Jan 2023 16:00:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] [DNI] ARM: multi_v7_defconfig: Enable
 CONFIG_ARM_LPAE for multi_v7_config
Message-ID: <Y8lpHhKKfRNGq1m0@shell.armlinux.org.uk>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <20230119144236.3541751-10-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119144236.3541751-10-alexander.stein@ew.tq-group.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jan 19, 2023 at 03:42:36PM +0100, Alexander Stein wrote:
> This is necessary to support PCIe on LS1021A.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 441a449172368..f0757f05ec2c2 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -105,6 +105,7 @@ CONFIG_ARCH_VEXPRESS=y
>  CONFIG_ARCH_VEXPRESS_TC2_PM=y
>  CONFIG_ARCH_WM8850=y
>  CONFIG_ARCH_ZYNQ=y
> +CONFIG_ARM_LPAE=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=16
>  CONFIG_ARM_APPENDED_DTB=y

Enabling LPAE will break multi_v7 on CPUs that do not support LPAE,
such as Cortex A9, rendering iMX6 platforms unbootable with this
defconfig.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
