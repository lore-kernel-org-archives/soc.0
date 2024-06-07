Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D56C27C53
	for <soc@archiver.kernel.org>; Fri,  7 Jun 2024 16:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F844C4AF08; Fri,  7 Jun 2024 16:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9DCC2BBFC;
	Fri,  7 Jun 2024 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717776922;
	bh=EVU9N0licjs0UeJIOtiEuJJs/gF6eA2Qsud/PZcHqMY=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=siH9tGINYS+RQSfGXjlHx2/ykdX/Teg1wxvSW1B/kiE5GxbUG0UjZD04NOgfBDVEr
	 wg1etkPy8l9TMT8JZmkCCxlhT15Llg1swybG3uGyxX9AcvRgnePzfPQwibUVsYRECg
	 4jk7AR24YxQgy3bNzBCRXCg+EENGe1kffAbEBt8/4nlCL7cKhIMGlP5x6W8129E2qO
	 76R6oyoEsyrXu5tWZ5EQeRTgR7sEejG4j8vcpnK3PoZ18OPPsQwRDl3uMw8vmvyWMz
	 q+F5J0XtamCzxiDvKegkF9t9nEsu28kCP3PE0Tw1kc9bpemzf+qJa173vXHEXLd7NG
	 Fve3WFN9OfOZw==
Date: Fri, 7 Jun 2024 18:15:16 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Olivia Mackall
 <olivia@selenic.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-crypto@vger.kernel.org
Subject: Re: [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
Message-ID: <20240607181516.72edb60a@dellmb>
In-Reply-To: <ZmLhQBdmg613KdET@gondor.apana.org.au>
References: <20240605161851.13911-1-kabel@kernel.org>
	<20240605161851.13911-7-kabel@kernel.org>
	<ZmLhQBdmg613KdET@gondor.apana.org.au>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Jun 2024 18:30:24 +0800
Herbert Xu <herbert@gondor.apana.org.au> wrote:

> On Wed, Jun 05, 2024 at 06:18:49PM +0200, Marek Beh=C3=BAn wrote:
> >
> > +static int omnia_trng_read(struct hwrng *rng, void *data, size_t max, =
bool wait)
> > +{
> > +	struct omnia_mcu *mcu =3D (struct omnia_mcu *)rng->priv; =20
>=20
> Please don't cast rng->priv in this manner.  Please take a look at
> drivers/char/hw_random/bcm2835-rng.c for how it should be done.
>=20
> Thanks,

THX, prepared for next version.
