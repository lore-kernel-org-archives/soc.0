Return-Path: <SRS0=qnKN=VG=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ED9C433EF
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 06:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCCA7C385A9; Thu, 28 Apr 2022 06:44:33 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0A14C385A0;
	Thu, 28 Apr 2022 06:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0A14C385A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id r8so2600180qvx.10;
        Wed, 27 Apr 2022 23:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j6lRX8HkbDGmeYmMR2pBv8oehQI8eucp0kVSXCaIj8U=;
        b=U+WDIaYD1wKjo2XtBiciW2Z1RsjRpSvBnT1g0sH46OUk0JbsyI9U/GR259ArSfqYU1
         iA7addjTdyLVKV+7vjCJvAStMZWWgt1S54ojXhFsh7Pd9LbmtAwmR1UqOOrNN3MYere5
         SDiGpZ4wuSJKfYMSkgjIrWKGpLUyJ8pC70tK8Tx2ObDwckyOtm4tzjUkTDjTbRo6Dy2F
         fE8c8TMFMDG2g2o812mHOH43aTz2EktKRsMl1px4OPhvlhk2yl+ElIg9UG+spzCt0vjl
         Uv8XNqgqxERDXUuPa+YqJXq5MThcTrA7mRIyZmR3XoU4pI0PNvTLUs2e2dlKPJwACKUD
         23pQ==
X-Gm-Message-State: AOAM533XahwTq6009XWpIpvX0DazDU8oVKmR77kpE9VZ+JPTXC965i0s
	C3DKZllIFJD+7kPFZo1+DPVGJGoy984U8g==
X-Google-Smtp-Source: ABdhPJwhCGXNgxNULAdDVZPPNAB//Dmqsu0G9a8xu+utRJOaxOXEl5+L4DybcDjEIQ/NZJQ8SoikOA==
X-Received: by 2002:a05:6214:27e9:b0:456:2f4f:c80 with SMTP id jt9-20020a05621427e900b004562f4f0c80mr17513670qvb.108.1651128271407;
        Wed, 27 Apr 2022 23:44:31 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id w6-20020a05622a190600b002f1f91ad3e7sm11514315qtc.22.2022.04.27.23.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 23:44:30 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2f7b815ac06so42549717b3.3;
        Wed, 27 Apr 2022 23:44:29 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr30791811ywi.449.1651128269435; Wed, 27
 Apr 2022 23:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220427185243.173594-1-detlev.casanova@collabora.com>
 <20220427185243.173594-4-detlev.casanova@collabora.com> <YmmyvdjiG7s/Qil4@robh.at.kernel.org>
In-Reply-To: <YmmyvdjiG7s/Qil4@robh.at.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Apr 2022 08:44:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHRQOOrmUO1AyDXye+nnRtpzx7WHiC__whcg0aBtzAmw@mail.gmail.com>
Message-ID: <CAMuHMdXHRQOOrmUO1AyDXye+nnRtpzx7WHiC__whcg0aBtzAmw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] ARM: dto: Add bcm2711-rpi-7-inches-ts.dts overlay
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Frank Rowand <frowand.list@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, arm-soc <soc@kernel.org>, 
	Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Wed, Apr 27, 2022 at 11:23 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Apr 27, 2022 at 02:52:43PM -0400, Detlev Casanova wrote:
> > Add a device tree overlay to support the official Raspberrypi 7" touchscreen for
> > the bcm2711 devices.
> >
> > The panel is connected on the DSI 1 port and uses the simple-panel
> > driver.
> >
> > The device tree also makes sure to activate the pixelvalve[0-4] CRTC modules
> >
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |   4 +
> >  arch/arm/boot/dts/overlays/Makefile           |   3 +
> >  .../dts/overlays/bcm2711-rpi-7-inches-ts.dts  | 125 ++++++++++++++++++
>
> .dtso is preferred. I think... It was discussed, but I never got an
> updated patch to switch.

Unfortunately that switch indeed hasn't happened yet.
My main gripe with .dts for overlays is that you cannot know whether
it's an overlay or not without reading the file's contents.
Hence tools like make also cannot know, and you need to e.g. list
all files explicitly in a Makefile.

> >  arch/arm64/boot/dts/broadcom/Makefile         |   4 +
> >  .../arm64/boot/dts/broadcom/overlays/Makefile |   3 +
> >  .../overlays/bcm2711-rpi-7-inches-ts.dts      |   2 +
> >  6 files changed, 141 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/overlays/Makefile
> >  create mode 100644 arch/arm/boot/dts/overlays/bcm2711-rpi-7-inches-ts.dts
>
> A global (to arm) 'overlays' directory will create the same mess that we
> have in arch/arm/boot/dts/. IMO, first you should move all the Broadcom
> dts files to a 'broadcom' subdirectory like we have for arm64.

As I believe this display is not only used with real Raspberry Pi
devices, it makes sense to not have it a broadcom directory.
In fact it may be used on other architectures than arm, too, so I
think we need an arch-agnostic directory for overlays[1]?
This may need remapping of labels. I'm aware the rpi infrastructure has
support for remapping labels when applying overlays during boot, but
AFAIK this is not yet supported by fdtoverlay (or perhaps by a fork?)?
Note that the remapping is also needed if you want to apply two
instances of the same overlay.

> >  create mode 100644 arch/arm64/boot/dts/broadcom/overlays/Makefile
> >  create mode 100644 arch/arm64/boot/dts/broadcom/overlays/bcm2711-rpi-7-inches-ts.dts

And this one just includes the former, and thus sort-of serves as an
example of my point above ;-)

[1] Note that this does not only apply to overlays: soon we will
    have a full SoC peripheral description in r9a07g043.dtsi to
    share between RZ/G2UL (arm64) and RZ/Five (riscv)).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
