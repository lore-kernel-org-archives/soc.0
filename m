Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BA7C4332F
	for <soc@archiver.kernel.org>; Thu, 29 Dec 2022 14:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3AC3C433D2; Thu, 29 Dec 2022 14:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCE2C433EF;
	Thu, 29 Dec 2022 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672324929;
	bh=HweCNvuVHKTNntaP2TO5kbEWCY8tJkwUc9XXwLm/Qa4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Bf5KnNRd917Q9YkSZXe0W6rUiyMWFqa+xXS352McJpMfVp0UFsfjceDf8qkCF2FgC
	 LBfntHlAXuUVUvtL0H4Sk7JwbwMGAhEwYJTyiADb2IT4rVibrpdoJF70PE8lRQ8gq4
	 pXP26HZWGWRS/HS70dTqYr2CwxZfUZKHbM+q0gl90wKNaLibnYJjaWB2DdZGulouuL
	 y8+p+vVbx5usYtBSxPRU+XzeOhCW8XtnWnWqATrIk8rfgBTcQ+d8itw1c5DIIiecFQ
	 6hOCsok6HKJ4jKYRw2bMoB7w6CIcz+bDFv84xU5dFCEoACnftcWdrmTvs+3mhxWwUA
	 6H4XhOyRQiznA==
Date: Thu, 29 Dec 2022 14:42:02 +0000
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
Message-ID: <Y62nOqzyuUKqYDpq@spud>
References: <mhng-8b05b6cd-d8a1-4302-af24-2f64a4bf7c32@palmer-ri-x1c9a>
 <32cf0901-a4a0-48a7-bf42-f2cdb34d1ee7@app.fastmail.com>
 <Y55IQIxXw/twcxFx@spud>
 <bb350709-e29a-402c-8e7e-37fd9c452c6d@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5hEnPjiiILINJZrq"
Content-Disposition: inline
In-Reply-To: <bb350709-e29a-402c-8e7e-37fd9c452c6d@app.fastmail.com>


--5hEnPjiiILINJZrq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2022 at 03:05:37PM +0100, Arnd Bergmann wrote:
> On Sat, Dec 17, 2022, at 23:52, Conor Dooley wrote:
> > On Fri, Dec 16, 2022 at 09:04:20PM +0100, Arnd Bergmann wrote:
> >> On Fri, Dec 16, 2022, at 17:32, Palmer Dabbelt wrote:
> >> > On Thu, 15 Dec 2022 23:02:58 PST (-0800), Christoph Hellwig wrote:
> >>
> >> I don't particularly like drivers/soc/ to become more of a dumping
> >> ground for random drivers. If there are several SoCs that have the
> >> same requirement to do a particular thing, the logical step would
> >> be to put them into a proper subsystem, with a well-defined interface
> >> to dma-mapping and virtualization frameworks.
> >>=20
> >> The other things we have in drivers/soc/ are usually either
> >> soc_device drivers for identifying the system, or they export
> >> interfaces used by soc specific drivers.
> >
> > Sounds like that's two "not in my back yard" votes from the maintainers
> > in question..
> > Doing drivers/cache would allow us to co-locate the RISC-V cache
> > management bits since it is not just going to be the ax45mp l2 driver
> > that will need to have them.
> >
> > Would it be okay to put this driver in soc/andestech for now & then move
> > it, and the SiFive one, once we've got patches posted for cache
> > management with that?
>=20
> I actually had a look at both of these drivers now and
> found that they do entirely different things, so I would
> revise what I had said earlier. Sorry for not having paid
> enough attention at first.

Eh, I wouldn't consider it to be your fault as, I at least, have been
ignoring this difference as...

> The Sifive L2 cache driver handles an interrupt from the
> cache controller that is trigger by data corruption
> (corectable or uncorrectable). This is used as an
> implementation detail of drivers/edac/sifive_edac.c
> and could probably just be merged into that file.
>=20
> The Andes cache driver in this series on the other hand
> does not do EDAC at all but instead handles cache maintenance
> for the dma-mapping interface by hooking into the
> inline-asm implementation details of arch/riscv/mm/dma-noncoherent.c
> as an errata fix.

=2E..we (Microchip) need to add similar cache maintenance to the SiFive
driver. Should have posted patches by now, but conferences + Christmas
have delayed that a bit.

> If we expect more nonstandard ways
> to manage cache controllers for this, I think this
> needs a proper interface in arch/riscv or drivers/cache.

The Zicbo* extensions for cache management arrived after people had
already been shipping SoCs that need stuff that isn't cache coherent.
On top of the two already mentioned, I am told there are two other
non-Zicbo* cache management solutions from SiFive alone - so I think it
is likely that we'll have variants here, unfortunately.

> This could be done the same way as arch/arm/include/asm/cacheflush.h
> with CPU specific cache management callback pointers, but
> can't really be a separate device driver without interacting
> with low-level architecture code.

I'll take a look at our patches again this week (they're 5.15 based, so
well out of date, vendor tree stuff). I'll try to whip up something
based on top of this series.

Thanks,
Conor.


--5hEnPjiiILINJZrq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY62nNQAKCRB4tDGHoIJi
0gi7AQDLACy2bGPvhyYrKW7hKnC+g+nCLN/fPCvK02eG+uRMmQEAuYJbcKQkDSD/
Y4Lm9bRqaoqa+Pd25j6IyVYmOUJ1rQI=
=Apu6
-----END PGP SIGNATURE-----

--5hEnPjiiILINJZrq--
