Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B35C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 11:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00B5CC2BD10; Mon, 17 Jun 2024 11:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C2FC4AF1D;
	Mon, 17 Jun 2024 11:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718622121;
	bh=XZEVBAZJbFt1IjMPHf+DtYgSApVmJGb0CGuC7FZ01/A=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=rdhMFYzn2blhdggMm2Bfpp9FJ444RNmULY7MtVNLplI/xrQhzAvZl3+JbgZdtLNSw
	 jq+Awe1RLRcR/1LWQiXGUgJe2il2AaoK/q6zm6hA90EG4sxWCv/0+H08h3/SKNqE8t
	 0SD5+rFhHLS5puoJ+KVsrlbc9jCQBzVp7J6TwJ8WbkuVlOb9OGiCz1LDfI34Awwkik
	 kbZDSD+ELLi3ZEu8FSv+bbh1T+WE+SNOlhnQHVYbuHt2tBdo2qxJ8rTPgRJBljCn8R
	 8RfrQSRZO4SdKCXoMzdmWY068I2XuVamMOclAwEyf6xCGYm0jBbsMWJDgVAeDjZ8a4
	 Wu6z+6uyzY03w==
Date: Mon, 17 Jun 2024 13:01:56 +0200
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
Message-ID: <20240617130156.05bcab00@dellmb>
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

IMO rather to drop the symlink (which is created for backwards
compatibility anyway) in the improbable case that
devm_add_action() fails, then than to leave it dangling there on driver
unbind.
