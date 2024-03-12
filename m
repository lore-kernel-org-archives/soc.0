Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA626C54E58
	for <soc@archiver.kernel.org>; Tue, 12 Mar 2024 13:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88899C433C7; Tue, 12 Mar 2024 13:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E512C433F1;
	Tue, 12 Mar 2024 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710248964;
	bh=kDPAAUYqtHGW/XmFNx+/atYvOH0ApHTe0ivu8X8yg14=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=kOeobsF2KAVHPHX/9ITeFVb22pGa9qScG5xgt/iWuPrjNMe8CL2rPAo4ntOg7B5zj
	 ehwsraYw/s1vm7yRmOaPX6vfolGfEdfDZE1EF6Aj5GtwkV8zufNnHRysi+nsJ9rWKp
	 SAFeooc4ECVd4xcX2QHLwaZmS3I591xCmCxAuyoYABUJn4OIfTs/OFHH7wEV3rHW7x
	 tLn7BKNG1kD6RjLxwdiPdCFCwTxgqlA1os3J+h09r3UTAK338qe8+YFRgqo1UlMCKh
	 TAeDOUgDZgCsHXdq4pCn4kyM8NVBT7io9lnGawCoxyMOEnWC4SwFmczCeDsI7ryZh7
	 Qf7ak8PekmEAQ==
Date: Tue, 12 Mar 2024 13:09:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.8-final
Message-ID: <20240312-squad-evaluate-e96191870035@spud>
References: <20240306-waltz-facial-9e4e1b792053@spud>
 <1f827492-2a68-4753-aac2-fcbdca51e460@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RrxIwo4lJjZ8GknO"
Content-Disposition: inline
In-Reply-To: <1f827492-2a68-4753-aac2-fcbdca51e460@app.fastmail.com>


--RrxIwo4lJjZ8GknO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 09:12:08AM +0100, Arnd Bergmann wrote:
> On Wed, Mar 6, 2024, at 19:08, Conor Dooley wrote:
> > Hey Arnd,
> >
> > I know it is pretty late in the day here for fixes, and I would've kept
> > the builtin dtb fix as v6.9 material, but Geert reported yesterday that
> > boot was broken on the jh7100 platforms due to a fix that I sent in my
> > last PR.
>=20
> Sorry I missed them last week. I added this to the soc/dt branch
> for 6.9 now. You might want to ask stable@vger.kernel.org for a
> backport after -rc1 is out if they don't automatically pick them
> up.

Right, it was an unexpected PR and late in the cycle. It's only the
jh7100 patch that'd need a backport. I'll request a backport if one
doesn't happen automagically, which it probably will, even though I
didn't have a cc: stable on it.

--RrxIwo4lJjZ8GknO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfBUAAAKCRB4tDGHoIJi
0ne/AP9RXiCdRyrvJCnyKLscaY9tjyTicYP8kd03je+6JEiVnQEAs6J5HLyVzHhm
NB+TjIYzUiEMgzYlF9CjunrwF5qe0gc=
=Pjex
-----END PGP SIGNATURE-----

--RrxIwo4lJjZ8GknO--
