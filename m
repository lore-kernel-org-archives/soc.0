Return-Path: <SRS0=Ip9B=JE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EF8C433ED
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 17:55:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AB2FC6138B; Wed,  7 Apr 2021 17:55:37 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E386128D;
	Wed,  7 Apr 2021 17:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E386128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-ot1-f54.google.com ([209.85.210.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MIxFi-1lAt8H0GXC-00KRQL; Wed, 07 Apr 2021 19:55:35 +0200
Received: by mail-ot1-f54.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so18952232oto.2;
        Wed, 07 Apr 2021 10:55:34 -0700 (PDT)
X-Gm-Message-State: AOAM5308nNqAClCqMzfw2rEmQJw3cOv279h54nonxNZXepkG9wc3ExBB
	Gsin5usGI4lQ04dlTePHINDdBQSd1bUNP+FleP0=
X-Google-Smtp-Source: ABdhPJzFae5o2sDZdv1GTYiLdAFDJ0G3fZf1iRlU0eP5yGtTc46bhdPOIwOQIpCMXbLmu9KXnz8t04DTE8yeXQij0sE=
X-Received: by 2002:a9d:316:: with SMTP id 22mr3925495otv.210.1617818133281;
 Wed, 07 Apr 2021 10:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
 <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com> <01c82108-64a8-33ee-3984-5bd7056a0002@gmail.com>
In-Reply-To: <01c82108-64a8-33ee-3984-5bd7056a0002@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Apr 2021 19:55:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a37BUdHneO+9+t0Pan3UWZHub-ishcKLNxCbqO0kk0CNw@mail.gmail.com>
Message-ID: <CAK8P3a37BUdHneO+9+t0Pan3UWZHub-ishcKLNxCbqO0kk0CNw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Fabien Parent <fparent@baylibre.com>, 
	Irui Wang <irui.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6aeBsoBsj4SZqDZrql5XuRTimHp0XyWC9QFhQuQiFTc58RkE3jz
 Gt1v6vu0PBa4aLMujEskCwrFQJHqQOv7uLUuuWdkCqoJ1c08XmdSZZ+ZQAmIZG+AzB0x7eG
 pTT+9yBQuYqME0o6dJkQpunhsqUQEpSkcKoIR3MxzmVQwQns0dj+Tg95WCqW2Vlh/JFWaam
 plGgDBgQIJItXXH2APrfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3gYn3ytXC1M=:UPRchqKc1fWnr8wCOarTsT
 VFZLKPUjr7qYu9DUFrmZX/gzmZ/J52NP6tEEKvdhHJntHeMDdeQWH/X7qfeRgigymjFOk0PDd
 Pn9gyP2P1f9Ub5Pq4Jwl07kfe2/QVi48Hym7eMXn+lA+KRnysjBob9xvgHCC+pfj14N5psZIy
 YitsJZXzhfYC3AZb4zFsiKQN6GCLhwzRqlDuv17A1AlSzhgEdv1GxziE8G0O22WkZ3jFwIqKN
 oVmbbWLlaroVyN/Nm9ssc2QSf/cO4ZCYo5UwNMB3/S7CFHs84xBOy7qegXO/A9al79NyLtbXh
 ofpz6EduLUPHGqwxLRLj7cKKHyHLDDRnIycHsBPtpmKgSLQwDQPOEAYSmJfcpJtraaTv1l4P7
 Gv8S3cyH++mw9QBRxKAJ/kVYObAFEN7gqNLE3HrvvggR4Q1RJ4p8Q5dpMIRYcQYHNDRaNdDYQ
 73yKnaCB4VrtBUdZwP06aYMv7chToVQ=

On Wed, Apr 7, 2021 at 6:34 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On 07/04/2021 18:06, Arnd Bergmann wrote:
> > On Wed, Apr 7, 2021 at 1:00 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >>
> >> Hi Olof and Arnd,
> >>
> >> Here comes the second round of arm64 DT patches. Hope I'm not too late.
> >> Basically we add several node to MT8167.
> >> ----------------------------------------------------------------
> >> Fabien Parent (6):
> >
> >>       arm64: dts: mediatek: mt8167: add some DRM nodes
> >
> > I stumbled over this patch adding a lot of aliases:
> >
> > +       aliases {
> > +               aal0 = &aal;
> > +               ccorr0 = &ccorr;
> > +               color0 = &color;
> > +               dither0 = &dither;
> > +               dsi0 = &dsi;
> > +               ovl0 = &ovl0;
> > +               pwm0 = &disp_pwm;
> > +               rdma0 = &rdma0;
> > +               rdma1 = &rdma1;
> > +               wdma0 = &wdma;
> > +       };
> >
> >
> > Something doesn't quite feel right about this, and I checked with Rob,
> > who also thinks this looks wrong. I suppose we need to have a set of
> > well documented alias types rather than just having drivers make up
> > new ones on the spot.
>
> These are needed in the DRM driver, see drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>
> I added Chun-Kuang who is the maintainer of the driver. I think it's a good idea
> to have this alias described in the binding. Maybe a good excuse to move to yaml
> as well :)

The aliases certainly need to be described in the binding, I think someone
would likely have complained earlier if that was part of the binding.

Moving it to yaml is also a good idea, and required for any new devices.

> > I also noticed that some of the referenced nodes are missing a DT
> > binding file, so those need to be added and reviewed as well.
>
> I suppose you are talking about "mediatek,mt8173-vcodec-enc-vp8". The binding
> patches are in the media tree [1]. Maybe I supposed wrongly that they will land
> in v5.13? Or perhaps I should have mentioned that in the pull request.
>
> If it wasn't about this compatible and you can still remember, please let me
> know so that we can fix that :)
>
> I double checked and didn't find any missing binding. Some of them only have the
> fallback binding described, maybe that's what you are referring to.

Here is what I see for all compatible strings of the added device nodes in
this patch, as of linux-next-20210407:

$ for i in mediatek,mt8167-disp-mutex mediatek,mt8167-disp-rdma
mediatek,mt2701-disp-rdma mediatek,mt8167-disp-pwm
mediatek,mt8173-disp-pwn mediatek,mt8167-dsi mediatek,mt2701-dsi
mediatek,mt8167-mipi-tx mediatek,mt2701-mipi-tx
mediatek,mt8167-disp-ovl mediatek,mt8173-disp-ovl
mediatek,mt8167-disp-rdma mediatek,mt2701-disp-rdma
mediatek,mt8167-disp-color mediatek,mt8173-disp-color
mediatek,mt8167-disp-ccorr mediatek,mt8183-disp-ccorr
mediatek,mt8167-disp-aal mediatek,mt8167-disp-gamma
mediatek,mt8173-disp-gamma mediatek,mt8167-disp-dither
mediatek,mt8167-disp-wdma ; do echo === $i ;  git grep -wl $i
Documentation/devicetree/ ; done

=== mediatek,mt8167-disp-mutex
=== mediatek,mt8167-disp-rdma
=== mediatek,mt2701-disp-rdma
=== mediatek,mt8167-disp-pwm
Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
=== mediatek,mt8173-disp-pwn
=== mediatek,mt8167-dsi
=== mediatek,mt2701-dsi
=== mediatek,mt8167-mipi-tx
=== mediatek,mt2701-mipi-tx
Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
=== mediatek,mt8167-disp-ovl
=== mediatek,mt8173-disp-ovl
Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
=== mediatek,mt8167-disp-rdma
=== mediatek,mt2701-disp-rdma
=== mediatek,mt8167-disp-color
=== mediatek,mt8173-disp-color
Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
=== mediatek,mt8167-disp-ccorr
=== mediatek,mt8183-disp-ccorr
=== mediatek,mt8167-disp-aal
=== mediatek,mt8167-disp-gamma
=== mediatek,mt8173-disp-gamma
Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
=== mediatek,mt8167-disp-dither
=== mediatek,mt8167-disp-wdma

So five of the strings are documented, the others are missing. I did not check
the other patches in your branch.

         Arnd
