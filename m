Return-Path: <SRS0=o82r=NT=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1869CC27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 17:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1D24C4AF1C; Mon, 17 Jun 2024 17:06:21 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1772C2BD10;
	Mon, 17 Jun 2024 17:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1772C2BD10
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3097805a12.0;
        Mon, 17 Jun 2024 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718643980; x=1719248780; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EczmAfnm0zuLVuHzlPWL4uafz4PYEM39qm04nV00bzw=;
        b=itIrDIhCE+vOKZEJIN2q+tglIW3Me0VOVLcK3fDVVwsKzBPMF9dv7vLIG8RlMWcnqp
         fztlcmsqN84s7BfZzUR4nbV17rnFCiIuzfn0fK0dZIFRPuwtUhVcFL5YtqIwVl5qivpN
         8QAUuWqImq8ARAc13Mpw3zSU73hksbQl27lh1nsRbfiyreW1IFN91O7x7RujLsCuOJ87
         jKpoTSHwosQhJZaaD9NX8Yp0WOiiqsYvOKj8Kduz9WR/H4cwahW9QtEUjMhMAUTjZa/C
         PeEE3ch9LY5Cqp4Umh47Wry+jsld8hv8BK6Wjh423rxQS/8JogfJ2WL21gy26E9dtZJj
         oxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718643980; x=1719248780;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EczmAfnm0zuLVuHzlPWL4uafz4PYEM39qm04nV00bzw=;
        b=Cr7WiHcXkoMK43Biyuf+1jvB8h+WXzV4E5tIjP8o7dkWSLyNULvyzAk2jfxsnGifgL
         tvzEmLORGQpfq/O3YV2VR0onTlQJQDrPOwgMMvQFZk77GWwRTZpIz+YxhY/xgy06I0LU
         RNXypunfKBS/Mhd098Y56Tt0GRxtloKa0asJyZS9lVtiDR5Ig17sMsFqdpbkQ0GWs9x0
         JjRAUbhtYP7M8T1SQBaZ/9LZhePpml+51utZgJUqmknAjQGh8HvnWRz9AIaWkMaqGxd+
         HG0bUfrsp0OhyQSfOT+RCdcT+Z48TZpzRtz0nTr2r8Yqs6CrxbFE914G5/JQzlyc4cTH
         ALgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSwFEoLV52/PwpDb4Vfjf3Oe42pyesWA/AAEHR/lJrwBCZmayIKDAzlHx83SoTZvGtiZtfH2/afBObyaD/qiRMdhf96th4pSRFMmvnZJ1QkTRvNdYNjjFjTDXp86fylg==
X-Gm-Message-State: AOJu0YwX/8vpirT2KXbV9A/vQ6Af/RjtFaWoDUDxFU/nfniYA6/OAztC
	yb/run1JkHy71B/mhluTltSCrnrrDJN/KFMthKdYFFVkd/g6awvJoRBRMg==
X-Google-Smtp-Source: AGHT+IHGS8P4QU3XFck9o0Ve/sab2MYtYJ+R15PcJBebEYsIbvz6fWPGrKuqMFI2Ju2LMrPTRAbHFA==
X-Received: by 2002:a17:903:1c8:b0:1f7:1730:b456 with SMTP id d9443c01a7336-1f862a0cca5mr123594155ad.57.1718643979424;
        Mon, 17 Jun 2024 10:06:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f497a1sm81053335ad.283.2024.06.17.10.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 10:06:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Jun 2024 10:06:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v12 5/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <e61e956e-d19e-4a08-a7a0-07ca29fa5fed@roeck-us.net>
References: <20240617152606.26191-1-kabel@kernel.org>
 <20240617152606.26191-6-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617152606.26191-6-kabel@kernel.org>

On Mon, Jun 17, 2024 at 05:26:03PM +0200, Marek Behún wrote:
> Add support for the watchdog mechanism provided by the MCU.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---
[ ... ]

> +static unsigned int omnia_wdt_get_timeleft(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +	u16 timeleft;
> +	int err;
> +
> +	err = omnia_cmd_read_u16(mcu->client, OMNIA_CMD_GET_WDT_TIMELEFT,
> +				 &timeleft);
> +	if (err) {
> +		dev_err(&mcu->client->dev, "Cannot get watchdog timeleft: %d\n",
> +			err);

If that ever happens, it is likely going to be persistent, and will clog
the kernel log. But then I figure it is not really worth arguing about, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter
