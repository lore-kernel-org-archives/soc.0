Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D83C433E0
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 22:23:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 01A3564E30; Sun, 31 Jan 2021 22:23:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0A9764DFA;
	Sun, 31 Jan 2021 22:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612131813;
	bh=1zFi1O/OfYRPJDpm+YetAkissf3owl4zMydwrZGKhtA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MUbLbdjUeCXbxiVgfjEXG2ihyyp9M4WwCgQdHAuD/RzXKZS8qXaIkbl7AHg1v8yTc
	 GGfGWegIqvjTX7Hm2Ya2Ft161tSG1rqVeGgOinO1L3+MMnKegKeNOduHqN9gCCGL+Q
	 +Ewj16WzYrgoJkRFZ3Nt6LvAbpLqNq8+T3O2gm+qt16iUuWAI38JbrJVe3WLSDnq+w
	 y4EZordAg7oFFNZTIeL2EPZleIsZbdbwHLkcRlHGrKQ3FFLqXVlCkW8Whn1Uo1hohd
	 Y+pINktCqaf3sAFwANCbXtVkg9lUITip89Uo6l8oimoLcL61tF7eD+BcmcM2ud53cc
	 yuLyf8iPi1fQw==
Received: by mail-oo1-f49.google.com with SMTP id r199so3804216oor.2;
        Sun, 31 Jan 2021 14:23:33 -0800 (PST)
X-Gm-Message-State: AOAM531nbaj/zsZoe4M5Np6nGjmLM088lhCHeR2EyRH79o9E/1pnAjQO
	jvP6XXBeTxAz/PydPFw03JORKpbeuoS7CoriQm8=
X-Google-Smtp-Source: ABdhPJzJdLOj/vjVeCo4tCU0t8VtADnGPEnXFXXeUhxRbWkkiD6RvXIuBjxJ2kZqzBEd/nUmDyfOMYGYA4dCL0LKoBk=
X-Received: by 2002:a4a:870c:: with SMTP id z12mr3228398ooh.15.1612131813154;
 Sun, 31 Jan 2021 14:23:33 -0800 (PST)
MIME-Version: 1.0
References: <1608713092-26952-1-git-send-email-neal.liu@mediatek.com>
 <1608713092-26952-3-git-send-email-neal.liu@mediatek.com> <68442164-d649-aee0-cfe8-c9ebb868612d@gmail.com>
In-Reply-To: <68442164-d649-aee0-cfe8-c9ebb868612d@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 31 Jan 2021 23:23:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1DLX6y5GM3O7+T0gMH_JLRp6nUkHFZc4Shjn_bTKWWSw@mail.gmail.com>
Message-ID: <CAK8P3a1DLX6y5GM3O7+T0gMH_JLRp6nUkHFZc4Shjn_bTKWWSw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: configs: Support DEVAPC on MediaTek platforms
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Neal Liu <neal.liu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, SoC Team <soc@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>, 
	Hanks Chen <Hanks.Chen@mediatek.com>, lkml <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Jackson-kt Chang <Jackson-kt.Chang@mediatek.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 31, 2021 at 3:07 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On 23/12/2020 09:44, Neal Liu wrote:
> > Support DEVAPC on MediaTek platforms by enabling CONFIG_MTK_DEVAPC.
> >
> > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> > ---
> >  arch/arm64/configs/defconfig |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 17a2df6..a373776 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -257,6 +257,7 @@ CONFIG_MTD_NAND_MARVELL=y
> >  CONFIG_MTD_NAND_FSL_IFC=y
> >  CONFIG_MTD_NAND_QCOM=y
> >  CONFIG_MTD_SPI_NOR=y
> > +CONFIG_MTK_DEVAPC=m
> >  CONFIG_SPI_CADENCE_QUADSPI=y
> >  CONFIG_BLK_DEV_LOOP=y
> >  CONFIG_BLK_DEV_NBD=m
> >
>
> From my understanding, defconfig is for a minimal config that allows to boot a
> machine. As MTK_DEVAPC is a rather exotic driver to detect bus access
> violations, I think it's not a good candidate for inclusion in defconfig.
>
> In any case, I added the SoC maintainer, so that they can correct me, if I'm
> wrong :)

I generally don't mind adding platform specific drivers as loadable modules
even if they are somewhat obscure. For built-in drivers, this is
different though,
as those have a noticeable impact on other platforms.

I haven't kept track of what this particular driver does, but from the Kconfig
description, I'd say it should get enabled in defconfig.

        Arnd
