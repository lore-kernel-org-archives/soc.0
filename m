Return-Path: <SRS0=PKIp=FM=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22821C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 07:32:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E411823A6A; Tue,  8 Dec 2020 07:32:10 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FAAF23A69;
	Tue,  8 Dec 2020 07:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FAAF23A69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=geert.uytterhoeven@gmail.com
Received: by mail-ot1-f68.google.com with SMTP id q25so3257054otn.10;
        Mon, 07 Dec 2020 23:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/ntm5kX2/68W+Rb853G9+JOfMY9ZEj0sbIzeYrRjxZk=;
        b=f0M1yWstT8WqIRtVFwsIaQ2bLYEuyZw+F/nBbJbLHy+bRRjdf3aD6lhwfU/s1P2SZd
         eeQRM37BacdpZNdsEFrklqvxyEEPF0JOtDBx1MbankyJRpbvTLXpDdkal/W3+ci+GfFC
         9JJHUUYBY22c6IGUrqkSthR/EHLKXzslkjVMGaLrgkCoKUfG0kl2Au0A1iVjxrGSlVEC
         NTyhYDVqTwDKvQp4Aab2MEaoXENn4NWhcbc+KSOTusJjINMO7pBIICKj0HAw9LNELR0z
         eMAEQX+VJI5cSiZ1jek1vOKtvUSL0Y/UjQ0CMEvOgKIg+3urZ2gHQX4hzp7kezOtvAk7
         Yieg==
X-Gm-Message-State: AOAM533JbstSzBCpMOTGV4TlrrBDY+qmkDSy3eGVXAGuDmMG7MXFOMfN
	7V4/+o8fvGoIwMZXACLTDMUABkQ7OlQarmlWGvs=
X-Google-Smtp-Source: ABdhPJzP3zsmCeQZJGI7WUQZGhFTcbnh1RiZSiteZgaVGYQqSLbzhPDTO9A8RxzKoxXx6hYzxTPBjTUhJJRQIgbFnHI=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr15841607oth.250.1607412729258;
 Mon, 07 Dec 2020 23:32:09 -0800 (PST)
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
 <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com> <CAD=FV=WXcSBkN2y97xNma0P9C6DEPfwkprZe=+0+0iuKYNwwZA@mail.gmail.com>
In-Reply-To: <CAD=FV=WXcSBkN2y97xNma0P9C6DEPfwkprZe=+0+0iuKYNwwZA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Dec 2020 08:31:57 +0100
Message-ID: <CAMuHMdWEuzUTg+f_SBqvT1zFYVFL=odgMLz68DjcvaTrbtd94g@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Doug Anderson <dianders@chromium.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On Mon, Dec 7, 2020 at 11:15 PM Doug Anderson <dianders@chromium.org> wrote:
> On Mon, Dec 7, 2020 at 1:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Mon, Dec 7, 2020 at 9:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Dec 1, 2020 at 3:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > On Tue, Dec 1, 2020 at 12:39 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > So, I think we have two options. If people are willing to move to
> > > > > "disk labels" or to patch their DTBs with mmc aliases, things can stay
> > > > > as is. Otherwise, we can revert the async probe parts of the mmc host
> > > > > drivers, but that would still leave us in a fragile situation.
> > > >
> > > > Can you reliably detect whether the mmc aliases in the dt exist?
> > > > If that's possible, maybe the async flag could be masked out to only have
> > > > an effect when the device number is known.
> > >
> > > IMHO DT aliases are not a proper solution for this.
> > >
> > > Yes, you can detect reliably if an alias exists in the DT.
> > > The problems start when having multiple devices, some with aliases,
> > > some without.  And when devices can appear dynamically (without
> > > aliases, as there is no support for dynamically updating the aliases
> > > list).
> >
> > Actually you hit a problem earlier than that: the async probe is a
> > property of the host controller driver, which may be a pci_driver,
> > platform_driver, usb_driver, or anything else really. To figure out
> > whether to probe it asynchronously, it would have to be the driver
> > core, or each bus type that can host these to understand which
> > device driver is responsible for probing an eMMC device attached
> > to the host.
>
> From what I've seen so far, my current thought on this issue is that
> it's up to Ulf as the MMC maintainer what the next steps are.  For me,
> at least, his argument that MMC block numbers have already shuffled
> around several times in the last several years is at least some
> evidence that they weren't exactly stable to begin with.  While we
> could go back to the numbers that happened to be chosen as of kernel
> v5.9, if someone was updating from a much older kernel then they may
> have different expectations of what numbers are good / bad I think.
>
> I will also offer one possible suggestion: what about a KConfig option
> here?  In theory we could add a KConfig option like
> "CONFIG_MMC_LEGACY_PROBE" or something that.  One can argue about what
> the default ought to be, but maybe that would satisfy folks?  If you
> were happy giving up a little bit of boot speed to get the v5.9 block
> numbers then you could set this.

This is not limited to MMC.
The same is true for sdX, ethX (e* these days), ttyS*, i2cX, spiX, ...
The rule has always been to handle it by udev, disklabels, ...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
