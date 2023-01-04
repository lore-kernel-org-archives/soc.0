Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B141AC4332F
	for <soc@archiver.kernel.org>; Wed,  4 Jan 2023 11:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D61AC433D2; Wed,  4 Jan 2023 11:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C48C433EF;
	Wed,  4 Jan 2023 11:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672833408;
	bh=VL7oF+AzyQYXaF7PH+uXZqx2tFpD8C3uCsVxv0/bqww=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=snNYvwMD22vsBIeoG4X1zfKQiNyxOKRsIG0AM8Fo9hipTx2wEj2WcuVb1s2nGZ5yx
	 QCsJjpUXRPGrEg2mVQLDYNxEzUj0CxfMmMbtwYGC/o7rfEQYLERNr/btfysRK7pNEq
	 /pY+1iK+meOv/ITnrsxxerbJ0x10Y7JRWswKi/3JGLHC3G9ptI2ZbMNZsw5L9PJcw2
	 v/u862REQdWih6LAlxeF4aWYjUks7OYtxMLL9O8o5Lv7KQUrzd8YHlWFDUzIUktlFZ
	 ib6yq/2FrQ0SPIC5GRHQ8KkTk2mEN6Ct88bcKBKp3KMSLkDq6ti2IdveaUYne48rTL
	 eIKIxuqnYok+Q==
Date: Wed, 4 Jan 2023 11:56:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
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
Message-ID: <Y7VpeK48nslxklkF@spud>
References: <Y62nOqzyuUKqYDpq@spud>
 <20230103210400.3500626-10-conor@kernel.org>
 <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com>
 <Y7TBh+CJdZPJ6Xzl@spud>
 <ed198390-1bde-44ec-9f3f-b0e016b4b24c@app.fastmail.com>
 <CFB874A3-3E6F-4C5B-B47D-381EB1E07C02@kernel.org>
 <43aee000-5b89-4d94-98d2-b37b1a18a83e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tdud8ZJ0IxlakT31"
Content-Disposition: inline
In-Reply-To: <43aee000-5b89-4d94-98d2-b37b1a18a83e@app.fastmail.com>


--Tdud8ZJ0IxlakT31
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Arnd,

On Wed, Jan 04, 2023 at 11:19:44AM +0100, Arnd Bergmann wrote:
> On Wed, Jan 4, 2023, at 10:23, Conor Dooley wrote:
> >>Right, no need to touch the existing file as part of this series,
> >>it probably just gets in the way of defining a good interface here.
> >
> > Sure. Can leave it where it was & I'll sort it out later when it's=20
> > errata etc get added.
> >
> > Btw, would you mind pointing out where you wanted to have that if/else=
=20
> > you mentioned on IRC?
>=20
> I meant replacing both of the runtime patching indirections in
> arch_sync_dma_for_device(). At the moment, this function calls
> ALT_CMO_OP(), which is patched to either call the ZICBOM or the
> THEAD variant, and if I read this right you add a third case
> there with another level of indirection using static_branch.

Yah, pretty much.

> I would try to replace both of these indirections and instead
> handle it all from C code in arch_sync_dma_for_device() directly,
> for the purpose of readability and maintainability.
> static inline void dma_cache_clean(void *vaddr, size_t size)
> {
>         if (!cache_maint_ops.clean)
>                zicbom_cache_clean(vaddr, size, riscv_cbom_block_size);

And I figure that this function is effectively a wrapper around ALT_CMO_OP(=
)?

>         else
>                cache_maint_ops.clean(vaddr, size, riscv_cbom_block_size);

And this one gets registered by the driver using an interface like the
one I already proposed, just with the cache_maint_ops struct expanded?

Extrapolating, with these changes having an errata would not even be
needed in order to do cache maintenance.
Since the ALT_CMO_OP() version would only be used inside
zicbom_cache_clean(), assuming I understood correctly, a driver could
just register cache_maint_ops for a given platform without having to
muck around with errata.
If so, that seems like a distinct improvement over my suggestion & gets
around the thing I mentioned in 0/9 about a shared case in the
alternative application code.

Again, assuming I understood correctly, I like this a lot.

> }
>=20
> void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>                               enum dma_data_direction dir)
> {
>         void *vaddr =3D phys_to_virt(paddr);
>=20
>         switch (dir) {
>         case DMA_TO_DEVICE:
>         case DMA_FROM_DEVICE:
>                 dma_cache_clean(vaddr, size);
>                 break;
>         case DMA_BIDIRECTIONAL:
>                 dma_cache_flush(vaddr, size);
>                 break;
>         default:
>                 break;
>         }
> }
>=20
> which then makes it very clear what the actual code path
> is, while leaving the zicbom case free of indirect function
> calls. You can still use a static_branch() to optimize the
> conditional, but I would try to avoid any extra indirection
> levels or errata checks.

The other thing that I like about this is we can then remove the various
calls to ALT_CMO_OP() that are scattered around arch/riscv now & replace
them with functions that have more understandable names.

Thanks Arnd!
Conor.


--Tdud8ZJ0IxlakT31
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7VpeAAKCRB4tDGHoIJi
0qQsAQDomY43mfhf5tuVslNFGbFLsI5DjkZPO/5jL23g3ssjogD+ML7u3JxZU2n5
d/kCqDu2vZUi/C+qFucg7GEUjr4QPQU=
=hh3j
-----END PGP SIGNATURE-----

--Tdud8ZJ0IxlakT31--
