Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016C8C4361B
	for <linux-devicetree@archiver.kernel.org>; Tue, 15 Dec 2020 08:20:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 949E122273
	for <linux-devicetree@archiver.kernel.org>; Tue, 15 Dec 2020 08:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgLOIUa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 15 Dec 2020 03:20:30 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38115 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgLOIUX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 15 Dec 2020 03:20:23 -0500
Received: by mail-oi1-f194.google.com with SMTP id x13so13422728oic.5;
        Tue, 15 Dec 2020 00:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p5+R1X9QLX+TWZajWd6rwkHGcp4/zZugTwvmGgE1C/E=;
        b=T9WSOAbw969S4Xx206lZ+Oeu+alOXnPWtGozqhbDAcWCmQPXDjfSkyjA5Y9ZsfgFKS
         395e3X4dJ7yCPbIOLqILstk8bPLL7nKFrMCZ3xAJxAtIBnnPCZQMAvSVxnAq1SBqSXKT
         npwWHrXXtW5Z6KufJQJaSBSEoThX4Vu4DuY7L0aYqvamN1YgKbr8ueBcYjnn7Tq5sQKu
         ptT1t6mXzrTrW7iInqm8+4bLuEN4sJFaiZZDHasLjROI/Fq1W1OaDLLGObhR9GOzKOcK
         S2+OGFTh+owHdQjLAUbWN6Whh5HWwsJe+hvRvUqzMuh7se70cH6ppivthz2yFRNpvgBu
         Cpxg==
X-Gm-Message-State: AOAM5326pkMMRWWY0ZwLbc7QxpXQUHKnJ3SZhXQZ78F1u/hBt7CcluLN
        7He6qdex8ucODW6wtZo2aarYXan9KSkoDCBOwy0=
X-Google-Smtp-Source: ABdhPJz2pvYZqfA8u5YYKQGqP229v9Ys4lCyr+I39Cq9R2A+meSohQnYHADUaHDjX3vEgLH9FA5ZHXAF8UXP8OULghk=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr20674491oia.148.1608020381818;
 Tue, 15 Dec 2020 00:19:41 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
 <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
 <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com>
 <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
 <CAMuHMdUT83EkE-phUX2Z431AtGPfZvXeKwQriDKEHJKfr2R40A@mail.gmail.com>
 <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
 <CAD=FV=WXcSBkN2y97xNma0P9C6DEPfwkprZe=+0+0iuKYNwwZA@mail.gmail.com>
 <CAMuHMdWEuzUTg+f_SBqvT1zFYVFL=odgMLz68DjcvaTrbtd94g@mail.gmail.com> <CAPDyKFpG2JZ6riZo=fFJa7q16bvhFyx2kR1K-s3aSfwZ9NDo6A@mail.gmail.com>
In-Reply-To: <CAPDyKFpG2JZ6riZo=fFJa7q16bvhFyx2kR1K-s3aSfwZ9NDo6A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Dec 2020 09:19:30 +0100
Message-ID: <CAMuHMdVOxdYQD6qTF08NFiw4bRg3xscX=rRW1m9ix1AGEm3DGQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To:     Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SoC Team <soc@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20201215081930.t20lPTcWlM0rMO47AimizSaZOP_siA-ynd5DMg_H76o@z>

Hi Ulf,

On Mon, Dec 14, 2020 at 9:23 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Tue, 8 Dec 2020 at 08:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Dec 7, 2020 at 11:15 PM Doug Anderson <dianders@chromium.org> wrote:
> > > On Mon, Dec 7, 2020 at 1:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > On Mon, Dec 7, 2020 at 9:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Tue, Dec 1, 2020 at 3:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > > > On Tue, Dec 1, 2020 at 12:39 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > > So, I think we have two options. If people are willing to move to
> > > > > > > "disk labels" or to patch their DTBs with mmc aliases, things can stay
> > > > > > > as is. Otherwise, we can revert the async probe parts of the mmc host
> > > > > > > drivers, but that would still leave us in a fragile situation.
> > > > > >
> > > > > > Can you reliably detect whether the mmc aliases in the dt exist?
> > > > > > If that's possible, maybe the async flag could be masked out to only have
> > > > > > an effect when the device number is known.
> > > > >
> > > > > IMHO DT aliases are not a proper solution for this.
> > > > >
> > > > > Yes, you can detect reliably if an alias exists in the DT.
> > > > > The problems start when having multiple devices, some with aliases,
> > > > > some without.  And when devices can appear dynamically (without
> > > > > aliases, as there is no support for dynamically updating the aliases
> > > > > list).
> > > >
> > > > Actually you hit a problem earlier than that: the async probe is a
> > > > property of the host controller driver, which may be a pci_driver,
> > > > platform_driver, usb_driver, or anything else really. To figure out
> > > > whether to probe it asynchronously, it would have to be the driver
> > > > core, or each bus type that can host these to understand which
> > > > device driver is responsible for probing an eMMC device attached
> > > > to the host.
> > >
> > > From what I've seen so far, my current thought on this issue is that
> > > it's up to Ulf as the MMC maintainer what the next steps are.  For me,
> > > at least, his argument that MMC block numbers have already shuffled
> > > around several times in the last several years is at least some
> > > evidence that they weren't exactly stable to begin with.  While we
> > > could go back to the numbers that happened to be chosen as of kernel
> > > v5.9, if someone was updating from a much older kernel then they may
> > > have different expectations of what numbers are good / bad I think.
> > >
> > > I will also offer one possible suggestion: what about a KConfig option
> > > here?  In theory we could add a KConfig option like
> > > "CONFIG_MMC_LEGACY_PROBE" or something that.  One can argue about what
> > > the default ought to be, but maybe that would satisfy folks?  If you
> > > were happy giving up a little bit of boot speed to get the v5.9 block
> > > numbers then you could set this.
> >
> > This is not limited to MMC.
> > The same is true for sdX, ethX (e* these days), ttyS*, i2cX, spiX, ...
> > The rule has always been to handle it by udev, disklabels, ...
>
> That's right.
>
> Although, those rules haven't been sufficient for some cases, which
> has been discussed many many times by now. I can dig out some of the
> old threads from the mail archive, just tell me and will help to find
> them.
>
> For mmc we have decided to improve the situation by adding support for
> aliases in DT. The support seems robust enough to me, but if you think
> there are problems with it, please tell me and I am happy to help to
> improve it.

DT rule #1: DT is hardware description (device naming is software
policy).

The only generally accepted aliases are "serial0" (the first serial
port, as such labeled on the board, to be used for the console;  there
may be more labeled ports, and thus more "serialX" aliases), and
"ethernet0" (the first Ethernet port, so U-Boot knows to which port to
add an appropriate "local-mac-address" property, when booting over the
network).  So yeah, you can claim the first SD card slot is labeled as
such, and thus deserves an alias.  Then the issue is what you do with
the remaining slots, which can be added either statically or
dynamically.  And what if for some reason the labeled MMC slot is not
probed first...

The description of commit 7678f4c20fa7670f ("serial: sh-sci: Add support
for dynamic instances") mentions some background and remaining
issues w.r.t. aliases.

> In regards to adding a new Kconfig option for "legacy probe", I am
> open to this if that's what people think is needed. Although, as
> pointed out earlier in this thread, it won't move us into a stable
> situation. The only solution to get to that point, is either to use
> udev/disklabel rules or the mmc aliases in DT.

IMHO that will be a fragile solution, too: over time, it may become
harder and harder to maintain the original probe order.

And if it will be an option, it means there will be two code paths to
maintain, increasing the burden.



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
