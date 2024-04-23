Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0AEC04FFE
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 16:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D22B0C3277B; Tue, 23 Apr 2024 16:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B01C116B1;
	Tue, 23 Apr 2024 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713889239;
	bh=dOzHpdqiINcQK8dwCoL5qWvSMBimhZb0EaPVD81Gwjs=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=Msm9UsIbRD0kGRj8MTa+gsWCtA5uKlte/REb4uGQaMdzgrPTjrBuxCEEfbG6kItZp
	 guOhIJ4leYvIlxuvZyKgebEyTpbvET1ECUP0PKwfgsg9ooyEOYEXaHJChirsSyCe0O
	 6nVApfpuGAlIYVMWuFMsCdokMR8ZJP494/Xv5lXWUwlClJbK8NOPeBFTmh8+08gUM9
	 A+Ife9MMYH98q7e0HBOboJm3PVLYiIG472o++7IivfWxK+zjhOE3+KWbp5jEmg7/TG
	 3Xv95n39ZhIDzojxQN/4Xe0A0G19A4xhiU4ft2Qq/66133DMpQ2HYpVRF7qQLoWEMu
	 qCp+RU9rHv83A==
Date: Tue, 23 Apr 2024 18:20:14 +0200
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
Message-ID: <20240423182014.7ae8cdc3@thinkpad>
In-Reply-To: <ZifbjfBg0lBRkpoS@smile.fi.intel.com>
References: <20240418121116.22184-1-kabel@kernel.org>
	<20240418121116.22184-9-kabel@kernel.org>
	<ZifbjfBg0lBRkpoS@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Apr 2024 19:02:21 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Apr 18, 2024 at 02:11:13PM +0200, Marek Beh=C3=BAn wrote:
> > A few drivers register a devm action to remove a debugfs directory,
> > implementing a one-liner function that calls debufs_remove_recursive().
> > Help drivers avoid this repeated implementations by adding managed
> > version of debugfs directory create function. =20
>=20
> ...
>=20
> > +static inline struct dentry *
> > +devm_debugfs_create_dir(struct device *dev, const char *name,
> > +			struct dentry *parent)
> > +{
> > +	struct dentry *dentry;
> > +	int err; =20
>=20
> > +	dentry =3D debugfs_create_dir(name, parent);
> > +	if (IS_ERR(dentry))
> > +		return dentry; =20
>=20
> Why do we care?
>=20
> > +	err =3D devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> > +				       dentry);
> > +	if (err < 0)
> > +		return ERR_PTR(err);
> > +
> > +	return dentry;
> > +} =20
>=20
> static inline struct dentry *
> devm_debugfs_create_dir(struct device *dev, const char *name, struct dent=
ry *parent)
> {
> 	struct dentry *dentry;
> 	int err;
>=20
> 	dentry =3D debugfs_create_dir(name, parent);
>=20
> 	err =3D devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop, d=
entry);
> 	if (err)
> 		return ERR_PTR(err);

But if the dir creation fails, there is no need to allocate devm
destructor...
