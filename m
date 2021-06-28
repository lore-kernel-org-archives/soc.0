Return-Path: <SRS0=G6/k=LW=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ABFC49EA3
	for <soc@archiver.kernel.org>; Mon, 28 Jun 2021 16:31:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BDE0B61C3D; Mon, 28 Jun 2021 16:31:07 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F8160234;
	Mon, 28 Jun 2021 16:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F8160234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=groeck7@gmail.com
Received: by mail-oo1-f46.google.com with SMTP id g13-20020a4ac4cd0000b029024c717ed8aeso1779989ooq.13;
        Mon, 28 Jun 2021 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ORsTqvtDccq70X0poDFX9rVL1vOBMr3BTqbaDtdmVOw=;
        b=UpMyg2XmV3vDgk1/2xl/Njoh5sd0HHrtg8nc5tD23UII3SHz53Y7HOHf+r2No6ZwUN
         UXobGMR0FMhAdCcs6sZCBvfdhsN71+tty4c0PGiBk11hNmXfhPyYpUGss5WjNAwW6hU0
         CXMzp3vt5rsB45GxLyjIlLYxBBe9Y45YLaKNzXydw4QEPN9pHWU7Q8Et8QJH9Uq80Nbz
         i050jtkDvyf/h9SYMEUFx6TsXbkBn9TFomnbvAVntynS7tR+tkcpzSf8SozokT6zokjJ
         AbNC+vCKn0n5NQfgTL35k4Z7DeVV/F1+myDmJ2axLVqGlQr7Fslg97WDdtay6duLNdjh
         peeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ORsTqvtDccq70X0poDFX9rVL1vOBMr3BTqbaDtdmVOw=;
        b=ZZEHTFzdS3mPl1dBamFKlwGzdgBpyI0Gujq6DwDVWjaCsAJ0MxUAAyw9KdvQkrTdNG
         84DALYgCHqxBmLyXL9Ty7k4Vw5Msd2+9qTsmrDcq18fx12L4fox59sRN3t/zh9NguWhH
         eSTjq4OdLWv8glMOFYAUwFcCeOayZ91N4VoULvuSd20YS+lgpHfOsNsU4wcqQ/dHp71d
         SsLrVR3mdO3yFsqvwEsXmJYTEf8CfMxGk7TADdqryHnkOJiAYxWd0E3Q+yzc7MGYjNJ3
         +qXeyAwD54XSze/Gin2GLFFEGtRs7/xqqG/ipYvcWQB3nNNtyip0EV5UpVqNtuBdtWuX
         vqmA==
X-Gm-Message-State: AOAM533GVfDHfbIo4oAS48MAOxHoRfTA+1EugTiZFw8oieZFwXF945nl
	tX7T4/dGFFWOgmdhp3eNSEtjgQ9o4L8=
X-Google-Smtp-Source: ABdhPJwIVZAsPTtdY7s/33Y9IxLRciwKAyNzbotER8p7TZSkeErswPhOGUzXkatH9kbGdaYgY45QCg==
X-Received: by 2002:a4a:df18:: with SMTP id i24mr247039oou.68.1624897866822;
        Mon, 28 Jun 2021 09:31:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l2sm1624382otk.38.2021.06.28.09.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 09:31:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 28 Jun 2021 09:31:04 -0700
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
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH V2 2/7] watchdog: bcm2835_wdt: consider
 system-power-controller property
Message-ID: <20210628163104.GA444942@roeck-us.net>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
 <1622981777-5023-3-git-send-email-stefan.wahren@i2se.com>
 <f4e62eec-a1c3-7759-3de3-dec98064dc4a@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e62eec-a1c3-7759-3de3-dec98064dc4a@i2se.com>

On Tue, Jun 22, 2021 at 09:12:30AM +0200, Stefan Wahren wrote:
> Hi Guenter,
> 
> Am 06.06.21 um 14:16 schrieb Stefan Wahren:
> > Until now all Raspberry Pi boards used the power off function of the SoC.
> > But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
> > possibly cannot register the poweroff handler because the it's
> > already registered by this watchdog driver. So consider the
> > system-power-controller property for registering, which is already
> > defined in soc/bcm/brcm,bcm2835-pm.txt .
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  drivers/watchdog/bcm2835_wdt.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> > index dec6ca0..9490717 100644
> > --- a/drivers/watchdog/bcm2835_wdt.c
> > +++ b/drivers/watchdog/bcm2835_wdt.c
> > @@ -205,9 +205,13 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
> >  	if (err)
> >  		return err;
> >  
> > -	if (pm_power_off == NULL) {
> > -		pm_power_off = bcm2835_power_off;
> > -		bcm2835_power_off_wdt = wdt;
> > +	if (of_device_is_system_power_controller(pdev->dev.parent->of_node)) {
> > +		if (!pm_power_off) {
> > +			pm_power_off = bcm2835_power_off;
> > +			bcm2835_power_off_wdt = wdt;
> > +		} else {
> > +			dev_info(dev, "Poweroff handler already present!\n");
> > +		}
> >  	}
> >  
> >  	dev_info(dev, "Broadcom BCM2835 watchdog timer");
> 
> this isn't not applied yet. Can this go via the watchdog-next tree into
> 5.14?
> 
I applied it to my watchdog-next branch; it will be up to Wim to send
it upstream. Note that the patch does not how up in linux-watchdog
patchwork (no idea why, though), which is why it got lost.

Guenter
