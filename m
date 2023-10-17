Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057C3CDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 21:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3EC7C433CB; Tue, 17 Oct 2023 21:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3B7C433C7;
	Tue, 17 Oct 2023 21:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697579636;
	bh=zFcl40a1mZ7yFLPn0M/H5M42/3otm/7Ohyw+hm85BMo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=lO69+fLm/tU6zwBjG1wDXwsyrF0Kxv7nPc1OQK5iIV81C9JdLBSqd5q0kUd5w6OPs
	 qJPrL7FnWgdbdEJCRyliRo1KNl2FdOvD4HYRQlRW9SHlAijQWhgisEkfOAbzwt9fFg
	 TwWOIlcJCjawe2yUWwPpqVNEZst/ynqjzDByx6sK/EtySY9+Yd7ggZFqsT/eSrUMw5
	 NbAdUkiKZnsTJE3yVzWdt067vzSO4VakWYSx0njxR9cXiWwnrmHsCJZosdBU0uKk9z
	 bu5FZo98N+OdSWEqrGViEY+rEHOMBhne4nTlAfXftlXtH2qQNv61lqN0QZd9M6Z1dL
	 8+78QBwcg+3mg==
Date: Tue, 17 Oct 2023 22:53:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
Cc: broonie@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: Covering DT build in -next merge
Message-ID: <20231017-tipoff-winking-5492563adf12@spud>
References: <ZS7rlTZLr0m1OEv8@sirena.org.uk>
 <mhng-9d3c8241-8749-4b5e-bb01-64cf5e2d0bb8@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="me0PsmQYdQ+9rLXb"
Content-Disposition: inline
In-Reply-To: <mhng-9d3c8241-8749-4b5e-bb01-64cf5e2d0bb8@palmer-ri-x1c9a>


--me0PsmQYdQ+9rLXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 01:20:26PM -0700, Palmer Dabbelt wrote:
> On Tue, 17 Oct 2023 13:16:21 PDT (-0700), broonie@kernel.org wrote:
> > Hi Stephen,
> >=20
> > I was wondering if it might be possible to add DTB builds for relevant
> > architecutres to the -next merge checks (everything except x86 AFAIK)?
> > Some current experience suggested to me that it might be helpful for
> > bisecting problems found in testing, breakage building the DTBs causes
> > hassle since where they're used in tree DTs are required to boot the
> > kernel.
> >=20
> > At least for arm and arm64 the DT build is quick enough to be negligable
> > in the context of building the kernel itself so hopefully it shouldn't
> > add too much load to do this - it's just adding a 'make dtbs' (with
> > appropriate cross build options) to the kernel build.
>=20
> Pretty sure we're in the same shape for RISC-V these days.

Yup, same deal on riscv pretty much. It takes less than 5 seconds to
build them all for riscv, and it would be a nice bare minimum check.
Certainly would be good to have it.

> +Conor, who
> would know for sure (as he made it work).

What I sorted out dtbs_check being warning central actually, and I
suppose it'd be nice to track new warnings added to dbts_check in next
automagically, but that build (single make job) takes 20 times longer
on riscv than just building the dtbs - and probably far longer on arm64.
It also requires keeping up fairly religiously with dt-schema, so
probably not a runner...



--me0PsmQYdQ+9rLXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS8CcAAKCRB4tDGHoIJi
0tIZAQC/Ejkg2cTGafikEuIhKXKtGgB1dR3Rih8rVU6qNDB/BwEA51NYkFVLUXqx
BpmfGSDfIys4sldOA0Ac+dE+VhGKFgU=
=ZaNQ
-----END PGP SIGNATURE-----

--me0PsmQYdQ+9rLXb--
