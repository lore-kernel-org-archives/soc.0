Return-Path: <SRS0=z99U=MD=linaro.org=dan.carpenter@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAB1C4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 15:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34AFFC4AF1C; Tue, 30 Apr 2024 15:10:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 470B0C2BBFC
	for <soc@kernel.org>; Tue, 30 Apr 2024 15:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 470B0C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e9so32229555e9.3
        for <soc@kernel.org>; Tue, 30 Apr 2024 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714489852; x=1715094652; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FoNbL1otlIxZgmhvKJLjnRUQ+ehkgEVScvtuFLOElk8=;
        b=cu2lnPI3AVqbHb9RYqmLEGPucWqFbSQj9NmzHCXv2ssEeRkbB5sFhrQ4XgT4grC2Hz
         V+t+BSKt8N2sQSKCZ71706v7bfY+UhMBcnW8E5EjfKXJPL7UHT+ClETxKcPZ9caGmh+8
         OzvW9WeApj8nyO81IhxXHxJH1ZFP2Oaz/uiLlPOw4+LJf11QXtYD9smCVswzCoNU154J
         pO0L26Nca2Qgk2P66xx6X/V6Il5xKC8ABPeGhpiS983lFo/HDmN6SnMzM/+An3rJBsV2
         sFiPtG7luBCQ6ZlvkAZN6gaLnDyEOCSlmQOzDiruw2ecJTFTeK8WD1iMwTNVqWA//i/O
         Mkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714489852; x=1715094652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FoNbL1otlIxZgmhvKJLjnRUQ+ehkgEVScvtuFLOElk8=;
        b=IUlkjijrThvkFoudhb1vbyOWGMgO7Y7RKHgqg0W1pnlYkSuoMKF3kV1dFuCvbUqXWZ
         ISmopC8uX5o9CEWEsGT4dkVW1cwAnnAUtgpfRl4VmNMrCDW0suQjauPgRRUPTYlQSE3x
         3+C44R10EpyKuMXbxS6gXmUFUhsk+lNgUS4ahrv2iHYuNTOQEUCf+y83Pt+L0XWO9hBv
         AlVfReUiPsYUtXsv6RzzjZfBsMxJYOImnoRMt8HSOIXhg3mzU19KOi7aIACy1BxgKCk4
         I5NIemSEsShciRXCc0RAmJUf27NTjeQZ9CtTb46O4d+3ksvxwvCpwIacrmW3tmGinFdu
         sg1w==
X-Forwarded-Encrypted: i=1; AJvYcCURgD/ivLWF8U/5R9OPgNn/euRkMc0IT/ET3DaKUUAiNse6ESmEfcail6nAhSagWkKVw/TBIiKJjBrZBgxa7Q==
X-Gm-Message-State: AOJu0YwqlgyhEmCXULAwZOUkQtQ7P8XU/lBx2Ae2oVxwFRKBkxaP4r4K
	nVeBkzX1GRRwp4b49quYER5GuvAQOd7foqFwcTEMJVgBTuEFN/xI+/sr/8rSGIU=
X-Google-Smtp-Source: AGHT+IHN8GNDQe5D65ve0ojweVIrevfxwqcUzOR2YOMwYsfobgmsRztxhHwpyHsCU8V6PZ014Nhs6g==
X-Received: by 2002:a05:600c:54ca:b0:41c:258:9b70 with SMTP id iw10-20020a05600c54ca00b0041c02589b70mr2045652wmb.28.1714489852242;
        Tue, 30 Apr 2024 08:10:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l37-20020a05600c1d2500b004186f979543sm49593289wms.33.2024.04.30.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 08:10:52 -0700 (PDT)
Date: Tue, 30 Apr 2024 18:10:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <0fe30dce-f1af-4bb8-8c09-3bec3867f473@moroto.mountain>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430160507.45f1f098@dellmb>

On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Behún wrote:
> > > +{
> > > +       u8 reply[OMNIA_FW_VERSION_LEN];
> > > +       int err;
> > > +
> > > +       err = omnia_cmd_read(mcu->client,
> > > +                            bootloader ? CMD_GET_FW_VERSION_BOOT
> > > +                                       : CMD_GET_FW_VERSION_APP,
> > > +                            reply, sizeof(reply));
> > > +       if (err)
> > > +               return err;  
> > 
> > > +       version[OMNIA_FW_VERSION_HEX_LEN - 1] = '\0';
> > > +       bin2hex(version, reply, OMNIA_FW_VERSION_LEN);  
> > 
> > Hmm... I would rather use returned value
> > 
> > char *p;
> > 
> > p = bin2hex(...);
> > *p = '\0';
> > 
> > return 0;
> 
> OK. I guess
> 
>   *bin2hex(version, reply, OMNIA_FW_VERSION_LEN) = '\0';
> 
> would be too crazy, right?

Indeed.  Please don't do that.  0_0

regards,
dan carpenter

