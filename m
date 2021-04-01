Return-Path: <SRS0=h6yl=I6=zonque.org=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C88C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 12:58:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A0CBB611CB; Thu,  1 Apr 2021 12:58:15 +0000 (UTC)
X-Greylist: delayed 485 seconds by postgrey-1.34 at mail.kernel.org; Thu, 01 Apr 2021 12:58:14 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D7E60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zonque.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@zonque.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.kernel.org (Postfix) with ESMTP id D3D7E60FDC;
	Thu,  1 Apr 2021 12:58:14 +0000 (UTC)
Received: from [192.168.178.106] (p57bc9e3b.dip0.t-ipconnect.de [87.188.158.59])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 47CDF4C69CC;
	Thu,  1 Apr 2021 12:50:08 +0000 (UTC)
Subject: Re: [PATCH] ARM: configs: Remove REGULATOR_USERSPACE_CONSUMER
To: Mark Brown <broonie@kernel.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210401102858.4095-1-broonie@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <7ee9fcd3-e4ed-1edf-4ac5-0bcb26ab4d2a@zonque.org>
Date: Thu, 1 Apr 2021 14:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210401102858.4095-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/1/21 12:28 PM, Mark Brown wrote:
> The userspace consumer is a development tool, not intended for producton
> systems and so should not be present in defconfigs especially not those
> for specific machines so is not a good fit for defconfig, remove it from
> those defconfigs where it is enabled. No system in mainline actually
> instantiates one.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm/configs/ezx_defconfig    | 1 -
>  arch/arm/configs/imote2_defconfig | 1 -
>  arch/arm/configs/pxa_defconfig    | 1 -

Acked-by: Daniel Mack <daniel@zonque.org>



>  3 files changed, 3 deletions(-)
> 
> diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
> index 81665b7abf83..a49e699e52de 100644
> --- a/arch/arm/configs/ezx_defconfig
> +++ b/arch/arm/configs/ezx_defconfig
> @@ -213,7 +213,6 @@ CONFIG_POWER_SUPPLY=y
>  CONFIG_EZX_PCAP=y
>  CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_DEBUG=y
> -CONFIG_REGULATOR_USERSPACE_CONSUMER=y
>  CONFIG_REGULATOR_PCAP=y
>  CONFIG_MEDIA_SUPPORT=y
>  CONFIG_VIDEO_DEV=y
> diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
> index ae15a2a33802..118c4c927f26 100644
> --- a/arch/arm/configs/imote2_defconfig
> +++ b/arch/arm/configs/imote2_defconfig
> @@ -194,7 +194,6 @@ CONFIG_POWER_SUPPLY=y
>  CONFIG_PMIC_DA903X=y
>  CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_DEBUG=y
> -CONFIG_REGULATOR_USERSPACE_CONSUMER=y
>  CONFIG_REGULATOR_DA903X=y
>  CONFIG_MEDIA_SUPPORT=y
>  CONFIG_VIDEO_DEV=y
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
> index bd7dd81c9c54..875a3c28a267 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -415,7 +415,6 @@ CONFIG_MFD_TC6393XB=y
>  CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_DEBUG=y
>  CONFIG_REGULATOR_FIXED_VOLTAGE=m
> -CONFIG_REGULATOR_USERSPACE_CONSUMER=m
>  CONFIG_REGULATOR_ACT8865=m
>  CONFIG_REGULATOR_AS3711=m
>  CONFIG_REGULATOR_AXP20X=m
> 

