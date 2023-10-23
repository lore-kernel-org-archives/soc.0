Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DAFC001E0
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 15:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90B2EC433CA; Mon, 23 Oct 2023 15:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5979AC433C8;
	Mon, 23 Oct 2023 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698073799;
	bh=z/iJ1nBAG1oDeFE8eYWYdvKXk35Jo0LOxIZ2KMMfyfs=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=k2Wuzd+HmRcS5AqhbF61FqrIiKO08U3aCW/TZEDL49I69qkZ4SC2tlEncLx3SgOrB
	 CFThliL2hOpQhN7lS12z/NqhLEVaoFdTIbh5IcKLd45dq2o6v9kuRnm9iMu+qNyAvU
	 W1oyTydfhizJ9q4y0fUBrmcIlpLVOhTgKA2oamx3QtriwNVNFbBS9fhHJ6D8VApFPk
	 PQ+dS2OA1JMRdn9mke+csdvK8RU2Wpqm6AC+pH7IsjA58kI/tG3++bVL6GjgeP10cx
	 dBB44GCaD34RaQ5fQYvaQrEVG7qstyDt0zq9A46yYk+YCmKer0IK3Vc8YDg6nSWHr6
	 WHUyYbtXdQkzg==
Date: Mon, 23 Oct 2023 17:09:54 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v3 5/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <20231023170954.51e7ebf8@dellmb>
In-Reply-To: <89295349-198d-4ae6-942e-913f95e34974@sirena.org.uk>
References: <20231023143130.11602-1-kabel@kernel.org>
	<20231023143130.11602-6-kabel@kernel.org>
	<2439af40-0c78-6b41-1746-c71b67af217a@roeck-us.net>
	<20231023165959.104f6843@dellmb>
	<89295349-198d-4ae6-942e-913f95e34974@sirena.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Oct 2023 16:03:08 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Oct 23, 2023 at 04:59:59PM +0200, Marek Beh=C3=BAn wrote:
> > Guenter Roeck <linux@roeck-us.net> wrote: =20
> > > On 10/23/23 07:31, Marek Beh=C3=BAn wrote: =20
>=20
> > > > Add support for the watchdog mechanism provided by the MCU. =20
>=20
> > > Any reason for keeping this out of drivers/watchdog ? =20
>=20
> > Because this whole thing is compiled as one driver, turris-omnia-mcu.ko.
> > The whole driver is specific for one device, the Turris Omnia router.
> > Splitting it into separate modules would be unnecessary, the driver is
> > meant to provide all the Turris Omnia MCU functionality. =20
>=20
> > I've seen this done in various platform drivers. =20
>=20
> > Moreover, all of the functionality lives at one I2C address, so only
> > one I2C client is used. =20
>=20
> That all sounds a bit like drivers/mfd...

Hi Guenter,

I would have thought so as well, but several years ago I sent a driver
into mfd, and I've been told (I don't remember by who anymore, but I
can find it) that mfd is supposed to contain drivers for multifunction
devices that can be contained on different boards, and that my driver
should go to platform, since it is specific for one hardware.

Marek
