Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B387C4332F
	for <soc@archiver.kernel.org>; Sat, 17 Dec 2022 22:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02C93C433D2; Sat, 17 Dec 2022 22:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EC4C433EF;
	Sat, 17 Dec 2022 22:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671317575;
	bh=Ch3US/HKQcH+y5/c6H7bpWBdnZCRxuMofatx7TVmmhc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ssVIOBLFzgt1c2WDgtVg+5bXEnsKZb2yX5WwI6fZhC4huuCOkW3mHmtFqoaREY8Vt
	 jyDzVRJK8jhuaCCESym13+y6gr9fX80Jd2/lnflhFiS3m414dTSr+Wg0KnwfvnrJkv
	 8V9hGcWT6wUp3QG+kSFZhfXeYNIlXpEhRtimKmaWjapyGk82LJF/+b6GN/FRk/9E2z
	 DGCh5nGo8I5VW9hDPS1RoVTklWzUBwTXvOy6gubtYW6zpccW8jhZyVMmSO4EFzhCNi
	 BTZ1ZahMj8+5utw5qApJUJQQfUEMsPPtjhIy4TxN8ADvQUoP2jdwdMSRL8HLiz7r3d
	 EYfkeuDHMl4Mg==
Date: Sat, 17 Dec 2022 22:52:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>, soc@kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>, guoren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five
 SoC
Message-ID: <Y55IQIxXw/twcxFx@spud>
References: <mhng-8b05b6cd-d8a1-4302-af24-2f64a4bf7c32@palmer-ri-x1c9a>
 <32cf0901-a4a0-48a7-bf42-f2cdb34d1ee7@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AVdRAMNp1ZNJqCN3"
Content-Disposition: inline
In-Reply-To: <32cf0901-a4a0-48a7-bf42-f2cdb34d1ee7@app.fastmail.com>


--AVdRAMNp1ZNJqCN3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 09:04:20PM +0100, Arnd Bergmann wrote:
> On Fri, Dec 16, 2022, at 17:32, Palmer Dabbelt wrote:
> > On Thu, 15 Dec 2022 23:02:58 PST (-0800), Christoph Hellwig wrote:
> >> On Thu, Dec 15, 2022 at 01:40:30PM -0800, Palmer Dabbelt wrote:
> >>> Given that we already moved the SiFive one out it seems sane to just =
start
> >>> with the rest in drivers/soc/$VENDOR.  Looks like it was Christoph's =
idea to
> >>> do the move, so I'm adding him in case he's got an opinion (and also =
the SOC
> >>> alias, as that seems generally relevant).
> >>
> >> Well, it isn't an integral architecture feature, so it doesn't really
> >> beloing into arch.  Even the irqchip and timer drivers that are more
> >> less architectural are in drivers/ as they aren't really core
> >> architecture code.
> >
> > That makes sense to me, it just looks like the SiFive ccache is the onl=
y=20
> > one that's in drivers/soc/$VENDOR, the rest are in arch.  It looks like=
=20
> > mostly older ports that have vendor-specific cache files in arch (ie,=
=20
> > arm has it but arm64 doesn't).  Maybe that's just because the newer=20
> > architectures sorted out standard ISA interfaces for these and thus=20
> > don't need the vendor-specific bits?  I think we're likely to end up=20
> > with quite a few of these vendor-specific cache management schemes on=
=20
> > RISC-V.
> >
> > I'm always happy to keep stuff out of arch/riscv, though.  So maybe we=
=20
> > just buck the trend here and stick to drivers/soc/$VENDOR like we did=
=20
> > for the first one?
>=20
> I don't particularly like drivers/soc/ to become more of a dumping
> ground for random drivers. If there are several SoCs that have the
> same requirement to do a particular thing, the logical step would
> be to put them into a proper subsystem, with a well-defined interface
> to dma-mapping and virtualization frameworks.
>=20
> The other things we have in drivers/soc/ are usually either
> soc_device drivers for identifying the system, or they export
> interfaces used by soc specific drivers.

Sounds like that's two "not in my back yard" votes from the maintainers
in question..
Doing drivers/cache would allow us to co-locate the RISC-V cache
management bits since it is not just going to be the ax45mp l2 driver
that will need to have them.

Would it be okay to put this driver in soc/andestech for now & then move
it, and the SiFive one, once we've got patches posted for cache
management with that?

Thanks,
Conor.


--AVdRAMNp1ZNJqCN3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY55IQAAKCRB4tDGHoIJi
0qusAP0a2dfTD6X7ML+t8lFgkHGnfD6rsEPdNdvUTA+/u4OAcAD9HrdOto6jMa+H
Z0834ZDF+9HV0CdT1zTZVuuunnhfCwk=
=q/pI
-----END PGP SIGNATURE-----

--AVdRAMNp1ZNJqCN3--
