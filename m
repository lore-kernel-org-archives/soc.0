Return-Path: <SRS0=jmGm=VN=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C3EC433F5
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 13:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9C73C385AE; Thu,  5 May 2022 13:29:12 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DCFDC385A8;
	Thu,  5 May 2022 13:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DCFDC385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1651757351; x=1683293351;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qtkuTLCkAMdA+TKniguyxGSpDFco0ifeOCD0K2kUtoQ=;
  b=tZ9lbNgs3WCWJKqeN/b14BaYH/PPjXH1wqEmLoGCEA1Nn5wEKdr4IloC
   wZ+oLMIejBMJ2CLCqlS0rl4DZLjZnSzqgcjt46vSR2qitiwQD1Uooucd1
   pN4X4hBsqCXgvG6rvuxYljlScGRQKc4yYVYs86g2374yR6DdJjQl0lk6x
   VaA6O89OI9gfLdhZ1B0dlrW/JbGC3RP1nryW0/uc9+eq+LrkE9sFvuVw2
   9vyOFdzderNIPBO32Jj+JsU823NLmy2BLa6/SBEtAqGlv4U3PNXtRKVvV
   1iMhhDTVoxKQUttta/rZ02FH/E6fnjHoggfNJqVH4ebIVlrB5EVag1xiU
   g==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="157920702"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 May 2022 06:29:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 5 May 2022 06:29:03 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 5 May 2022 06:29:02 -0700
Message-ID: <349385b3-bfea-d64a-d1a0-84e6c41818bd@microchip.com>
Date: Thu, 5 May 2022 15:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RESEND] ARM: configs: at91: Enable options required for
 systemd
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
References: <20220505125736.207029-1-broonie@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220505125736.207029-1-broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2022 at 14:57, Mark Brown wrote:
> Even smaller embedded systems are using systemd these days, as
> are test automation systems like KernelCI, so it is useful to be
> able to use systemd on these boards by default. Enable options
> that are missing in the at91_dt_defconfig, cgroups which is
> critical and autofs4 which is less critical but causes warnings
> on boot when not available.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> 
> This would be useful for KernelCI which uses a systemd based rootfs for
> many tests.

Sure Mark, sorry for the delay. We are just generating the 5.19 branches 
right now.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
and queued in at91-defconfig branch for 5.19. It should appear in 
linux-next in a couple of days.

Best regards,
   Nicolas

>   arch/arm/configs/at91_dt_defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index 549d01be0b47..bbb7f400a57f 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -4,6 +4,7 @@ CONFIG_SYSVIPC=y
>   CONFIG_NO_HZ_IDLE=y
>   CONFIG_HIGH_RES_TIMERS=y
>   CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_CGROUPS=y
>   CONFIG_BLK_DEV_INITRD=y
>   CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>   CONFIG_KALLSYMS_ALL=y
> @@ -205,6 +206,7 @@ CONFIG_PWM_ATMEL=y
>   CONFIG_PWM_ATMEL_HLCDC_PWM=y
>   CONFIG_PWM_ATMEL_TCB=y
>   CONFIG_EXT4_FS=y
> +CONFIG_AUTOFS4_FS=m
>   CONFIG_FANOTIFY=y
>   CONFIG_VFAT_FS=y
>   CONFIG_TMPFS=y
> --
> 2.30.2
> 


-- 
Nicolas Ferre
