Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18CDC4332F
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 18:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98F2FC433D6; Mon,  7 Nov 2022 18:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BEDC433C1;
	Mon,  7 Nov 2022 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667845923;
	bh=dlmjP9ssLQcaBYiSfyLIT2bYn125NQOMTZhQKYAjXgE=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=mhrjDEbhmFhr6AJINeU+l+gzY/cVtDaofNce/i05fzaXtG4Ipdy0tya2LfKIDmhq3
	 XNQADOSdjk6AgpldScjWITOoiJuwU64Kh4dnaLm0IV8ZQ3lxpYZzY/K34wMqhaAmRW
	 VcmIhQ2WoygKD96V+gwo70pcuGCLVeauwLLsdZfkWtpWpsihm+ZIIvaM81jUVenhGI
	 UUjTUe9iw6tgRQvwHwfyX2VaGueHyN0RB8lpuyh9Gulmr3PAmbt7rmkWRxw5/Vbe/P
	 xL03tBJsb3xlEkV9+9HBoVmtow127nyGyefuRq2NyU1NGYG+ds0qxgmroQ4zF2mCoF
	 Q0ODxJK0irdsA==
Date: Mon, 7 Nov 2022 18:31:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel@esmil.dk, krzk@kernel.org,
	masahiroy@kernel.org, mkl@pengutronix.de, davem@davemloft.net,
	linux-riscv@lists.infradead.org, soc@kernel.org
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
Message-ID: <Y2lPHzaHvpWjEoll@spud>
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>

On Mon, Nov 07, 2022 at 08:46:00AM -0800, Palmer Dabbelt wrote:
> This has come up a bunch of times, but I don't think we've ever really
> made a decision.  Historically that's not been such a big deal because
> the RISC-V device trees were pretty inactive, but that's changed -- both
> because Conor has been cleaning everything up, and also because there's
> a bunch of SOCs showing up with RISC-V cores in them.  We talked about
> this again at plumbers a few times, but Arnd wasn't around it person so
> I figured it's best to just start an email thread and see how people
> feel.
> 
> A lot of these new SOCs are based on Arm designs and the device trees
> very much reflect that, so it makes sense to me to just keep the device
> tree merges via as similar a path as possible.  IIUC that happens via
> the SOC tree these days, so it makes sense to me that we start handling
> the RISC-V device trees that way as well.  That would make things easier
> for contributors, as they'll have one workflow for all their SOCs, but
> also easier for me as a lot of this SOC stuff touches bits I really
> don't understand and thus get kind of lost trying to review.

Reviewing the Renesas/Allwinner stuff, it's p apparent to me that they
need to go via the same tree for RISC-V and ARM.

> Arnd: looks like you're handling most of the merges these days so this
> would be increasing your workload.  I feel kind of bad just dumping a
> bunch of stuff on you, but I think at least now the RISC-V DTS are in
> reasonable shape so hopefully it's not that bad.

Warning free at least... :)

> It'd certainly help
> things on my end, and I'm happy to try and re-direct some of that saved
> time to helping out in SOC land but I'm not sure how well that'd work
> out in practice as I'm pretty buried.

As things stand, I'm the only one sending PRs from the RISC-V side for
dt & I am down to send things whatever way.
Since he expressed willingness off list, I'm happy to route things via
the soc tree going forwards.

> On a somewhat related note, Conor has offered to pick up the otherwise
> unmaintained RISC-V SOCs.  That's sort of its own discussion, but if we
> change over to the SOC tree we might as well just do everything at the
> same time.
> 
> Presumably we'd want to adjust the MAINTAINERS file in a handful of ways
> to make sure patches end up in the right place.

Arnd mentioned that that should cover stuff in drivers/{soc,firmware} as
well as the dt, so with the assumption that that MAINTAINERS entry looks
something like:

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..03e78d2e5cc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17709,6 +17709,16 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V/MISC SOC SUPPORT
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+Q:	https://patchwork.kernel.org/project/linux-riscv/list/
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+F:	arch/riscv/boot/dts/
+F:	drivers/soc/microchip/
+F:	drivers/soc/sifive/
+
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks Palmer/Arnd,
Conor.
