Return-Path: <SRS0=iLN3=VR=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B530C433EF
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 22:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70D06C385C1; Mon,  9 May 2022 22:11:55 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B6D4C385BF;
	Mon,  9 May 2022 22:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B6D4C385BF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id w130so4863887oig.0;
        Mon, 09 May 2022 15:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pJ7mtOBkzkSdDuldw0ZXVGH8m/zpHZ80uXkslyYr/QI=;
        b=HhMw4TFxyouq4EIVnL8lObMb/x/H3/aaNUiL9CBkisiVznB9BlcahnHU8M/RQgo44x
         Rr8FncVCXRiK4mBel5wLSjefGPCXuH+CtY63e0s10CMIDVk05d7VCv5m02K6h2FWoby4
         qS3OtOtJY7uchbyYSIvNF7+Vr8BNdAOWXjHMOFWhjzoRtvYNyy1VjZSPt/AbTj1A8W1v
         hVGfmG4195q3le15eN7ETxckveKo0KIJAicM+YDB5GZEHmDHzrFidWDJKskeIyXMI5xw
         YkFu6XHIOMd5eWsonGeyqUxmtUty45+103J89siG5CoviZ7RhdKciCJ/sasqjVY5XJmJ
         jX1g==
X-Gm-Message-State: AOAM532mphVkcsjWSLCR9wWZiPpibP5Ivp2Kzgm0zqqU8cydwF2/GQWe
	lOutOWK+gqYEd39dZLaIUA==
X-Google-Smtp-Source: ABdhPJw4K+W8XcdEwGttFQMCaYKqHunsTZtNX2UIkDPAELHZk92xPrDeHTH6NciOqv3jhhmaZxgRzA==
X-Received: by 2002:a05:6808:188d:b0:326:bd47:687c with SMTP id bi13-20020a056808188d00b00326bd47687cmr4438468oib.25.1652134313361;
        Mon, 09 May 2022 15:11:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c3-20020a4ad203000000b0035eb4e5a6d3sm5414576oos.41.2022.05.09.15.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 15:11:52 -0700 (PDT)
Received: (nullmailer pid 295059 invoked by uid 1000);
	Mon, 09 May 2022 22:11:51 -0000
Date: Mon, 9 May 2022 17:11:51 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Tim Harvey <tharvey@gateworks.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>, Michal Simek <monstr@monstr.eu>, Viresh Kumar <viresh.kumar@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Walle <michael@walle.cc>, Alex Marginean <alexandru.marginean@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, PCI <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] of: overlay: rename overlay source files from
 .dts to .dtso
Message-ID: <YnmRp8zMRr2RQ8W/@robh.at.kernel.org>
References: <20220503211954.1428919-1-frowand.list@gmail.com>
 <CAL_JsqKqBWKWzQC1qXABuiC6b3OgwfO+c5-fpGz=AgSUSCHCcA@mail.gmail.com>
 <dc72de86-af22-84e3-53fa-8a3958a08fb6@gmail.com>
 <CAL_Jsq+YzYaQMrPjtp0yCRy0dqL2Me+GcLbmj_Drv=XVdvWqdw@mail.gmail.com>
 <dcf137b0-9f5c-07b5-e348-a99060136511@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcf137b0-9f5c-07b5-e348-a99060136511@gmail.com>

On Wed, May 04, 2022 at 04:40:30PM -0500, Frank Rowand wrote:
> On 5/4/22 16:08, Rob Herring wrote:
> > On Wed, May 4, 2022 at 3:42 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >>
> >> On 5/3/22 16:42, Rob Herring wrote:
> >>> On Tue, May 3, 2022 at 4:20 PM <frowand.list@gmail.com> wrote:
> >>>>
> >>>> From: Frank Rowand <frank.rowand@sony.com>
> >>>>
> >>>> In drivers/of/unittest-data/:
> >>>>    - Rename .dts overlay source files to use .dtso suffix.
> >>>>    - Add Makefile rule to build .dtbo.o assembly file from overlay
> >>>>      .dtso source file.
> >>>>    - Update Makefile to build .dtbo.o objects instead of .dtb.o from
> >>>>      unittest overlay source files.
> >>>>
> >>>> Modify driver/of/unitest.c to use .dtbo.o based symbols instead of
> >>>> .dtb.o
> >>>>
> >>>> Modify scripts/Makefile.lib %.dtbo rule to depend upon %.dtso instead
> >>>> of %.dts
> >>>>
> >>>> Rename .dts overlay source files to use .dtso suffix in:
> >>>>    arch/arm64/boot/dts/freescale/
> >>>>    arch/arm64/boot/dts/xilinx/
> >>>>
> >>>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> >>>> ---
> >>>>
> >>>> Testing by arm64 people would be much appreciated.
> >>>>
> >>>> Applies on branch dt/next, commit 4fb74186cee8 of Rob's kernel.org tree.
> >>>> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
> >>>>
> >>>> version 1 patch:
> >>>>    https://lore.kernel.org/r/20210324223713.1334666-1-frowand.list@gmail.com
> >>>>
> >>>> changes from version 1:
> >>>>    - rebase to 5.18-rc1 plus many patches already accepted by Rob
> >>>>      Applies on branch dt/next, commit 4fb74186cee8 of Rob's kernel.org tree.
> >>>>    - Add new overlay source files in:
> >>>>       arch/arm64/boot/dts/freescale/
> >>>>       arch/arm64/boot/dts/xilinx/
> >>>
> >>> I can't apply these. They need to be applied separately. And probably
> >>> at end of the merge window or right after rc1 (IOW, coordinated with
> >>> SoC maintainers in advance). Or we support both forms for a cycle.
> >>
> >> If applied separately then git bisect is broken.  I don't see this change
> >> as being big enough to be considered a "flag day" change, but if I can't
> >> get the SoC maintainers to ack you pulling these renames then I can easily
> >> re-spin in a way to support both forms for a release cycle.
> >>
> >>>
> >>> [...]
> >>>
> >>>> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
> >>>> index d072f3ba3971..df2ca1820273 100644
> >>>> --- a/drivers/of/unittest-data/Makefile
> >>>> +++ b/drivers/of/unittest-data/Makefile
> >>>> @@ -1,38 +1,58 @@
> >>>>  # SPDX-License-Identifier: GPL-2.0
> >>>> -obj-y += testcases.dtb.o
> >>>>
> >>>> -obj-$(CONFIG_OF_OVERLAY) += overlay.dtb.o \
> >>>> -                           overlay_0.dtb.o \
> >>>> -                           overlay_1.dtb.o \
> >>>> -                           overlay_2.dtb.o \
> >>>> -                           overlay_3.dtb.o \
> >>>> -                           overlay_4.dtb.o \
> >>>> -                           overlay_5.dtb.o \
> >>>> -                           overlay_6.dtb.o \
> >>>> -                           overlay_7.dtb.o \
> >>>> -                           overlay_8.dtb.o \
> >>>> -                           overlay_9.dtb.o \
> >>>> -                           overlay_10.dtb.o \
> >>>> -                           overlay_11.dtb.o \
> >>>> -                           overlay_12.dtb.o \
> >>>> -                           overlay_13.dtb.o \
> >>>> -                           overlay_15.dtb.o \
> >>>> -                           overlay_16.dtb.o \
> >>>> -                           overlay_17.dtb.o \
> >>>> -                           overlay_18.dtb.o \
> >>>> -                           overlay_19.dtb.o \
> >>>> -                           overlay_20.dtb.o \
> >>>> -                           overlay_bad_add_dup_node.dtb.o \
> >>>> -                           overlay_bad_add_dup_prop.dtb.o \
> >>>> -                           overlay_bad_phandle.dtb.o \
> >>>> -                           overlay_bad_symbol.dtb.o \
> >>>> -                           overlay_base.dtb.o \
> >>>> -                           overlay_gpio_01.dtb.o \
> >>>> -                           overlay_gpio_02a.dtb.o \
> >>>> -                           overlay_gpio_02b.dtb.o \
> >>>> -                           overlay_gpio_03.dtb.o \
> >>>> -                           overlay_gpio_04a.dtb.o \
> >>>> -                           overlay_gpio_04b.dtb.o
> >>>> +# Generate an assembly file to wrap the output of the device tree compiler
> >>>> +quiet_cmd_dt_S_dtbo= DTB     $@
> >>>> +cmd_dt_S_dtbo=\
> >>>> +{                                                      \
> >>>> +       echo '\#include <asm-generic/vmlinux.lds.h>';   \
> >>>> +       echo '.section .dtb.init.rodata,"a"';           \
> >>>> +       echo '.balign STRUCT_ALIGNMENT';                \
> >>>> +       echo '.global __dtbo_$(subst -,_,$(*F))_begin'; \
> >>>> +       echo '__dtbo_$(subst -,_,$(*F))_begin:';        \
> >>>> +       echo '.incbin "$<" ';                           \
> >>>> +       echo '__dtbo_$(subst -,_,$(*F))_end:';          \
> >>>> +       echo '.global __dtbo_$(subst -,_,$(*F))_end';   \
> >>>> +       echo '.balign STRUCT_ALIGNMENT';                \
> >>>> +} > $@
> >>>> +
> >>>> +
> >>>> +$(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
> >>>> +       $(call if_changed,dt_S_dtbo)
> >>>
> >>> Humm, this belongs in scripts/Makefile.lib.
> >>
> >> I would rather keep it isolated to just the use in unittest.
> >> We just now got rid of the final driver use of of_overlay_fdt_apply()
> >> by the grandfathered legacy user in:
> >>
> >>    841281fe52a7 drm: rcar-du: Drop LVDS device tree backward compatibility
> >>
> >> That driver was the only use of %.dtb.S for an overlay.
> > 
> > I'd actually prefer more drivers handling compatibility this way than
> > handling old and new DTs in code. That's easier to find and when
> > compatibility with old DTs is no longer needed we can just remove the
> > fixup overlay. Though I guess that one was a lot of code too, but that
> > would probably be mitigated if we had multiple users. Anyways, that's
> > a side issue.
> 
> If I remember correctly, that is a total reversal of previous discussions
> and policy decisions.

I don't think so.

> My previous position has been to not have drivers applying overlays.
> I'll have to step back and revisit the concept, trying to set aside
> my previous assumptions and conclusions.

If not drivers, who can? As I said in the other thread, I don't think a 
general mechanism will ever happen. Though a general mechanism with 
constraints (such as drivers registering target nodes which subtrees 
can be applied to) would be an implementation detail. Having constraints 
on what's allowed has been my position forever. In my mind, allowing 
overlays for specific drivers/subsystems is constrained, so maybe that's 
the confusion here.


> But before I go away and revisit, there is one thing to mention.  Now
> that you have machine parseable bindings (and many of them implemented)
> and also a method to statically validate overlays applied on top of
> specific base .dtbs (that is the purpose of the arch/arm64/dts/* files
> that I renamed in this patch, right?), allowing drivers to dynamically
> apply overlays, potentially after modifying the base devicetree (that's
> the other patch series I need to be reviewing at the moment...) reduces
> the validation coverage.

The bootloader can also do whatever modifications it wants too and 
that's not validated. However, we can run validation at build time and 
now on a running system, so at least the beginning and end states can be 
validated.

Rob
