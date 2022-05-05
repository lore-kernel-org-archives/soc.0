Return-Path: <SRS0=jmGm=VN=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80D8C433EF
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 15:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE25BC385AE; Thu,  5 May 2022 15:28:49 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14CBBC385A4;
	Thu,  5 May 2022 15:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14CBBC385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1651764528; x=1683300528;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zajwuSIzW6C6lPQfs2tEYfm5Bvxr1zk48INyaSJUbMc=;
  b=QAI/DnPxusvMjh9dsSeQdQ4R8lPcIajONBGtBo4DOMp9FUBLedz4WYVX
   2UcH+TKdO4ugd6lMTwiExt4B2gdPZmTgzarRed8/8GtDMKwO7F0FAxtS8
   JJFCUkb/2/R5K8nVJDlJIC/4V16iXWdsYGjR1ua8wKbKIsoy0MpFpQAI7
   uf9g+n7NDtSLcFHvJF2fD9skgfVOGN8uNCRtYAiZkbwg9AnjvMILdZuLe
   2xgO9HscZj38datHtC8JPsXuLskEBfc1XMaULglC57XHqBuA5rB5j/5nh
   ewTewkosD67qmTM4Blyg6ZjT9YTRf/UNt9IxOX+WxZmzCt8Et6vhT+9DT
   g==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="162456829"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 May 2022 08:28:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 5 May 2022 08:28:23 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 5 May 2022 08:28:21 -0700
Message-ID: <1f0b04ac-af35-c20a-94aa-9a45351cc2b4@microchip.com>
Date: Thu, 5 May 2022 17:28:14 +0200
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

Mark,

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
> 
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

While trying to add this option to our other defconfigs, I read this in 
the CONFIG_AUTOFS4_FS entry for 5.18-rc1:

"This name exists for people to just automatically pick up the
new name of the autofs Kconfig option. All it does is select
the new option name.

It will go away in a release or two as people have
transitioned to just plain AUTOFS_FS."

Don't we need to change to CONFIG_AUTOFS_FS now?

Regards,
   Nicolas

>   CONFIG_FANOTIFY=y
>   CONFIG_VFAT_FS=y
>   CONFIG_TMPFS=y
> --
> 2.30.2
> 


-- 
Nicolas Ferre
