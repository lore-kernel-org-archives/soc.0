Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C04DC004C0
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 15:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED6D7C433CA; Mon, 23 Oct 2023 15:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC0FC433C8;
	Mon, 23 Oct 2023 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698073204;
	bh=uAPqaNv940opL9iABBuhDACrPdR2GXnfEPbNduFfEjY=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=oH0D423XEp2Uhxn7nfKSBXidORjmj/9SRBpEnmger/2yHfAiH8QBSLsg8QkOke86d
	 PmnblBm9n7kX5wTM4xc+RXkpDtuj2ZEDgxy3ugJAs3eHnxM9zdg8DuEGe6Rop3eFjI
	 9M5ObdeJznnaKZ8S/PWSsci01N/RTjPi6UzMJ7Otxx2ItoesL6APq8ZwHzf3QLTavs
	 GRI+d679f85KgTJpa7EOKBL23Hxzvhyps9WchgJlYtpX2+yFaYadZByH3cLqvoaH0p
	 XzhRq0OMQ0q7smaYcsqO6hiZdCJCUCcqy+Nk4LzFIN2MkYgx8yr6g0w/4vi132Bmvx
	 qdMm6eD0yuLwg==
Date: Mon, 23 Oct 2023 16:59:59 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, linux-watchdog@vger.kernel.org, Wim Van
 Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v3 5/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <20231023165959.104f6843@dellmb>
In-Reply-To: <2439af40-0c78-6b41-1746-c71b67af217a@roeck-us.net>
References: <20231023143130.11602-1-kabel@kernel.org>
	<20231023143130.11602-6-kabel@kernel.org>
	<2439af40-0c78-6b41-1746-c71b67af217a@roeck-us.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Oct 2023 07:47:44 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 10/23/23 07:31, Marek Beh=C3=BAn wrote:
> > Add support for the watchdog mechanism provided by the MCU.
> >=20
> > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org> =20
>=20
> Any reason for keeping this out of drivers/watchdog ?

Because this whole thing is compiled as one driver, turris-omnia-mcu.ko.
The whole driver is specific for one device, the Turris Omnia router.
Splitting it into separate modules would be unnecessary, the driver is
meant to provide all the Turris Omnia MCU functionality.

I've seen this done in various platform drivers.

Moreover, all of the functionality lives at one I2C address, so only
one I2C client is used.

Originally it was one .c file, but I split it into 4 files to make it
easier to review.

You can look at the other patches at
  https://patchwork.kernel.org/project/linux-soc/list/?series=3D795666

> > +	if (!(mcu->features & FEAT_WDT_PING))
> > +		return 0;
> > + =20
>=20
> Why check this here and not in the calling code ?

No particular reason, just wanted to keep the calling code cleaner.

> > @@ -36,6 +37,9 @@ struct omnia_mcu {
> >   	struct rtc_device *rtcdev;
> >   	u32 rtc_alarm;
> >   	bool front_button_poweron;
> > +
> > +	/* MCU watchdog */
> > +	struct watchdog_device wdt; =20
>=20
> This should be internal to the watchdog driver.

As explained above, all functionality is provided in one kernel module.
This makes sense here since the driver is meant to provide all
MCU functionality and it is specific for Turris Omnia.

Marek
