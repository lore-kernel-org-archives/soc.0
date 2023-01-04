Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6FBC4332F
	for <soc@archiver.kernel.org>; Wed,  4 Jan 2023 13:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B5A2C433F1; Wed,  4 Jan 2023 13:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164C0C433EF;
	Wed,  4 Jan 2023 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672838421;
	bh=UCR10FzdpyERM7Z169xv4JNYsom7gkfKwhsanMFzCe4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=HXGBKwZ6f93tCwGiHzSIY5Oi/YEzaH15up+Z+oP5XqwD8KcrtXgCrku0TM5g8jZ7L
	 4cflXI8iI01XIAHts8MkGHx/OXpCbWgd49o4kSUzKcxfjm36z+bRoUy/uzHlcuilJe
	 alXe4OoqcuzyOxv1acvzwoXlAPPilY9VCNF1thfI9ubVglqscaogW8y7uWjJ2B5dfR
	 kwlI+7O1s2nVbI+2A3Fb+DMcpkXtPnc2lMrVkf1Wo3EnwLkvfl2IMbmAqS4HW7MNa8
	 oxaiXIhN1qgidkApVusQ/VNtxXb/2VQX7KzcoInZr3VcXVK8utOCnRRJju+p2wGUX6
	 b7kBNpRRHiEuA==
Date: Wed, 4 Jan 2023 13:20:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, palmer@dabbelt.com
List-Id: <soc.lore.kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	guoren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-riscv@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>, soc@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: [RFC v5.1 9/9] [DON'T APPLY] cache: sifive-ccache: add cache
 flushing capability
Message-ID: <Y7V9Debcc9lqWBmT@spud>
References: <Y62nOqzyuUKqYDpq@spud>
 <20230103210400.3500626-10-conor@kernel.org>
 <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com>
 <Y7TBh+CJdZPJ6Xzl@spud>
 <ed198390-1bde-44ec-9f3f-b0e016b4b24c@app.fastmail.com>
 <CFB874A3-3E6F-4C5B-B47D-381EB1E07C02@kernel.org>
 <43aee000-5b89-4d94-98d2-b37b1a18a83e@app.fastmail.com>
 <Y7VpeK48nslxklkF@spud>
 <1b7d4caa-2c9c-4aef-81ac-47288d3a652c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rrP9pEqr7IGzMEx8"
Content-Disposition: inline
In-Reply-To: <1b7d4caa-2c9c-4aef-81ac-47288d3a652c@app.fastmail.com>


--rrP9pEqr7IGzMEx8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2023 at 01:18:45PM +0100, Arnd Bergmann wrote:
> On Wed, Jan 4, 2023, at 12:56, Conor Dooley wrote:
> > On Wed, Jan 04, 2023 at 11:19:44AM +0100, Arnd Bergmann wrote:
> >> On Wed, Jan 4, 2023, at 10:23, Conor Dooley wrote:
> >> I would try to replace both of these indirections and instead
> >> handle it all from C code in arch_sync_dma_for_device() directly,
> >> for the purpose of readability and maintainability.
> >> static inline void dma_cache_clean(void *vaddr, size_t size)
> >> {
> >>         if (!cache_maint_ops.clean)
> >>                zicbom_cache_clean(vaddr, size, riscv_cbom_block_size);
> >
> > And I figure that this function is effectively a wrapper around ALT_CMO=
_OP()?
> >
> >>         else
> >>                cache_maint_ops.clean(vaddr, size, riscv_cbom_block_siz=
e);
> >
> > And this one gets registered by the driver using an interface like the
> > one I already proposed, just with the cache_maint_ops struct expanded?
>=20
> Yes, exactly.
>=20
> > Extrapolating, with these changes having an errata would not even be
> > needed in order to do cache maintenance.
> > Since the ALT_CMO_OP() version would only be used inside
> > zicbom_cache_clean(), assuming I understood correctly, a driver could
> > just register cache_maint_ops for a given platform without having to
> > muck around with errata.
>=20
> That is the idea, and ALT_CMO_OP() itself can just go away
> as by just putting the inline asm without the alternative into
> the zicbom_cache_clean() version, making the THEAD branch yet
> another cache_maint_ops instance.

Perhaps more of a question for Palmer than you, but how about leaving
ALT_CMO_OP as-is in riscv/for-next at the moment, wrapping it in
zicbom_cache_foo() & leaving that extraction for a follow-on work?
There's another conversation going on about expanding the THEAD stuff,
so that could be done on top of Prabhakar's v6.

That series is here:
https://lore.kernel.org/linux-riscv/CAJF2gTQp1bOp9kfoOkbvNnSXQhzrCpG3rn8C+L=
PPoJtMCCDOdA@mail.gmail.com/T/#t
Although unfortunately Icenowy is having issues getting their patches to
the lists so I assume it'll get let through at some point today.

> >> which then makes it very clear what the actual code path
> >> is, while leaving the zicbom case free of indirect function
> >> calls. You can still use a static_branch() to optimize the
> >> conditional, but I would try to avoid any extra indirection
> >> levels or errata checks.
> >
> > The other thing that I like about this is we can then remove the various
> > calls to ALT_CMO_OP() that are scattered around arch/riscv now & replace
> > them with functions that have more understandable names.
>=20
> I only see them in arch/riscv/mm/dma-noncoherent.c and arch/riscv/mm/pmem=
=2Ec,
> but yes, both of these should just call the new functions, whatever the
> calling conventions end up being.

Dunno why I had it in my head there was a third place. Seeing ghosts
maybe!

Thanks,
Conor.


--rrP9pEqr7IGzMEx8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7V9DQAKCRB4tDGHoIJi
0ix1AQD9fnWHP37asWpDp+KUwwZ86hIIJVZLXotLmF99zzgQYQD9FwQZVLT3AJ+8
Pe5K/d0/kMbmX7MV3eDhGBAxHPH0zgg=
=OI2t
-----END PGP SIGNATURE-----

--rrP9pEqr7IGzMEx8--
