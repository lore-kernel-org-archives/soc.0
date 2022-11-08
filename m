Return-Path: <SRS0=OoSR=3I=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D3EC4332F
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 13:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 325CBC43470; Tue,  8 Nov 2022 13:32:37 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C18CEC433C1;
	Tue,  8 Nov 2022 13:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C18CEC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667914354; x=1699450354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huxLAOzGx/LqzcIAiUSaJnN/HGBFm4LrG5K4GV5wwAk=;
  b=daEoqeLiekjoTWpZre/vD9a04arT0oiO3ZHVVE7xqsoi0NF36lND35XO
   Wg+frS7u1XDIIjGggpPri7a1xesl4uhW1Xfe0DoZLyeT54tVt+U0N45QA
   umLFCVM+7kf2BaehOKN4dlYe7SNwcRR0YYCvvA5WJJBAW1EZdJH01iMYl
   Qup1ZnjouYPX/hoz4cfZrx2HzpDS9b/MwpuiP2TWzGYqd7RuV0eMO36DA
   a88GwG1cZ/xq2lNpA3uatCFBUTZ2KWM9w1lgrwOQ5lex2UZ2QbrPzsXco
   gajD6LtGbOg/P6GFPMrV9xYQQ+HhHlHfjA3/gy3zkwX/H9cdibRnFO3Cm
   w==;
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="188159649"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2022 06:32:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 8 Nov 2022 06:32:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 8 Nov 2022 06:32:28 -0700
Date: Tue, 8 Nov 2022 13:32:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>, <palmer@dabbelt.com>,
	<nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<kernel@esmil.dk>, Krzysztof Kozlowski <krzk@kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S .
 Miller" <davem@davemloft.net>, <linux-riscv@lists.infradead.org>,
	<soc@kernel.org>
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
Message-ID: <Y2paXPeC51GORPRX@wendy>
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
 <Y2lPHzaHvpWjEoll@spud>
 <f98d5faf-dd4e-46c0-ba55-9438615b434f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f98d5faf-dd4e-46c0-ba55-9438615b434f@app.fastmail.com>


+CC Nicolas

On Tue, Nov 08, 2022 at 01:51:37PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 7, 2022, at 19:31, Conor Dooley wrote:
> > On Mon, Nov 07, 2022 at 08:46:00AM -0800, Palmer Dabbelt wrote:
> >> This has come up a bunch of times, but I don't think we've ever really
> >> made a decision.  Historically that's not been such a big deal because
> >> the RISC-V device trees were pretty inactive, but that's changed -- both
> >> because Conor has been cleaning everything up, and also because there's
> >> a bunch of SOCs showing up with RISC-V cores in them.  We talked about
> >> this again at plumbers a few times, but Arnd wasn't around it person so
> >> I figured it's best to just start an email thread and see how people
> >> feel.
> >> 
> >> A lot of these new SOCs are based on Arm designs and the device trees
> >> very much reflect that, so it makes sense to me to just keep the device
> >> tree merges via as similar a path as possible.  IIUC that happens via
> >> the SOC tree these days, so it makes sense to me that we start handling
> >> the RISC-V device trees that way as well.  That would make things easier
> >> for contributors, as they'll have one workflow for all their SOCs, but
> >> also easier for me as a lot of this SOC stuff touches bits I really
> >> don't understand and thus get kind of lost trying to review.
> >
> > Reviewing the Renesas/Allwinner stuff, it's p apparent to me that they
> > need to go via the same tree for RISC-V and ARM.
> >
> >> Arnd: looks like you're handling most of the merges these days so this
> >> would be increasing your workload.  I feel kind of bad just dumping a
> >> bunch of stuff on you, but I think at least now the RISC-V DTS are in
> >> reasonable shape so hopefully it's not that bad.
> >
> > Warning free at least... :)
> 
> I don't see a problem with merging this through the SoC tree, it
> was always the plan to pick up related changes across architectures
> where needed.
> 
> The MIPS and PowerPC maintainers have so far preferred to handle
> the changes through their respective trees, everything else
> has been in the noise. Looking at the number of DT changesets since
> linux-5.0 per architecture, I see
> 
> 7748 arch/arm64/boot/dts
> 6654 arch/arm/boot/dts
> 197 arch/mips/boot/dts
> 155 arch/riscv/boot/dts
> 67 arch/powerpc/boot/dts
> 35 arch/arc/boot/dts
> 6 arch/openrisc/boot/dts
> 5 arch/xtensa/boot/dts
> 5 arch/nios2/boot/dts
> 5 arch/microblaze/boot/dts
> 2 arch/csky/boot/dts
> 1 arch/loongarch/boot/dts
> 
> >> On a somewhat related note, Conor has offered to pick up the otherwise
> >> unmaintained RISC-V SOCs.  That's sort of its own discussion, but if we
> >> change over to the SOC tree we might as well just do everything at the
> >> same time.
> >> 
> >> Presumably we'd want to adjust the MAINTAINERS file in a handful of ways
> >> to make sure patches end up in the right place.
> >
> > Arnd mentioned that that should cover stuff in drivers/{soc,firmware} as
> > well as the dt, so with the assumption that that MAINTAINERS entry looks
> > something like:
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cf0f18502372..03e78d2e5cc6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17709,6 +17709,16 @@ F:	arch/riscv/
> >  N:	riscv
> >  K:	riscv
> > 
> > +RISC-V/MISC SOC SUPPORT
> > +M:	Conor Dooley <conor@kernel.org>
> > +L:	linux-riscv@lists.infradead.org
> > +S:	Maintained
> > +Q:	https://patchwork.kernel.org/project/linux-riscv/list/
> > +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> > +F:	arch/riscv/boot/dts/
> > +F:	drivers/soc/microchip/
> > +F:	drivers/soc/sifive/
> 
> I'd probably make separate entries here, at least for the
> drivers/soc/microchip directory, I can see that being shared with
> architectures other than RISC-V in the future

(Added Nicolas to CC so that he's in the loop)
Uh sure. It'd crossed my mind, but I filed it away in the "may happen
some day" category. The arm stuff is going via the atmel directory at
the moment so I was operating on the basis of "do it this way until
something changes".
Splitting is fine by me. As things stand, anything drivers/soc/microchip
already CCs the linux-riscv list so maybe that can change alongside
this.

> and the sifive
> directory should probably have at least a reviewer from
> sifive.com even if you plan to route the patches my way for
> them.

Anything sifive should already be covered by:
SIFIVE DRIVERS
M:	Palmer Dabbelt <palmer@dabbelt.com>
M:	Paul Walmsley <paul.walmsley@sifive.com>
L:	linux-riscv@lists.infradead.org
S:	Supported
T:	git https://github.com/sifive/riscv-linux.git
N:	sifive
K:	[^@]sifive

The git tree there is dead, but it does give you your SiFive reviewer?

That leaves us with three entries then? Grand with me, I don't care :)
Created the above to double check the scope more than anything else.

The one I was wondering about but forgot to mention was:
Documentation/devicetree/bindings/riscv/

It's mostly definitions of cpu, soc and board compatibles, so I figure
it could go with the dt stuff - and it's covered by the generic RISC-V
entry for the changes that reflect extensions etc.

Thanks,
Conor.
