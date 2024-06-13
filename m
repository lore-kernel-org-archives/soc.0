Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BDAC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 09:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D638C4AF1D; Thu, 13 Jun 2024 09:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B985C2BBFC;
	Thu, 13 Jun 2024 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718272480;
	bh=smDlVgPEQ/JrlQkuOnzk2oHBi+NW821IchIWaN2nIao=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=FnYlY7imNb2VZxTqXRwQ4/7PnLdyvbKrYUE4oci1QljRqlGbyxDYS9I3RAS5RCYul
	 8FHMQddN+zNAZ4FzCuusF//Gxf0FzEN3Lgk7Ucb0BKJH6TgvnuR1KuP7r50VTgWhEW
	 cawKKhgd/2FOxlOq6BCfxEc565nuWzPULJWDh4NPDvsLsoWX43oe5k8zYzR1ABeZit
	 0qqf4+uZzeZVWPAHrTt6PBaPHArhxIWKV62cRSvTjiz4NDywWpjrsiYzbu2qobvm60
	 +W0ev/pi14K+oFISZAdApvtgL3tChf6i4HYuoNy6SNwVy54H1LZtSEFQJ2JWdhRlU8
	 TO85kH8I/vcQQ==
Date: Thu, 13 Jun 2024 11:54:34 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH 03/19] firmware: turris-mox-rwtm: Use PAGE_SIZE instead
 of hardcoded 4096
Message-ID: <20240613115434.317e4b2a@dellmb>
In-Reply-To: <30b3fba8-117e-a21f-c6d3-2e987792ec90@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org>
	<20240612135443.30239-4-kabel@kernel.org>
	<30b3fba8-117e-a21f-c6d3-2e987792ec90@linux.intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 11:01:42 +0300 (EEST)
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> On Wed, 12 Jun 2024, Marek Beh=C3=BAn wrote:
>=20
> > The 4096 bytes limit in mox_hwrng_read() is due to the DMA buffer being
> > allocated to one PAGE_SIZE bytes. The PAGE_SIZE macro is used when
> > allocating the buffer, use it in mox_hwrng_read() as well.
> >=20
> > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> > ---
> >  drivers/firmware/turris-mox-rwtm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turr=
is-mox-rwtm.c
> > index 3f4758e03c81..5acdde1bb6d9 100644
> > --- a/drivers/firmware/turris-mox-rwtm.c
> > +++ b/drivers/firmware/turris-mox-rwtm.c
> > @@ -287,8 +287,8 @@ static int mox_hwrng_read(struct hwrng *rng, void *=
data, size_t max, bool wait)
> >  	struct armada_37xx_rwtm_tx_msg msg;
> >  	int ret;
> > =20
> > -	if (max > 4096)
> > -		max =3D 4096;
> > +	if (max > PAGE_SIZE)
> > +		max =3D PAGE_SIZE; =20
>=20
> Wouldn't it be better to bind these to the alloc side with a local define=
=20
> that is set to PAGE_SIZE?

OK.
