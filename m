Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2902C4345F
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 16:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A34C9C2BD11; Tue, 23 Apr 2024 16:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B455C116B1;
	Tue, 23 Apr 2024 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713890639;
	bh=BFQ92V4Z/xX64CrTExX5fx8ZINfEjGS/nDWxNQoRNE4=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=VCMhUxqVN9fDeELly/4TWoKT2+3lnzK3r4JJrhMnNZiGcsUjvPLo/n06CtplOfQNj
	 8kX1AH3a2qaeRAAYjdgIpkzSSSjj/weLzGKlKr+Z2HSSdimMPfWUlS3C6jD62p+J7W
	 vOXqRmSIbRhZolfSxDvCyGQLjlDJysKfsj1Kis2f2yisvyZWSzLFgyPRr9siAKfDit
	 afDwTOKSmB9QWjw3lfpaXb0+5w0yWqtsxD2h0Z0FLuIkmjhCJ7pSE856kN3U8EL+VZ
	 zs8nRXMO1qB9fOt+DVrG6R31PAmzCzchsbVtmMQVdp9Xutn2crlBotJOXS5Ibna8z9
	 5sWLyRVyOezGw==
Date: Tue, 23 Apr 2024 18:43:46 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, Hans de Goede <hdegoede@redhat.com>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, arm@kernel.org
Subject: Re: [PATCH v6 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <20240423184346.37eb0915@thinkpad>
In-Reply-To: <Zifi0Iw8iVNvhptE@smile.fi.intel.com>
References: <20240418121116.22184-1-kabel@kernel.org>
	<20240418121116.22184-9-kabel@kernel.org>
	<ZifbjfBg0lBRkpoS@smile.fi.intel.com>
	<20240423182014.7ae8cdc3@thinkpad>
	<Zifi0Iw8iVNvhptE@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Apr 2024 19:33:20 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Apr 23, 2024 at 06:20:14PM +0200, Marek Beh=C3=BAn wrote:
> > On Tue, 23 Apr 2024 19:02:21 +0300
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote: =20
> > > On Thu, Apr 18, 2024 at 02:11:13PM +0200, Marek Beh=C3=BAn wrote: =20
>=20
> ...
>=20
> > > > +static inline struct dentry *
> > > > +devm_debugfs_create_dir(struct device *dev, const char *name,
> > > > +			struct dentry *parent)
> > > > +{
> > > > +	struct dentry *dentry;
> > > > +	int err;   =20
> > >  =20
> > > > +	dentry =3D debugfs_create_dir(name, parent);
> > > > +	if (IS_ERR(dentry))
> > > > +		return dentry;   =20
> > >=20
> > > Why do we care?
> > >  =20
> > > > +	err =3D devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_=
drop,
> > > > +				       dentry);
> > > > +	if (err < 0)
> > > > +		return ERR_PTR(err);
> > > > +
> > > > +	return dentry;
> > > > +}   =20
> > >=20
> > > static inline struct dentry *
> > > devm_debugfs_create_dir(struct device *dev, const char *name, struct =
dentry *parent)
> > > {
> > > 	struct dentry *dentry;
> > > 	int err;
> > >=20
> > > 	dentry =3D debugfs_create_dir(name, parent);
> > >=20
> > > 	err =3D devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_dro=
p, dentry);
> > > 	if (err)
> > > 		return ERR_PTR(err); =20
> >=20
> > But if the dir creation fails, there is no need to allocate devm
> > destructor... =20
>=20
> Yes, but why do we care about that?
> debugfs is designed the way that we should ignore errors from it.
>=20
> This discussion let me think, that probably the best solution is to add a=
 field
> to struct device_driver to handle this.
>=20
> debugfs will appear only when device is completely instantiated, removed =
before
> anything, and a lot of other benefits (see the story behind dev_groups as=
 a
> reference).
>=20

Okay, this seems way beyond the scope of what I am trying to do here.

Since Matti is also not entirely content with these additions to the
devm-helpers.h header and you suggested to use gpiod_to_irq(), I shall
drop these changes from the next version and just use
devm_add_action_or_reset() in the driver directly.

Marek
