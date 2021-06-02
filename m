Return-Path: <SRS0=TDHL=K4=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FC9C47092
	for <soc@archiver.kernel.org>; Wed,  2 Jun 2021 10:38:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A823A613BA; Wed,  2 Jun 2021 10:38:01 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5903060C3E;
	Wed,  2 Jun 2021 10:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5903060C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=groeck7@gmail.com
Received: by mail-oo1-f42.google.com with SMTP id j17-20020a4ad6d10000b02901fef5280522so454253oot.0;
        Wed, 02 Jun 2021 03:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NHYeNA+V/PrJlvviVEjjujo+v93Ja60cG99fsblTbFI=;
        b=DOM0cr6AigqFT/wzI5JYEGs6+1XgsG3xF9KFYVvoKMWpeaFTFiAZ9H+IpwKXVHUo6a
         yCsG1tY60kqXLT3GGipB9JzXoTNfdXbgH3nqjy/BJEpgd9AKrdKCeVbp/ny9onHq3gfm
         gG0z3LYYPs2EyLD+4GIHN2pJYxSPbOW1Xb4XPm6YmJRodylzWF98rYo3vRUpRJHjbsxw
         R8T3K08XGZH5LZiId/mpeM+8gpl89wReRORot+2KQvd5kYYRVlyCfLFJwSJCDKZTt08n
         0isP7V8JUcdf77kSOOtmBWrQu/AUDrRGY+wfE5T5NFNv5oeCJNT0M17zrPq11TngSQvX
         Y6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=NHYeNA+V/PrJlvviVEjjujo+v93Ja60cG99fsblTbFI=;
        b=cvHKixbNRr9U8YZP748m0VuZURcn/xZmGVUmJ5jDGNiLHkr6Rv1+2ltFxTjc3U4Pf8
         11ZwLT6ZxhXc4LKwo/uK2/7aGs71at5uFfCqkO6BHp5ltzjmNTjK9/ZrTWfiWguJASU/
         8TtFj54byoUwKnoZLP/82p+7SFWK2Ignz4IR2a7+ZotzVMJounUQrSpsz/cZR9vtc/zX
         35RJ/bKERT8MPGVFblDFobrOZTALbndwNER+l0jWQwN7FfwrT1uOLS9flZNNJdTIWIDZ
         ttIxFtDrFSTQwQJiMNtATaGIMpJqiBRA98cL0RMihbLHaSTm3ggKYgGAw+C/Ujz5vtDs
         jDeQ==
X-Gm-Message-State: AOAM533Q07PSHwpFQB9V+u8NETknPta36lMjlJ67b45H7hEGAJek7d5G
	d657c4jhvuB1PqljCNpLII8=
X-Google-Smtp-Source: ABdhPJzTNo0se9mK37UuoeN1ecljfwsBWrUc99om/YAcmBZbiez8FpWpti1NekxZInObdSBva3MFhg==
X-Received: by 2002:a4a:de18:: with SMTP id y24mr10079217oot.63.1622630280703;
        Wed, 02 Jun 2021 03:38:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s187sm4076067oig.6.2021.06.02.03.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:37:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Jun 2021 03:37:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/6] watchdog: bcm2835_wdt: consider
 system-power-controller property
Message-ID: <20210602103758.GA1865238@roeck-us.net>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>

On Sun, May 30, 2021 at 11:26:11AM +0200, Stefan Wahren wrote:
> Until now all Raspberry Pi boards used the power off function of the SoC.
> But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
> possibly cannot register the poweroff handler because the it's
> already registered by this watchdog driver. So consider the
> system-power-controller property for registering, which is already
> defined in soc/bcm/brcm,bcm2835-pm.txt .
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bcm2835_wdt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> index dec6ca0..9490717 100644
> --- a/drivers/watchdog/bcm2835_wdt.c
> +++ b/drivers/watchdog/bcm2835_wdt.c
> @@ -205,9 +205,13 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	if (pm_power_off == NULL) {
> -		pm_power_off = bcm2835_power_off;
> -		bcm2835_power_off_wdt = wdt;
> +	if (of_device_is_system_power_controller(pdev->dev.parent->of_node)) {
> +		if (!pm_power_off) {
> +			pm_power_off = bcm2835_power_off;
> +			bcm2835_power_off_wdt = wdt;
> +		} else {
> +			dev_info(dev, "Poweroff handler already present!\n");
> +		}
>  	}
>  
>  	dev_info(dev, "Broadcom BCM2835 watchdog timer");
> -- 
> 2.7.4
> 
