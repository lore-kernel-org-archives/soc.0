Return-Path: <SRS0=77Kc=VA=pengutronix.de=a.fatoum@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8148EC433EF
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 15:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42EDFC385A9; Fri, 22 Apr 2022 15:37:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CD1EC385A4
	for <soc@kernel.org>; Fri, 22 Apr 2022 15:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CD1EC385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1nhvLN-0000qE-AP; Fri, 22 Apr 2022 17:37:13 +0200
Message-ID: <3d5969cc-2210-3c7c-01c8-3f5c3789e54b@pengutronix.de>
Date: Fri, 22 Apr 2022 17:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/8] ARM: stm32: select OPTEE on MPU family
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 soc@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Marek Vasut <marex@denx.de>, etienne.carriere@st.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-6-alexandre.torgue@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20220422150952.20587-6-alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Hello Alex,

On 22.04.22 17:09, Alexandre Torgue wrote:
> Select CONFIG_OPTEE for STM32MP15 and STM32MP13 by default. Final
> activation will done thanks to device tree.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
> index 98145031586f..b322cf2a136f 100644
> --- a/arch/arm/mach-stm32/Kconfig
> +++ b/arch/arm/mach-stm32/Kconfig
> @@ -6,6 +6,8 @@ menuconfig ARCH_STM32
>  	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
>  	select ARM_GIC if ARCH_MULTI_V7
>  	select ARM_PSCI if ARCH_MULTI_V7
> +	select TEE if ARCH_MULTI_V7
> +	select OPTEE if ARCH_MULTI_V7

Users may want to use OPTEE as a module without it being a SCMI provider
or not use OPTEE at all. I'd prefer you drop this patch and leave it
to users to configure their kernel appropriately.

Cheers,
Ahmad


>  	select ARM_AMBA
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select CLKSRC_STM32




-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
