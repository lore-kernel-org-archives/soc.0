Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBAFC2BA18
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 11:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70A81C4AF1D; Mon, 17 Jun 2024 11:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA28C2BD10;
	Mon, 17 Jun 2024 11:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718622267;
	bh=B/ShITfVM3uNgRuDsMH7yuMF6CoQSNdyRFB4wOB+v1o=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=LY6puNVbyXphuHXmE/sfEO4m/8e+p4ej1IRpXV+m8u6EJBRnN8E9OGYJsljcAYzWu
	 DC+M6azobzJMxPDNbTg1B8ozO/yiKWpFUk5BJTv0k7EHak+PM/oKJIGj3qG+dPY4Dn
	 53dGIq2tdFkjzzRf2WWX+ocoq8jXCclrHTm7CamNGZHr9BlfQZUY5yQ+PK6lLieWYp
	 IdlbhQLORLCMKBypoGRAuKsnoSuOz1o7mZnfxlpWvUp8df80rfnwPe9wp0ydyr2ubC
	 TKZ8ChQuKp1KOTKWz+gd8Dp+kHiJmkUFY6rWG1+M6gSJ+h3ykJs710rGxwymlFuSLA
	 hXIfQwyh5Dgyg==
Date: Mon, 17 Jun 2024 13:04:20 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 08/17] firmware: turris-mox-rwtm: Don't create own
 kobject type
Message-ID: <20240617130420.11a63f23@dellmb>
In-Reply-To: <CAHp75VdYqsrOwxCS+knjgFPHRWL_A8rvkW9TkZJPKq9g+oAbrg@mail.gmail.com>
References: <20240613161045.29606-1-kabel@kernel.org>
	<20240613161045.29606-9-kabel@kernel.org>
	<CAHp75VdYqsrOwxCS+knjgFPHRWL_A8rvkW9TkZJPKq9g+oAbrg@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 22:32:28 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.or=
g> wrote:
> >
> > In order to create attribute files in /sys/firmware/turris-mox-rwtm,
> > this driver creates it's own kobject type. =20
>=20
> its
>=20
> > Simplify this by dropping this own kobject creation, and instead
> > creating standard device attribute files.
> >
> > For backwards compatibility with sysfs ABI, create a symlink
> > /sys/firmware/turris-mox-rwtm, pointing to this device's sysfs
> > directory. =20
>=20
> ...
>=20
>=20
> > +static void rwtm_firmware_symlink_drop(void *) =20
>=20
> Interesting, can we actually name the parameter, like "unused"?
>=20
> > +{
> > +       sysfs_remove_link(firmware_kobj, DRIVER_NAME); =20
>=20
> But why not provide a fimware_kobj pointer as a parameter?
>=20
> > +} =20
>=20
> ...
>=20
> > +       /*
> > +        * For sysfs ABI compatibility, create symlink
> > +        * /sys/firmware/turris-mox-rwtm to this device's sysfs directo=
ry.
> > +        */
> > +       ret =3D sysfs_create_link(firmware_kobj, &dev->kobj, DRIVER_NAM=
E);
> > +       if (!ret)
> > +               devm_add_action_or_reset(dev, rwtm_firmware_symlink_dro=
p, NULL); =20
>=20
> This means that it will remove the link in case devm_add_action()
> fails. Is it okay?
>=20

Alternatively I could fail .probe() in case devm_add_action() fails. It
is improbable anyway.
