Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE32C3DA7D
	for <soc@archiver.kernel.org>; Tue,  3 Jan 2023 21:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85D68C433F0; Tue,  3 Jan 2023 21:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477B4C433EF;
	Tue,  3 Jan 2023 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672779857;
	bh=+a4GknzPZkuXqBn656i7Wlb1eFqC8Z9LcgenqXot4Jc=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=F9ntzGAXtEnJ9ec9847PhJqorpKgHZqyhBmP5kxP+gww/HimmqswFaTTMYuwOzivL
	 5zho4d0Xf3T9KNajmSw9lcolFTYoG88gjrYkXK4JSvY2ZQzKzzdXWh966iXb3jYDhl
	 eyKhoLmfjkZzZw2bdn8te0Qm8BCBinaK1+lD0vzl2+lb7ax/KnHCEjIhom8opEUcMG
	 Zu5IhHHoYx4hEk6hOLsdM4mcQ0jeMl6EFR16NycmePWSRkhxUX6GEODBYrYHaWaf1w
	 nc5ClDao8U1YOQaqDg4tRdtSCRcLN1XuynSgmJBZTVun/9Lfl1lpG+4OcxfhiZCMND
	 UQNRK5xSOM9rA==
From: Conor Dooley <conor@kernel.org>
To: conor@kernel.org,
	arnd@arndb.de,
	palmer@dabbelt.com,
	prabhakar.csengg@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	geert@linux-m68k.org,
	guoren@kernel.org,
	hch@infradead.org,
	heiko@sntech.de,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	magnus.damm@gmail.com,
	nathan@kernel.org,
	paul.walmsley@sifive.com,
	philipp.tomsich@vrull.eu,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	soc@kernel.org
Subject: [RFC v5.1 0/9] Generic function based cache management operations (was Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five SoC)
Date: Tue,  3 Jan 2023 21:03:52 +0000
Message-Id: <20230103210400.3500626-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <Y62nOqzyuUKqYDpq@spud>
References: <Y62nOqzyuUKqYDpq@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5698; i=conor.dooley@microchip.com; h=from:subject; bh=ml9qI4wIsVqAaRr3oVwB9iuAe68WB7bPF35ZiNhQRtI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlbZliskpCyseMwuBf3oWL6qpvTry+dFaGcn18VqrXkt6ZD gr9hRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbiw8nwhyP/zaUj0paFweUOtvHsU6 2/uzBe9uA88npF7BSRT59SLRgZFryoPcIWK8b1cfmjU8d9Dv4s+pVtZnCe5d6fyI+TnTslGQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey all, hopefully the $subject arrived intact!

See here for prior discussion:
https://lore.kernel.org/linux-riscv/Y62nOqzyuUKqYDpq@spud/#R

Rather than continue that back and forth about where these drivers
belonged, I've gone and created a mock-up for what it would look like
if we picked drivers/cache.

IMO, doing drivers/cache for the detail of vendor behaviour makes sense
as it'll keep 'em out of arch/riscv while keeping the drivers
together.
I've taken v5 of Prabhakar's patchset & hacked at it a bit, so here
is a tyre-kicked (more) generic implementation of cache management stuff
via functions.
I initially went and moved both the ax45mp and ccache drivers to
drivers/cache & created a "subsystem" like interface, but quickly
realised it was all far too trivial to exist & was intrinsically tied to
the ALT_CMO_OP alternative setup on RISC-V.
I trashed that so, and instead copied the interface currently used by
riscv_set_cacheinfo_ops(), and created a corollary which registers cache
management operations. Or maintenance, IDC which.
Instead of having the vendor specific cache controller function in the
errata, the generic one is there instead, which then calls the one
registered by the vendor driver.
I figure that even if no other non-coherent implementation ends up making
it upstream, ax45mp is not going to be the only Andestech product that
has a "no-iocp" variant...

I sent this over the Prabhakar the other day & it works for him, so I am
now sending this here as RFC. I've not yet tested it on PolarFire SoC,
as we have to sort out some "fun" where archid etc are all zero.
We'll require some massaging before we can use the alternatives framework
as is, so that'll have to come at a later date. I included a patch, but
it's marked "DON'T APPLY" for a reason ;)

Notably, I have not fixed up any comments which were left against v5,
bar a rebase on top of riscv/for-next. I blindly "fixed" the pmem issue,
so that needs to be fixed properly for a v6, alongside the other couple
bits.

The other thing that is missing, and I could not think immediately of a
way to do it, is a way to add additional users of this type of CMO to
the alternative without having to add a specific entry for each vendor.
I had first thought about using archid of 0, but that runs into problems
pretty quickly as that "archid" is what we use for enabling CPU_FEATURE
stuff, like Zicbom itself.
Since archid uses the JEDEC IDs, perhaps we could squat on either a
continuation code (or some vendor that won't make a RISC-V CPU, like
Actel *cough*).
I didn't go through with mocking that up, as until we sort out PolarFire
SoC, there's only one user for this that I, at least, would like to have
supported properly.
So if anyone has ideas that are in any way less hacky than that, I am all
ears.

Thanks,
Conor.

Conor Dooley (2):
  cache,soc: Move SiFive CCache driver & create drivers/cache
  RISC-V: create a function based cache management interface

Daire McNamara (1):
  [DON'T APPLY] cache: sifive-ccache: add cache flushing capability

Lad Prabhakar (6):
  riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
  riscv: asm: vendorid_list: Add Andes Technology to the vendors list
  riscv: errata: Add Andes alternative ports
  riscv: mm: dma-noncoherent: Pass direction and operation to
    ALT_CMO_OP()
  dt-bindings: cache: r9a07g043f-l2-cache: Add DT binding documentation
    for L2 cache controller
  soc: renesas: Add L2 cache management for RZ/Five SoC

 .../cache/andestech,ax45mp-cache.yaml         |  81 ++++++
 MAINTAINERS                                   |  15 +-
 arch/riscv/Kconfig.erratas                    |  26 ++
 arch/riscv/errata/Makefile                    |   1 +
 arch/riscv/errata/andes/Makefile              |   1 +
 arch/riscv/errata/andes/errata.c              |  93 +++++++
 arch/riscv/include/asm/alternative-macros.h   |  46 +++-
 arch/riscv/include/asm/alternative.h          |   3 +
 arch/riscv/include/asm/cacheflush.h           |  23 ++
 arch/riscv/include/asm/errata_list.h          |  41 ++-
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 arch/riscv/kernel/alternative.c               |   5 +
 arch/riscv/mm/dma-noncoherent.c               |  36 ++-
 arch/riscv/mm/pmem.c                          |   4 +-
 drivers/Kconfig                               |   2 +
 drivers/Makefile                              |   2 +
 drivers/cache/Kconfig                         |  25 ++
 drivers/{soc/sifive => cache}/Makefile        |   2 +
 drivers/cache/ax45mp_cache.c                  | 253 ++++++++++++++++++
 drivers/{soc/sifive => cache}/sifive_ccache.c |  47 +++-
 drivers/edac/sifive_edac.c                    |   2 +-
 drivers/soc/Kconfig                           |   1 -
 drivers/soc/Makefile                          |   1 -
 drivers/soc/renesas/Kconfig                   |   4 +
 drivers/soc/sifive/Kconfig                    |  10 -
 include/{soc/sifive => cache}/sifive_ccache.h |   0
 26 files changed, 684 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
 create mode 100644 arch/riscv/errata/andes/Makefile
 create mode 100644 arch/riscv/errata/andes/errata.c
 create mode 100644 drivers/cache/Kconfig
 rename drivers/{soc/sifive => cache}/Makefile (62%)
 create mode 100644 drivers/cache/ax45mp_cache.c
 rename drivers/{soc/sifive => cache}/sifive_ccache.c (86%)
 delete mode 100644 drivers/soc/sifive/Kconfig
 rename include/{soc/sifive => cache}/sifive_ccache.h (100%)


base-commit: b07de94d4501c61a3015cb0035227e449c51d87e
-- 
2.39.0

