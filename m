Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D8CC4345F
	for <soc@archiver.kernel.org>; Wed, 24 Apr 2024 18:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EBC8C4AF08; Wed, 24 Apr 2024 18:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D1CC113CD;
	Wed, 24 Apr 2024 18:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713984688;
	bh=wuqoVsKfWk0PSe/Fq3OPqV5+lTblj3Bvn4lqt7+ZabE=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=pRQvg9jFGkEV/0NmQFWrf0bV6sz+HAw5nWzEzjS0sYAjHn51GRAa8ItDkRNWzc5H1
	 c5Qh7pPtXiltOdVP52TgDbYpXxvl6zma0cOxjj2gooNedBzL7p+Nei1AjXWTffiaKQ
	 UayoaqtgdFNBfXjQpYG9YQYnwauSZLmuEa5UQlxC62FlKPy87wVy8MgLiia7x3g2YN
	 PH/9CYCPFM3AtAvdFxfLoB7SKPoj/QNSYP3SJOnmUtUr04wS7y9cEFs4t3DDQ5D61z
	 Y+1RuMusGsQ9un/1XMpZ8YPfoS3HE717YVTVtuzk/2eDJZG3oEiHUdjgSF7Z/PtyiS
	 6xLFQKeyeMYwA==
Date: Wed, 24 Apr 2024 20:51:23 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v7 6/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
Message-ID: <20240424205123.5fc82a1a@dellmb>
In-Reply-To: <ZilQiHLLj1eQxP2L@smile.fi.intel.com>
References: <20240424173809.7214-1-kabel@kernel.org>
	<20240424173809.7214-7-kabel@kernel.org>
	<ZilQiHLLj1eQxP2L@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2024 21:33:44 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Wed, Apr 24, 2024 at 07:38:05PM +0200, Marek Beh=C3=BAn wrote:
> > Add support for true random number generator provided by the MCU.
> > New Omnia boards come without the Atmel SHA204-A chip. Instead the
> > crypto functionality is provided by new microcontroller, which has
> > a TRNG peripheral. =20
>=20
> ...
>=20
> > +static void omnia_irq_mapping_drop(void *res)
> > +{
> > +	irq_dispose_mapping((unsigned int)(unsigned long)res);
> > +} =20
>=20
> Leftover?

What do you mean? I dropped the devm-helpers.h changes, now I do
devm_add_action_or_reset() manually, with this function as the action.

> > +int omnia_mcu_register_trng(struct omnia_mcu *mcu)
> > +{
> > +	struct device *dev =3D &mcu->client->dev;
> > +	u8 irq_idx, dummy;
> > +	int irq, err;
> > +
> > +	if (!(mcu->features & FEAT_TRNG))
> > +		return 0;
> > +
> > +	irq_idx =3D omnia_int_to_gpio_idx[__bf_shf(INT_TRNG)];
> > +	irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx));
> > +	if (irq < 0)
> > +		return dev_err_probe(dev, irq, "Cannot get TRNG IRQ\n"); =20
>=20
> > +	err =3D devm_add_action_or_reset(dev, omnia_irq_mapping_drop,
> > +				       (void *)(unsigned long)irq);
> > +	if (err)
> > +		return err; =20
>=20
> Are you sure it's correct now?

Yes, why wouldn't it?
