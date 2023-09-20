Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF403CE79D4
	for <soc@archiver.kernel.org>; Wed, 20 Sep 2023 14:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82549C433CA; Wed, 20 Sep 2023 14:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF100C433C9;
	Wed, 20 Sep 2023 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695219599;
	bh=WMv9g2jQiKuYGV3KniPF0cSc49ZnslbR6v0u8pCZTco=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=R4omrAjRiJFvIguR1AjDC9fkjciXR46Cg+N1rwjCfmeYeir2GdKuOfJUvLs1pPUCl
	 3uR07ch8b1yMs6zmnX/pqGwkvyR3RbWAbx9+DUhV+HKXxdFxlSy5L8pFtVC3kMPA0r
	 DMXTuq4DB8CcP0dtc3WCorrdcTF7WIGuDNACf/qqxCYfg6bqjKiSPyPHQT0bWRbPQf
	 bg47wyVEYlUXilNfNtc3oBrZ6D8EJyOLu3GHyXPFblFNjcbazGd8s6f2RrPYKT0Z44
	 Gdm+LdFRWD5bvgFzcT8ycV4O4urw6Ev5tCHH8baMVfitsXcMg6G5z9xjYeqMAndSlg
	 2Fk6K0QxuL7AA==
Date: Wed, 20 Sep 2023 16:19:53 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/7] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20230920161953.6d952392@dellmb>
In-Reply-To: <ZQnn+Gi0xVlsGCYA@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-3-kabel@kernel.org>
	<ZQmUFPvIx91+ps6k@smile.fi.intel.com>
	<20230919171638.19bc1619@dellmb>
	<ZQnn+Gi0xVlsGCYA@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Tue, 19 Sep 2023 21:27:04 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Tue, Sep 19, 2023 at 05:16:38PM +0200, Marek Beh=C3=BAn wrote:
> > On Tue, 19 Sep 2023 15:29:08 +0300
> > Andy Shevchenko <andy@kernel.org> wrote: =20
> > > On Tue, Sep 19, 2023 at 12:38:10PM +0200, Marek Beh=C3=BAn wrote: =20
>=20
> ...
>=20
> > > >  obj-$(CONFIG_GOLDFISH)		+=3D goldfish/
> > > >  obj-$(CONFIG_CHROME_PLATFORMS)	+=3D chrome/
> > > >  obj-$(CONFIG_SURFACE_PLATFORMS)	+=3D surface/
> > > > +obj-$(CONFIG_CZNIC_PLATFORMS)	+=3D cznic/   =20
> > >=20
> > > Why not ordered (to some extent) here (as you did in the other file)?=
 =20
> >=20
> > Where should I put it? The other entries are not ordered, see
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/platform/Makefile?h=3Dv6.6-rc2 =20
>=20
> With the visible context above, at least after chrome already much better=
, no?

OK

...=20
> > > Missing types.h, sysfs.h, mod_devicetable.h, i2c.h, ... =20
> >=20
> > i2c.h comes from turris-omnia-mcu.h. The others I will fix. Does the
> > the .c file also include all those headers if it includes a local
> > header already? =20
>=20
> For generic ones, yes.

OK

> > > > +	if (ret < 0)   =20
> > >=20
> > > Can it return positive value? What would be the meaning of it? =20
> >=20
> > Originally I had it return 0 on success, but recently I've had a
> > discussion about this same thing with LED subsystem maintainer about
> > some LED patches, Lee Jones, who requested the _read function to return
> > number of bytes read on success. See at
> >   https://lore.kernel.org/linux-leds/20230821122644.GJ1380343@google.co=
m/
> > where he says:
> >   Read and write APIs, even abstracted ones such as these generally
> >   return the number of bytes successfully read and written respectively.
> >   If you are going to normalise, then please do so against this
> >   standard.
> > I do not agree with him, since this is a local command accessor which
> > only succeeds if all the bytes are read/written as requested. But I
> > adjusted my code as per his request since he is the maintainer. =20
>=20
> This is strange. For example, regmap APIs never returns amount of data wr=
itten
> or read. I think it's solely depends on the API. It might be useful for i=
=C2=B2c
> APIs, in case you can do something about it. but if you have wrappers on =
top
> of that already (meaning not using directly the i2c_*() calls, I dunno the
> positive return is anyhow useful.

I shall change it back then.

...

> > > > +	int status;   =20
> > >=20
> > > My gosh, it's a _third_ name for the same! =20
> >=20
> > The variable holds value of the status register, which is needed at
> > another point in this function. I thought naming it just "ret" would
> > cause confusions... Do you really propose to rename it such? =20
>=20
> It's not bad per se, just put yourself on the place of somebody who would=
 like
> to understand the semantics of all these variables. Maybe you can add a c=
omment
> on top explaining that (in short)?

OK

> > > > +	for (int i =3D 0; i < ARRAY_SIZE(features); ++i) {   =20
> > >=20
> > > Why signed? =20
> >=20
> > Because it is shorter and makes no difference and there are tons of
> >   for (int i =3D 0; i < ARRAY_SIZE(x); i++)
> > in the kernel already. But if you really want, I can change it. Please
> > let me know. =20
>=20
> It just makes harder to get the code, because of possible unneeded questi=
ons
> like "if it's a signed type, maybe it's on purpose?"

OK

> > > Why pre-increment? =20
> >=20
> > Again, it makes no difference, is widely used in the kernel and I
> > personally prefer it. But I will change it if you want. =20
>=20
> Pre-increment usually also a sign of something special about the iterator
> variable. In non-special cases we use post-increment. And if you count
> the use of each you will see the difference.

OK

...

> > > > +	if (likely(ret =3D=3D ARRAY_SIZE(msgs)))   =20
> > >=20
> > > Why likely()? Please, justify. =20
> >=20
> > Becuase it is unlikely the I2C transaction will fail. In most cases, it
> > does not. =20
>=20
> Yes, but why likely() is needed? So, i.o.w. what's the benefit in _this_ =
case?

Compiler optimization (one branch avoided). But I guess this isn't a
hot path, since I2C is insanely slow anyway. OK, I shall remove the
likely() usage.

> ...
>=20
> > > > +enum commands_e {   =20
> > >=20
> > > Are you sure the name is unique enough / properly namespaced?
> > > Same Q to all enums. =20
> >=20
> > I can change it. I wanted it to be compatible with the header in the
> > firmware repository. =20
>=20
> Are these being generated, or also statically written in that repo?
> If the latter, I think better to use more unique naming schema in
> the kernel.

OK, I shall add some prefix.

Marek
