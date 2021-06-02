Return-Path: <SRS0=XAKR=K4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F291AC4708F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 10:40:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B1A6138C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 10:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0B1A6138C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZrzRlIVys6qb4ZXVhWjV4DaZu0rvivVZ2AnPGAwmzY=; b=QaxYj2jN8OXbmp
	LBvSlCxYdoCUedBr8XXbSE2pAPEXPMVzarL1alEJxwC5FrziROmuuy4p2Nh92WTRTsr7hHV9uEtTg
	ZDSBXoUysPT7LF10c/OefStOlSa5CVntbEunCsZIreS25F3p7I6qOlsZO+A3NQyhbj2znoKy+wHfE
	F9zulrczbItKux6GZdijZWOZvyWtr1aJNdXPuQeHKgXIwSun4uRxNb5KXB52GmQRjg6UzrdVTVEYJ
	R59uHNzTy1iT2nRXurHucdo2RUrIimOwpqJ3bxGdY9ynweKGMVnMThoSIEaNP9XZYnRaTmneOb4SX
	3rk/iTCsnKCdKQZ3BfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loOGG-003OIW-5O; Wed, 02 Jun 2021 10:38:08 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loOGB-003OFm-D6; Wed, 02 Jun 2021 10:38:04 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id
 67-20020a4a01460000b0290245b81f6261so440255oor.6; 
 Wed, 02 Jun 2021 03:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=hWOBvQ7VdApv4mpCvLKku1jdCG4LNBq/bcnrBgElBu7axA27jUlLuY+nYkTUcXRzhG
 su6dlWDag56xSgv+qg76A3UxCKFH34uLHGzXCF2A6b9HJw3gWOBej5xabZhWZl+VWZN5
 XZPxrqRlRO4e52eWtUy+8LUo7HjIharUftIX7hEinAcYXV5O9kbpg6mTGTufaQ5bt0M5
 z353fx+OVXlU6H0U54AcVW+9iX05Stce+x95AD9mKELmhNkKhZVrAETwykZH3YgEWJbw
 BrTJMft2LoD3eAkv3+tkg6QjMnsNVMlZOQhxtkXW2GoCrV3ry3EvF1pgWT0fmKxytmXb
 SQVw==
X-Gm-Message-State: AOAM532gjX5tuXO7zpfmU2NAOLw/dU/bSq27zu31PkZ+2YBoVOdGOPRv
 Uasb99L3aFj8BX7nSY/SjUI=
X-Google-Smtp-Source: ABdhPJzTNo0se9mK37UuoeN1ecljfwsBWrUc99om/YAcmBZbiez8FpWpti1NekxZInObdSBva3MFhg==
X-Received: by 2002:a4a:de18:: with SMTP id y24mr10079217oot.63.1622630280703; 
 Wed, 02 Jun 2021 03:38:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id s187sm4076067oig.6.2021.06.02.03.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:37:59 -0700 (PDT)
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
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/6] watchdog: bcm2835_wdt: consider
 system-power-controller property
Message-ID: <20210602103758.GA1865238@roeck-us.net>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_033803_505132_76D5466F 
X-CRM114-Status: GOOD (  21.22  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210602103758.fnAyW-4b4tiWLBMt6b16WKADu3vJcPj1RBQyOvkBCtg@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
