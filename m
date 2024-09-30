Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0669C19047A
	for <soc@lists.linux.dev>; Mon, 30 Sep 2024 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727715109; cv=none; b=ho0hFraKIz4U4kf9DcgcWG5dbJFvA+BG9w7TnZ3T82T95IjAejott/ADnV3pFez/xUPcM2LrPGAUDLdFm9ZO6jtP3/A5njF/yclWRcqf5e4m6BPqG6vJhoZN9Sy533cJ/zxIeoT2clPIwcYQjL9CrO1nSyUZJXWEbrfQ2OVp8Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727715109; c=relaxed/simple;
	bh=+ppolExmvuW/k8IDmzxjX/Y/K4nXsJxhSvWLzt0Q3xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nANhFmp20UFk6TeGpMVwmt7o2IKPXBr8DAzkkJlvE9bM+eNinLBbQLRm/wvtujke5kx7Ae1tOrots1Rqz267McXWxYMfffIvvqh9rWWsDvykZ+WmvbpSzVgswvWYvEXCxREI0Kcmm6IKO55k3IntSqSHsPQHhhjyi8qxAId5Itg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4Qtv2H9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4Qtv2H9"
Received: by smtp.kernel.org (Postfix)
	id 9D6A3C4CECF; Mon, 30 Sep 2024 16:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7FFC4CEC7;
	Mon, 30 Sep 2024 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727715108;
	bh=+ppolExmvuW/k8IDmzxjX/Y/K4nXsJxhSvWLzt0Q3xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4Qtv2H91KTabtj7GZihik+T0lyXsgceB2Hpjh1Rp5RMPrB+moGyd+59jz4ortg2u
	 ugn4V9H3DVYSswFxnZN6rGqTr2bSLAtTWf1E7opeGO0kljjFbk8Mk4Ihz7mRKGmlNi
	 TUwma7qMpIWAgIpc4OQtJEvS7809LA4uaTXj6Ko2M+ww2iuhlvJDJQyKReYoXyJ6bK
	 dTFE0vyvH5R03h6UZ61O9qSuhmCP+9bZcDvqtFYUN/z1OZXLZ8wSA3ZrM7BRJE151Q
	 cjAFQ5f+EnMsjJ2avdfwlNLQKaQ70DggdF5PBGbzyFKsXrIQ6ZP0IBKSAnIlTj+dN8
	 onsp167C9JmfA==
Date: Mon, 30 Sep 2024 17:51:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	claudiu beznea <claudiu.beznea@tuxon.dev>,
	Daire McNamara <daire.mcnamara@microchip.com>, soc@kernel.org
Subject: Re: microchip soc maintainance change proposal
Message-ID: <20240930-patrol-watch-6f9c39a004d1@spud>
References: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
 <6d6ab21d-44fa-491c-98f7-8a2d8ab86c62@microchip.com>
 <202409241424582a8b426d@mail.local>
 <70f1981a-5956-4abb-afd2-4321f4b21e8b@tuxon.dev>
 <20240925-absolute-jockey-1518cceb2884@spud>
 <20240925175952d2737996@mail.local>
 <20240926-retiring-grumbly-5231f2c2162e@spud>
 <c2195bd3-f27f-4594-b414-6a54586d16bb@microchip.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h1+tduU4aUgTur6Y"
Content-Disposition: inline
In-Reply-To: <c2195bd3-f27f-4594-b414-6a54586d16bb@microchip.com>


--h1+tduU4aUgTur6Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 10:03:02AM +0200, Nicolas Ferre wrote:
> On 26/09/2024 at 19:19, Conor Dooley wrote:
> > On Wed, Sep 25, 2024 at 07:59:52PM +0200, Alexandre Belloni wrote:
> > > On 25/09/2024 17:16:10+0100, Conor Dooley wrote:
> > > > On Wed, Sep 25, 2024 at 10:34:10AM +0300, claudiu beznea wrote:
> > > > >=20
> > > > > On 24.09.2024 17:24, Alexandre Belloni wrote:
> > > > > > On 24/09/2024 16:05:45+0200, Nicolas Ferre wrote:
> > > > > > > On 24/09/2024 at 13:46, Conor Dooley wrote:
> > > > > > > > Hey folks,
> > > > > > > >=20
> > > > > > > > I mentioned this to Arnd and Alexandre at LPC, and to Nicol=
as before
> > > > > > > > that, but I would like to propose some changes to how the M=
icrochip soc
> > > > > > > > support is maintained - mostly affecting the riscv side of =
things that
> > > > > > > > I've been maintaining in my personal tree, alongside other =
platforms.
> > > > > > > > I'd like to propose moving those from my tree, into the at9=
1 tree.
> > > > > > > I don't know if the "at91" naming will remain a right designa=
tion of what
> > > > > > > we're doing in the future, but well, let's stick to it for no=
w.
> > > > > > > Some find it a little too much tight to the old Atmel brand...
> > > > > > >=20
> > > > > > We could take this opportunity to rename the tree microchip or =
mchp.
>=20
> I'm voting for "microchip" so it's very explicit.

Cool, I went for that. Sent an email to the helpdesk just a few minutes
ago. I'll send some MAINTAINERS patches once that's complete.

>=20
> > > > > +1
> > > > I personally don't care at all about the tree being called at91 or =
w/e,
> > > > but I wouldn't object to a rename to either. I can whip up a mail t=
o the
> > > > helpdesk if yous like.
> > > Yeah, I guess you can ask for the rename and be added to the list of
> > > users that can push to the repo. At the same time, you can send a pat=
ch
> > > to update the MAINTAINER entry so we can ack it.
>=20
> > I'm actually already in the group =F0=9F=98=89 Do we want there to be a=
 redirect
> > from the at91 url to whatever the new one is? Konstantin said that it is
> > possible, it'll take him about 5 mins to set one up.
>=20
> Fine so that we can use whichever URI that we prefer and can continue to
> have the link to linux-next established (even if it's easy to modify with
> Stephen).
>=20
> Let's go for this if everybody agrees.
>=20
> Best regards,
>   Nicolas

--h1+tduU4aUgTur6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvrXIQAKCRB4tDGHoIJi
0pxzAP0aVic/eJcA9FaskSPgOJLW0SAlpQCyCUHgccY/XT6y9QEA0tzfUvA8dnY+
nHg8PR/KfjAMkwZdtarqBsnRWhwLRgs=
=OMNK
-----END PGP SIGNATURE-----

--h1+tduU4aUgTur6Y--
