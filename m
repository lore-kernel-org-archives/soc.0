Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27F6C433FE
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 21:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD37BC385BB; Wed,  4 May 2022 21:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DFAC385B8;
	Wed,  4 May 2022 21:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651698552;
	bh=1VHqp5rzrBbY91bx4+xHfYSlL4VjUj22rAcC646FB4E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=j9idbXoOrJ3/+AtDfLW4viNgDN3Ph6rOBXY1KiazwvdmlyaiBIAdqnt1+/SaDW67F
	 MygtvSKr/JFPFXSU1CYLJM19VfxrQusF3zvmhG+h55E1UHSZYZj/mJ0d/2Mu7BNxJU
	 8nX0n45tA7Di5jmE9PcdY7/8BEb12nFu3EYGDtr9VD8v4e2hgKWIAsRBWTKSQoseBz
	 7vjlvXSc6/G//gQPRCvU7aKgO3fT0mYJx7xbJX5uNm+T4fuuaNCDc0UF4pZnMR4av/
	 QHlaXarxMCV3R7trfTIx/zFUjxsWxtFROhFcVzCgLn8VCspqG3QBp2XbEQ7r8Tebl5
	 DPnA7ObAIDnkA==
Received: by mail-pl1-f182.google.com with SMTP id k1so2573734pll.4;
        Wed, 04 May 2022 14:09:12 -0700 (PDT)
X-Gm-Message-State: AOAM533JqaoIqFcLcRp+SvgjA+/KAG6gGXTwaz05wgReA04vyycVWEin
	oOYJTAxVL2Fp9vO79EJVuoIcsKDh1Kv8nYbw6Q==
X-Google-Smtp-Source: ABdhPJwBMTCGQCgPRU3lR21O/Pg8xrqp6ZNQMSQ6IqcLGzFAl5vybJDkl7NLjw0mI/bRKw2iW3vJIAvYuSNL1uF/Uto=
X-Received: by 2002:a17:90a:3486:b0:1d9:3abd:42ed with SMTP id
 p6-20020a17090a348600b001d93abd42edmr1797638pjb.32.1651698551962; Wed, 04 May
 2022 14:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220503211954.1428919-1-frowand.list@gmail.com>
 <CAL_JsqKqBWKWzQC1qXABuiC6b3OgwfO+c5-fpGz=AgSUSCHCcA@mail.gmail.com> <dc72de86-af22-84e3-53fa-8a3958a08fb6@gmail.com>
In-Reply-To: <dc72de86-af22-84e3-53fa-8a3958a08fb6@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 4 May 2022 16:08:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+YzYaQMrPjtp0yCRy0dqL2Me+GcLbmj_Drv=XVdvWqdw@mail.gmail.com>
Message-ID: <CAL_Jsq+YzYaQMrPjtp0yCRy0dqL2Me+GcLbmj_Drv=XVdvWqdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] of: overlay: rename overlay source files from .dts
 to .dtso
To: Frank Rowand <frowand.list@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Tim Harvey <tharvey@gateworks.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>, 
	Michal Simek <monstr@monstr.eu>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Michael Walle <michael@walle.cc>, 
	Alex Marginean <alexandru.marginean@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 4, 2022 at 3:42 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 5/3/22 16:42, Rob Herring wrote:
> > On Tue, May 3, 2022 at 4:20 PM <frowand.list@gmail.com> wrote:
> >>
> >> From: Frank Rowand <frank.rowand@sony.com>
> >>
> >> In drivers/of/unittest-data/:
> >>    - Rename .dts overlay source files to use .dtso suffix.
> >>    - Add Makefile rule to build .dtbo.o assembly file from overlay
> >>      .dtso source file.
> >>    - Update Makefile to build .dtbo.o objects instead of .dtb.o from
> >>      unittest overlay source files.
> >>
> >> Modify driver/of/unitest.c to use .dtbo.o based symbols instead of
> >> .dtb.o
> >>
> >> Modify scripts/Makefile.lib %.dtbo rule to depend upon %.dtso instead
> >> of %.dts
> >>
> >> Rename .dts overlay source files to use .dtso suffix in:
> >>    arch/arm64/boot/dts/freescale/
> >>    arch/arm64/boot/dts/xilinx/
> >>
> >> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> >> ---
> >>
> >> Testing by arm64 people would be much appreciated.
> >>
> >> Applies on branch dt/next, commit 4fb74186cee8 of Rob's kernel.org tree.
> >> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
> >>
> >> version 1 patch:
> >>    https://lore.kernel.org/r/20210324223713.1334666-1-frowand.list@gmail.com
> >>
> >> changes from version 1:
> >>    - rebase to 5.18-rc1 plus many patches already accepted by Rob
> >>      Applies on branch dt/next, commit 4fb74186cee8 of Rob's kernel.org tree.
> >>    - Add new overlay source files in:
> >>       arch/arm64/boot/dts/freescale/
> >>       arch/arm64/boot/dts/xilinx/
> >
> > I can't apply these. They need to be applied separately. And probably
> > at end of the merge window or right after rc1 (IOW, coordinated with
> > SoC maintainers in advance). Or we support both forms for a cycle.
>
> If applied separately then git bisect is broken.  I don't see this change
> as being big enough to be considered a "flag day" change, but if I can't
> get the SoC maintainers to ack you pulling these renames then I can easily
> re-spin in a way to support both forms for a release cycle.
>
> >
> > [...]
> >
> >> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
> >> index d072f3ba3971..df2ca1820273 100644
> >> --- a/drivers/of/unittest-data/Makefile
> >> +++ b/drivers/of/unittest-data/Makefile
> >> @@ -1,38 +1,58 @@
> >>  # SPDX-License-Identifier: GPL-2.0
> >> -obj-y += testcases.dtb.o
> >>
> >> -obj-$(CONFIG_OF_OVERLAY) += overlay.dtb.o \
> >> -                           overlay_0.dtb.o \
> >> -                           overlay_1.dtb.o \
> >> -                           overlay_2.dtb.o \
> >> -                           overlay_3.dtb.o \
> >> -                           overlay_4.dtb.o \
> >> -                           overlay_5.dtb.o \
> >> -                           overlay_6.dtb.o \
> >> -                           overlay_7.dtb.o \
> >> -                           overlay_8.dtb.o \
> >> -                           overlay_9.dtb.o \
> >> -                           overlay_10.dtb.o \
> >> -                           overlay_11.dtb.o \
> >> -                           overlay_12.dtb.o \
> >> -                           overlay_13.dtb.o \
> >> -                           overlay_15.dtb.o \
> >> -                           overlay_16.dtb.o \
> >> -                           overlay_17.dtb.o \
> >> -                           overlay_18.dtb.o \
> >> -                           overlay_19.dtb.o \
> >> -                           overlay_20.dtb.o \
> >> -                           overlay_bad_add_dup_node.dtb.o \
> >> -                           overlay_bad_add_dup_prop.dtb.o \
> >> -                           overlay_bad_phandle.dtb.o \
> >> -                           overlay_bad_symbol.dtb.o \
> >> -                           overlay_base.dtb.o \
> >> -                           overlay_gpio_01.dtb.o \
> >> -                           overlay_gpio_02a.dtb.o \
> >> -                           overlay_gpio_02b.dtb.o \
> >> -                           overlay_gpio_03.dtb.o \
> >> -                           overlay_gpio_04a.dtb.o \
> >> -                           overlay_gpio_04b.dtb.o
> >> +# Generate an assembly file to wrap the output of the device tree compiler
> >> +quiet_cmd_dt_S_dtbo= DTB     $@
> >> +cmd_dt_S_dtbo=\
> >> +{                                                      \
> >> +       echo '\#include <asm-generic/vmlinux.lds.h>';   \
> >> +       echo '.section .dtb.init.rodata,"a"';           \
> >> +       echo '.balign STRUCT_ALIGNMENT';                \
> >> +       echo '.global __dtbo_$(subst -,_,$(*F))_begin'; \
> >> +       echo '__dtbo_$(subst -,_,$(*F))_begin:';        \
> >> +       echo '.incbin "$<" ';                           \
> >> +       echo '__dtbo_$(subst -,_,$(*F))_end:';          \
> >> +       echo '.global __dtbo_$(subst -,_,$(*F))_end';   \
> >> +       echo '.balign STRUCT_ALIGNMENT';                \
> >> +} > $@
> >> +
> >> +
> >> +$(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
> >> +       $(call if_changed,dt_S_dtbo)
> >
> > Humm, this belongs in scripts/Makefile.lib.
>
> I would rather keep it isolated to just the use in unittest.
> We just now got rid of the final driver use of of_overlay_fdt_apply()
> by the grandfathered legacy user in:
>
>    841281fe52a7 drm: rcar-du: Drop LVDS device tree backward compatibility
>
> That driver was the only use of %.dtb.S for an overlay.

I'd actually prefer more drivers handling compatibility this way than
handling old and new DTs in code. That's easier to find and when
compatibility with old DTs is no longer needed we can just remove the
fixup overlay. Though I guess that one was a lot of code too, but that
would probably be mitigated if we had multiple users. Anyways, that's
a side issue.

.dtb.S is an intermediate format that no one looks at. The arguments
for knowing what the file is don't really apply to it. We should do
here whatever makes the makefiles the simplest.

> I can't eliminate the rule for %.dtb.S because that is used in several
> cases for building the system FDT into the kernel.  But having this
> rule in drivers/of/unittest-data/Makefile provides consistent naming
> of overlays withing unittest.  Helping to make it clear that they are
> not a system FDT.

But if they are in one spot you can make that whole unreadable mess of
a command a macro with '.dtb.S' becoming a variable. Then we have 1
unreadable blob and when someone goes to fix something in it, they
don't have to find our hidden copy.

> > I don't think we need a different section name with __dtbo_* instead
> > of __dtb_* if that simplifies the Makefile.
>
> A different section name is not needed if the rule is moved to
> scripts/Makefile.lib but even if moved there, I prefer to keep the
> overlay data clearly delineated from the system FDT data.

At least make that a separate patch then.

Rob
