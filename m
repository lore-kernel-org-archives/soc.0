Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3085ECDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 12:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11D46C433C9; Thu, 12 Oct 2023 12:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89313C433C7;
	Thu, 12 Oct 2023 12:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697115347;
	bh=SKw2eyCVGl2SOK29cOhaOTJX78MHbmbdv5hEMFDILAM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=oEfV7krVm7nMh/Fuq10B4HQXdze/4aCPchmajWiEJfvv6x2hV/Ylkx5zADHVSyiH9
	 vziUrjHQ3Mb85HDiA0SKy9mK/m1qVPaBU+es2qBFjP5trMGmpMMMigC6nG7LEZee3N
	 6/RwgUz+s2PpOUu2pA6CCLN/vBDaeyMs0vGEQ+8Sf+G3CsTC9BvCOuFxnh3lwgnS5p
	 RANbhdtWy9UL+rXZPxIi9hfxw8EW133GGLWJ8p5lYHJ3Gils22MJCKoqMTsGwa6ik+
	 K5sibSsPdf0XzDv0BoUan07YrXKc9LcFAWj/oAsbljDvH79iEgg2z+yxHb9WOK78m9
	 r6pmRLvpl+XSw==
Date: Thu, 12 Oct 2023 13:55:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: Re: [PATCH v2] soc: renesas: make ARCH_R9A07G043 depend on required
 options
Message-ID: <20231012-very-resort-6f335fde7c21@spud>
References: <20231012-pouch-parkway-7d26c04b3300@spud>
 <CAMuHMdWRzoBgxxkF6kpxr4tpUM4BzHnMUmW3vDR_BrrXiKae5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EO9YkbE39monY2qy"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWRzoBgxxkF6kpxr4tpUM4BzHnMUmW3vDR_BrrXiKae5Q@mail.gmail.com>


--EO9YkbE39monY2qy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 02:15:21PM +0200, Geert Uytterhoeven wrote:

> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -340,10 +340,12 @@ if RISCV
> >  config ARCH_R9A07G043
> >         bool "RISC-V Platform support for RZ/Five"
> >         depends on NONPORTABLE
> > +       depends on RISCV_ALTERNATIVE
> > +       depends on RISCV_SBI
> >         select ARCH_RZG2L
> > -       select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
> > +       select AX45MP_L2_CACHE
> >         select DMA_GLOBAL_POOL
> > -       select ERRATA_ANDES if RISCV_SBI
> > +       select ERRATA_ANDES
> >         select ERRATA_ANDES_CMO if ERRATA_ANDES
>=20
> As ERRATA_ANDES is now selected unconditionally, the test
> for it can be removed.  I can do that while applying.

Yeah, I wasn't really sure whether to delete it or not. I shoulda
mentioned it under the snip line I suppose. I had it in my head that
keeping the if there made things less likely to fail if changes were
made to the Kconfig stuff in arch/riscv, but this is pretty coupled
and would likely blow up anyway.

Go for it.

Cheers,
Conor.

>=20
> >         help
> >           This enables support for the Renesas RZ/Five SoC.


--EO9YkbE39monY2qy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSfszgAKCRB4tDGHoIJi
0nfvAQCSeC2WKYXavG94sLVGW3mtXhE3Vb16roJku4vmgLP9MwEA+0Fl2ZWNhRjD
7J5OVfXJpT8hGVH4bRW/sucSHBZAWQw=
=0+xS
-----END PGP SIGNATURE-----

--EO9YkbE39monY2qy--
