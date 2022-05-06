Return-Path: <SRS0=KWQb=VO=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA30BC433EF
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 07:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A76F1C385AF; Fri,  6 May 2022 07:43:29 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF8DAC385A8;
	Fri,  6 May 2022 07:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF8DAC385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1651823007; x=1683359007;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qEl2eWZDFoL6RHHUqP2WjQZ4XAugU+8edkRpYQkZbTk=;
  b=LjYipJ4qtnxzNUy0BDw5XGYr0UFgGWSxcPb41JsAkTeaPe1INQ0fa+sJ
   EKsj20wjJf2c+Uzwh0SPT8bnAxonmNasUrlk387i++xPJXkRz0uRJpw7L
   08Xy1MyNQWWpXmB2WY6nK3lK22OC7jonQZI2A84m6LJQloN0UXln2oqPd
   DJBaBeEoGHYUpud4QYSDMOk56pEOo9hA3GbLUZ2T7p3qbZgKAtV+Dv4UX
   MwYic3zRhba1XWsLEdXN32yIKDgAfu4op0gAgbJba99d08tVfWb3Z4YXs
   ER9Mwq3I02SRIORdrsk9KxJylNNf0CRr/43aDhZnCeA5uZ0iTA16LEN1a
   w==;
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="94762404"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 May 2022 00:43:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 6 May 2022 00:43:26 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 6 May 2022 00:43:25 -0700
Message-ID: <6e42fbef-4e73-005e-8ec9-44ba52dc82d8@microchip.com>
Date: Fri, 6 May 2022 09:43:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] ARM: configs: at91: Enable options required for
 systemd
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20220505171043.553079-1-broonie@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220505171043.553079-1-broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2022 at 19:10, Mark Brown wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
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
> v2:
>   - s/CONFIG_AUTOFS4_FS/CONFIG_AUTOFS_FS/

Thanks for this update Mark.
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Best regards,
   Nicolas

>   arch/arm/configs/at91_dt_defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index 549d01be0b47..a58293fdfff2 100644
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
> +CONFIG_AUTOFS_FS=m
>   CONFIG_FANOTIFY=y
>   CONFIG_VFAT_FS=y
>   CONFIG_TMPFS=y
> --
> 2.30.2
> 


-- 
Nicolas Ferre
