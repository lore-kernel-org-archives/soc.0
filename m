Return-Path: <SRS0=XAKR=K4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48D4C47083
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 10:42:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E2C6108D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 10:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84E2C6108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwTUXfrLF/c1y+yTYifUXilkWg6ZUI5JsUG5uyjfNyA=; b=NAo1L4W81R35/q
	v3eXz0kB8bTxKStiaE8fCXabPLhFE+flIX/ID5uNutuWn0Aj6+Ak7mfEINUCUR8290EsKhm/klof4
	3DjeAZXH3gc/sAawGSPViuufMpCGXXxrix42mo0JlDHJU4FmfmkWIvG/W1f5IKaHFy/FTJ7zDYwyd
	vz/GfQfZx8qWLrQ0LBgR9ZpsZxJjjsGPIis6oOaGh71n5SPHxn4tHlT3swh7OlrP4JB7tneEFirRj
	mTWNWkoWiNsN5bpbnttZnMuIR336RvyT8p5e+thne9Yw0asoyW3JBEBERUotekW9+sXG41IRDemhW
	WkEyKQPT7bgAVmsSlGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loOIY-003P66-4G; Wed, 02 Jun 2021 10:40:31 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loOIR-003P3R-Dc; Wed, 02 Jun 2021 10:40:24 +0000
Received: by mail-oi1-x233.google.com with SMTP id a21so2210805oiw.3;
 Wed, 02 Jun 2021 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JlqO9gRfl1QVrQ5sFutQl1oSqzDRUSVAEh2YPKcjxjQ=;
 b=MPKW6bQjvYfIb/pY3AeWm3TH458u++5YGbJLZw47lYTzLQDuvCqDwttSuyFB3oq8Us
 G/6m6NK0VblXpHLdxpwzfUz4oPEbsrGpHogAcmYkgkv8gvzPopCsMND/5HTHJf56gO42
 9aZInFo7dT86LfEZ6H2yEXqkMBoKQE/MLQ87MNGNiwG1rWo9UXRqsniBRf5zc7RFysd1
 1YzEPd1ggvt480RhdnuTn07Kp6ruawfpq8nYwX4GLthExL2ON02vveXRDHFMhQhal06O
 gkoqBr7ZHuB+7m5K/ETPAz9ZxgU1mRawQbn1do9UytvCPtwmkojeVRLBWwirJvbe9Lk/
 Ri6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=JlqO9gRfl1QVrQ5sFutQl1oSqzDRUSVAEh2YPKcjxjQ=;
 b=ZY8yyMHqEepcigCvIeEdS8AVqMu+7Z82AKZtpvRLIg8kTEkWq1UlGH5aCt6TY/HvZO
 3uFdx4eLMCHyIf/r855tCXIQibHCzh3NxN899seKbZWcrz4YdJcaQqoPPfz7F4dy0rLp
 FwS7Ryv18fBaPPTqVZcBBwHzuzjd6ymxjUI3hFaaLwLblqFIWkfeoQwkDVMET8CaznxS
 iTsEplRJmq3UK8jqeSD7EDg0m3ExocjCjQELC9LNb94eD+wsZzOciibovl33fmAkYoCa
 fOrzhbPurEM7XbqZcPWV+YqXZgB55MB6v0+qG1tgo+/a8Oyl+2Y6ZFlzkWQgwf2wUVkg
 IZuw==
X-Gm-Message-State: AOAM533vk8aESMThOW+xDm8DsWJV9TZJOKmquU+GS/b+yW8Ntjmb9+30
 jnWJ8+grrF8O75/78DmKoZU=
X-Google-Smtp-Source: ABdhPJwJhf7Q3rZlC39gDTHaWCNM9Xa+lpvV9Eaqi8tD1eHZ+IDnlHmCihZBblQOxw43dRjDKtd9iQ==
X-Received: by 2002:a54:4809:: with SMTP id j9mr3113440oij.14.1622630422059;
 Wed, 02 Jun 2021 03:40:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 12sm1904012ooy.0.2021.06.02.03.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:40:21 -0700 (PDT)
Date: Wed, 2 Jun 2021 03:40:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: nicolas saenz julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/6] watchdog: bcm2835_wdt: consider
 system-power-controller property
Message-ID: <20210602104019.GB1865238@roeck-us.net>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
 <e61ba6f5b906fd26a61e9c79ef4dcf4792a364d7.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e61ba6f5b906fd26a61e9c79ef4dcf4792a364d7.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_034023_524842_A5423B3E 
X-CRM114-Status: GOOD (  25.49  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210602104019.96YmFXEHH1C9J0MMv5UYadUaa5wNWkpYc1AoLO4g9cg@z>

On Tue, Jun 01, 2021 at 11:43:27AM +0200, nicolas saenz julienne wrote:
> On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> > Until now all Raspberry Pi boards used the power off function of the So=
C.
> > But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
> > possibly cannot register the poweroff handler because the it's
> > already registered by this watchdog driver. So consider the
> > system-power-controller property for registering, which is already
> > defined in soc/bcm/brcm,bcm2835-pm.txt .
> > =

> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > ---
> > =A0drivers/watchdog/bcm2835_wdt.c | 10 +++++++---
> > =A01 file changed, 7 insertions(+), 3 deletions(-)
> > =

> > diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_=
wdt.c
> > index dec6ca0..9490717 100644
> > --- a/drivers/watchdog/bcm2835_wdt.c
> > +++ b/drivers/watchdog/bcm2835_wdt.c
> > @@ -205,9 +205,13 @@ static int bcm2835_wdt_probe(struct platform_devic=
e *pdev)
> > =A0	if (err)
> > =A0		return err;
> > =A0
> > =

> > -	if (pm_power_off =3D=3D NULL) {
> > -		pm_power_off =3D bcm2835_power_off;
> > -		bcm2835_power_off_wdt =3D wdt;
> > +	if (of_device_is_system_power_controller(pdev->dev.parent->of_node)) {
> > +		if (!pm_power_off) {
> > +			pm_power_off =3D bcm2835_power_off;
> > +			bcm2835_power_off_wdt =3D wdt;
> > +		} else {
> > +			dev_info(dev, "Poweroff handler already present!\n");
> =

> nit: shoudln't this be a warning?
> =

No. If anything, it should not be there in the first place, but I didn't wa=
nt
to argue about it. It is perfectly valid for a system to have more than one
means to reset it, meaning this message is just noise. Making it a warning
would just make it worse.

Guenter

> Other than that,
> =

> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> =

> Regards,
> Nicolas
> =

> =


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
