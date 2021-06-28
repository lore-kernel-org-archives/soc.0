Return-Path: <SRS0=YMvz=LW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E46C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jun 2021 16:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729EC6144F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jun 2021 16:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729EC6144F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHZHTZFn8UYYna7b5Elrn7DMuhUGR81FFdakIQCrzUM=; b=js81faAIAa9vbu
	i7fh17BX+SKZfdIpnbpkELO4IcqP+IS/lmV7hZmyvyOVDXYtSeFCFk9WYONo08r8qT5SmbE2Kbbix
	KDUyCSO1AJ7VxMvwOh1VHd+eusdv97ITAuvrlWc+jvyfEIo8tSLesZsPSs9Wc85GAiL29nZqHlMTm
	AsGUPjZ7jokfzpXvSIMUiNhNsONVsh6xD6PiJbCJe3uXaCjCU5UOLrvBAgnUMB1J8CCiX8Bn8VryP
	5hosQAkofdNhXV2fJqESkk98uV8ruRc2k/h7F9z1KPPJLEqfSz7yT+J9l6e2bTyE48xbOQfVAwk/C
	spBh77NWJdgoLU7PAHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxuKe-008gD2-Iq; Mon, 28 Jun 2021 16:42:03 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxuA8-008cTJ-UQ
 for linux-arm-kernel@lists.infradead.org; Mon, 28 Jun 2021 16:31:11 +0000
Received: by mail-oo1-xc32.google.com with SMTP id
 v3-20020a4ac9030000b029024c9d0bff49so977499ooq.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 28 Jun 2021 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=NXC9ncRikm0p3T8bW5aBZvUIKicls13a9zwFqcXYKgB8bx7woI5OyBvPVb8y4Odkpu
 q/+lJ3Tjs53LkVPSvbMvZdEn7XpBQuVYr/4e+c3TY10W2lqa8BdAx1mT6ZTiOLALymCG
 u783bdlSZ7MisA1AcuLA+YJcLOsVKqP6DYT6N4HHHPEcD2eFcFvcN2+u+XbHPkTccqDk
 yk81ITmVoWxjA+WPgCCeQBjo2hRaWcdJ58jUQ1+BpXzJupg5xDJns7KHymEdPz0OWHUR
 S5BGwq24DWH2CW2xZDQDEak4ns3aqD0S+O/cPa2Ywl0OmHgbF7pJ+x5pqLT/ye9NJOCZ
 FHrQ==
X-Gm-Message-State: AOAM530G7Cf47mIi8mSgpGmbZfYAQ0vAd4PjbL32/7sdOdh1/cJq7wVY
 f0w3e41/7+BvF59skIkJSYY=
X-Google-Smtp-Source: ABdhPJwIVZAsPTtdY7s/33Y9IxLRciwKAyNzbotER8p7TZSkeErswPhOGUzXkatH9kbGdaYgY45QCg==
X-Received: by 2002:a4a:df18:: with SMTP id i24mr247039oou.68.1624897866822;
 Mon, 28 Jun 2021 09:31:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l2sm1624382otk.38.2021.06.28.09.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:31:06 -0700 (PDT)
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
Content-Disposition: inline
In-Reply-To: <f4e62eec-a1c3-7759-3de3-dec98064dc4a@i2se.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_093109_065953_1423B3E8 
X-CRM114-Status: GOOD (  26.57  )
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
Message-ID: <20210628163104.mbRAkTW6Jnv8SguFTFog_pUVzUD8fNoYYjUIFpbw_Z0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
