Return-Path: <SRS0=kw8K=VG=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8820CC433F5
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 14:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E4DDC385A0; Thu, 28 Apr 2022 14:26:07 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 586FEC385A9;
	Thu, 28 Apr 2022 14:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 586FEC385A9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id e189so5480096oia.8;
        Thu, 28 Apr 2022 07:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zXubuPjx2pjAm7hx5cD02wC66amPUE4R4gLIeK6MStk=;
        b=VZ8RIbkbe5Qdu9kBYRWzfIhW1MxLvVd8S/KgaxuFbStIy1eaWsbDIHhkund4DRXQ53
         LTyDcWoCCwbTGehw0SxelubruPbgWwcdXV5oWggxkDRdaJbVxvttoiHFyZ2f06AyQeHU
         U2HC/Kc6TUutGre8Wqqsokyap75nlaFd8NjJcqprgY0s8S/yWB2hUWtrwRY5HgelueGO
         f1dZZ67XfAuwbmPdtGYfjN8QgM4SlHmYmmFbz8HuVrpaFozqKd8bSR/jIcK5oOYDnYnj
         KtOO1pueMC0lA/Zjq43SVtovXbvqYgsIRsYojIvIpNgEd4Xj5SOqfLxblI7jcb9YSRXt
         Jdkg==
X-Gm-Message-State: AOAM530RcL9MuWUOSGOs0MXv6HMqA+QZ2V2CpJiy2QSZFYgj5ka5PU7P
	IK7xWd8wA0UoV/yAUsokpA==
X-Google-Smtp-Source: ABdhPJyGuPF0HOA0tIXbE2tN+YPk6d3A782bnuVeS4IVfJscr45WQBcONamKAO4aNHjqSxXj6dJ9ww==
X-Received: by 2002:aca:1811:0:b0:2ef:3c0f:f169 with SMTP id h17-20020aca1811000000b002ef3c0ff169mr15678035oih.61.1651155965318;
        Thu, 28 Apr 2022 07:26:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x21-20020a4aea15000000b0035e9a8d6e58sm68641ood.26.2022.04.28.07.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 07:26:04 -0700 (PDT)
Received: (nullmailer pid 2177702 invoked by uid 1000);
	Thu, 28 Apr 2022 14:26:03 -0000
Date: Thu, 28 Apr 2022 09:26:03 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, arm-soc <soc@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [RFC PATCH v2 3/3] ARM: dto: Add bcm2711-rpi-7-inches-ts.dts
 overlay
Message-ID: <Ymqj+2xBuHCmGUd/@robh.at.kernel.org>
References: <20220427185243.173594-1-detlev.casanova@collabora.com>
 <20220427185243.173594-4-detlev.casanova@collabora.com>
 <YmmyvdjiG7s/Qil4@robh.at.kernel.org>
 <CAMuHMdXHRQOOrmUO1AyDXye+nnRtpzx7WHiC__whcg0aBtzAmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHRQOOrmUO1AyDXye+nnRtpzx7WHiC__whcg0aBtzAmw@mail.gmail.com>

On Thu, Apr 28, 2022 at 08:44:17AM +0200, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Wed, Apr 27, 2022 at 11:23 PM Rob Herring <robh@kernel.org> wrote:
> > On Wed, Apr 27, 2022 at 02:52:43PM -0400, Detlev Casanova wrote:
> > > Add a device tree overlay to support the official Raspberrypi 7" touchscreen for
> > > the bcm2711 devices.
> > >
> > > The panel is connected on the DSI 1 port and uses the simple-panel
> > > driver.
> > >
> > > The device tree also makes sure to activate the pixelvalve[0-4] CRTC modules
> > >
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > ---
> > >  arch/arm/boot/dts/Makefile                    |   4 +
> > >  arch/arm/boot/dts/overlays/Makefile           |   3 +
> > >  .../dts/overlays/bcm2711-rpi-7-inches-ts.dts  | 125 ++++++++++++++++++
> >
> > .dtso is preferred. I think... It was discussed, but I never got an
> > updated patch to switch.
> 
> Unfortunately that switch indeed hasn't happened yet.
> My main gripe with .dts for overlays is that you cannot know whether
> it's an overlay or not without reading the file's contents.
> Hence tools like make also cannot know, and you need to e.g. list
> all files explicitly in a Makefile.

See my reply in the other thread for that.

> > >  arch/arm64/boot/dts/broadcom/Makefile         |   4 +
> > >  .../arm64/boot/dts/broadcom/overlays/Makefile |   3 +
> > >  .../overlays/bcm2711-rpi-7-inches-ts.dts      |   2 +
> > >  6 files changed, 141 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/overlays/Makefile
> > >  create mode 100644 arch/arm/boot/dts/overlays/bcm2711-rpi-7-inches-ts.dts
> >
> > A global (to arm) 'overlays' directory will create the same mess that we
> > have in arch/arm/boot/dts/. IMO, first you should move all the Broadcom
> > dts files to a 'broadcom' subdirectory like we have for arm64.
> 
> As I believe this display is not only used with real Raspberry Pi
> devices, it makes sense to not have it a broadcom directory.

Then at a minimum 'bcm2711' in the name is not appropriate.

I'm doubtful that as-is the overlay would apply to boards outside of 
RPi's. For this to work (well), there needs to be a connector node to 
translate between connector resources and the base board resources. See 
the recent mikrobus thread[2].

> In fact it may be used on other architectures than arm, too, so I
> think we need an arch-agnostic directory for overlays[1]?

Probably so.

Personally, I would prefer no DTs under /arch.

> This may need remapping of labels. I'm aware the rpi infrastructure has
> support for remapping labels when applying overlays during boot, but
> AFAIK this is not yet supported by fdtoverlay (or perhaps by a fork?)?
> Note that the remapping is also needed if you want to apply two
> instances of the same overlay.

First I've heard of label remapping... I have a lot of concerns about 
using labels for overlays. For starters, with a flip of a switch (-@), 
they all become an ABI when they were not previously. I think at a 
minimum, we need an annotation so that a subset can be exported. 
Anything that's an ABI, we should be documenting and reviewing.

The requirement for overlays upstream is that they are applied at build 
time to a base DT. Otherwise, we can't validate them completely. So if 
there's a label remapping dependency on these, sounds like there is some 
more work to do. The first being getting agreement that label remapping 
is the right approach.

Common label names or some remapping for targets kind of works, but 
easily falls apart. For example, GPIO (or any provider with identifier 
cells) numbering or SPI CS numbering would be different. 

Rob

[2] https://lore.kernel.org/all/YmFo+EntwxIsco%2Ft@robh.at.kernel.org/
