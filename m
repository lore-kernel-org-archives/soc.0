Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCA4136337
	for <soc@lists.linux.dev>; Thu, 26 Sep 2024 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727371191; cv=none; b=gDTYluvWA9BiJz9Sj00ds5nZ+EvK4BD8i5zJv7taWPI56bLO0RfM59LCMe51mzS6/m1HvDcaM9AugOVu9qTexg5sK+7XZV4VVopjjT3DGa+Yxi9gBAaZOcV9i10J+54LIWRHN+DmgNIKLBWZgo/wSAZEi5umHXnGJnB75cH8T34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727371191; c=relaxed/simple;
	bh=IRJPaGf4Lta9joqbMh79bT2xFKqLpjoXIZEgiHhjdCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lop+s0AF9FQa9pU9o8OjnV8Pmxgxq5TnnfSAvHntKJTry8zzPtkkaBIHPICFHx3EK/OGgOf65DdThJsRk//LWt4+EX7sraYwgwZ/vvBK/x7INiOrNe65dBcaj8WwaaGLlY3vsYsrdjvl5mzISqss2e72eusOpArv/cePhrnoO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZC06e+SF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZC06e+SF"
Received: by smtp.kernel.org (Postfix)
	id 1F20EC4CEC7; Thu, 26 Sep 2024 17:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFC1C4CEC5;
	Thu, 26 Sep 2024 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727371191;
	bh=IRJPaGf4Lta9joqbMh79bT2xFKqLpjoXIZEgiHhjdCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZC06e+SFKRGO0fW78dIkA8i9Iq0KNU6KAq5kfQv+fJL9NWcccUBl6l6PghIcoInvn
	 DAoFdUHwZLGNY0dHoTati3+Kd+AFOntGY1vz4ezuPHxhMYtmYmtKEHX5fDU9kgs+z8
	 52QcX7RHQFyGseAabSWMd9G1q6CHDFTCWWP1rVdC5EbdR+3CWGapXIkhAN3KLKlbDE
	 /Db4JCD3ccjcW4/c004xe4Y4D2govuXv57EXotNv8u+eMtQLzwb44KhsE74GevsTBS
	 t3pEwQjYMbwHqsCEAOb9/T3LHWOwRVSL6a/QZzA1KzCWSGtgB+lnUbYwNcMnfPrsXx
	 E/yTedv4WceOw==
Date: Thu, 26 Sep 2024 18:19:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, soc@kernel.org
Subject: Re: microchip soc maintainance change proposal
Message-ID: <20240926-retiring-grumbly-5231f2c2162e@spud>
References: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
 <6d6ab21d-44fa-491c-98f7-8a2d8ab86c62@microchip.com>
 <202409241424582a8b426d@mail.local>
 <70f1981a-5956-4abb-afd2-4321f4b21e8b@tuxon.dev>
 <20240925-absolute-jockey-1518cceb2884@spud>
 <20240925175952d2737996@mail.local>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zumGMiGGWGth9le9"
Content-Disposition: inline
In-Reply-To: <20240925175952d2737996@mail.local>


--zumGMiGGWGth9le9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 07:59:52PM +0200, Alexandre Belloni wrote:
> On 25/09/2024 17:16:10+0100, Conor Dooley wrote:
> > On Wed, Sep 25, 2024 at 10:34:10AM +0300, claudiu beznea wrote:
> > >=20
> > >=20
> > > On 24.09.2024 17:24, Alexandre Belloni wrote:
> > > > On 24/09/2024 16:05:45+0200, Nicolas Ferre wrote:
> > > >> On 24/09/2024 at 13:46, Conor Dooley wrote:
> > > >>> Hey folks,
> > > >>>
> > > >>> I mentioned this to Arnd and Alexandre at LPC, and to Nicolas bef=
ore
> > > >>> that, but I would like to propose some changes to how the Microch=
ip soc
> > > >>> support is maintained - mostly affecting the riscv side of things=
 that
> > > >>> I've been maintaining in my personal tree, alongside other platfo=
rms.
> > > >>> I'd like to propose moving those from my tree, into the at91 tree.
> > > >>
> > > >> I don't know if the "at91" naming will remain a right designation =
of what
> > > >> we're doing in the future, but well, let's stick to it for now.
> > > >> Some find it a little too much tight to the old Atmel brand...
> > > >>
> > > >=20
> > > > We could take this opportunity to rename the tree microchip or mchp=
=2E=20
> > >=20
> > > +1
> >=20
> > I personally don't care at all about the tree being called at91 or w/e,
> > but I wouldn't object to a rename to either. I can whip up a mail to the
> > helpdesk if yous like.
>=20
> Yeah, I guess you can ask for the rename and be added to the list of
> users that can push to the repo. At the same time, you can send a patch
> to update the MAINTAINER entry so we can ack it.

I'm actually already in the group ;) Do we want there to be a redirect
=66rom the at91 url to whatever the new one is? Konstantin said that it is
possible, it'll take him about 5 mins to set one up.

--zumGMiGGWGth9le9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWXswAKCRB4tDGHoIJi
0ovCAQDCQikuBiuQCK0yscprcsewM04KgQgRDnrWJ7+wFr17FgEAgyots/5zPri2
otgNKbr0ob6eGF2rs2LOBMm74lOoQwY=
=awir
-----END PGP SIGNATURE-----

--zumGMiGGWGth9le9--
