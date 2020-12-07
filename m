Return-Path: <SRS0=+zUr=FL=chromium.org=dianders@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57032C433FE
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 22:15:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2CB7D23976; Mon,  7 Dec 2020 22:15:30 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1F7C2396F
	for <soc@kernel.org>; Mon,  7 Dec 2020 22:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1F7C2396F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=dianders@chromium.org
Received: by mail-ua1-f44.google.com with SMTP id p2so283569uac.3
        for <soc@kernel.org>; Mon, 07 Dec 2020 14:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zba0muHnPBIN4bYfIYdIe1tLp1gTKybFphRm3inPByQ=;
        b=Zsvt8tU15EATRR7AKIJauxr8QEVxEngkzOadeW/cbN4n9/N90HtGVaq+XnpsCLmI1Z
         pmn7ElCa48hfbaohINYuFiwl5MbpaIUumSbS61WsFxjxTvIPqp8ca1zo75WkzJvmWwhX
         QT5ZssyLUem0TcgNsrlSGsa17X9INYF0SvvxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zba0muHnPBIN4bYfIYdIe1tLp1gTKybFphRm3inPByQ=;
        b=oCWLCeydnggoDXbWl8qtvAnE8ZRD0s5bNeNTac22xUBMeMYftNr5BjZQKxBg/UBsek
         s7+MGgwBH3N+TKuplsNZWVlD7iDHvTd27LI2cM9b5NgPLtvl0ujt/jgfA52dNXaNGU9l
         AIZyuRxRyEKDSSRjIulBS9NiP3d/ogBX3wOIDA2PN7M6fHBAgr4z1+3H6Fcamdv6tu/g
         YR5DcAoZ97IbiV+eTENEv9LTwWJFCXc3PmiwrJXhg4vVfppIe1GJigf6r2Ipuzs6dhmU
         xBl6MstBmi/i0oin++Pil0X9gyTEWjleMERYDdMg6aZH41mudX52kYg17XlWReymyGzH
         ZDHw==
X-Gm-Message-State: AOAM531xm8+4/4dtkAmtMYp/a7u3VML+pI6SuldEXLu/Gahub7WRVv12
	+P1vORmw+xUFlc85F2gL6tmCl3FM1rNP3g==
X-Google-Smtp-Source: ABdhPJyk1oRKydlEzsSuLL8xp7g8VnvRLUEHnVsmMUuHN4JE+AUh/+TbmScXcQ5OwDBSlnjR7oODwg==
X-Received: by 2002:ab0:5e98:: with SMTP id y24mr11845413uag.108.1607379328559;
        Mon, 07 Dec 2020 14:15:28 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id l26sm1705993vsi.12.2020.12.07.14.15.27
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 14:15:27 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id t19so5019929uaq.1
        for <soc@kernel.org>; Mon, 07 Dec 2020 14:15:27 -0800 (PST)
X-Received: by 2002:ab0:227:: with SMTP id 36mr458027uas.64.1607379327280;
 Mon, 07 Dec 2020 14:15:27 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
 <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
 <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com>
 <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
 <CAMuHMdUT83EkE-phUX2Z431AtGPfZvXeKwQriDKEHJKfr2R40A@mail.gmail.com> <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
In-Reply-To: <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Dec 2020 14:15:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WXcSBkN2y97xNma0P9C6DEPfwkprZe=+0+0iuKYNwwZA@mail.gmail.com>
Message-ID: <CAD=FV=WXcSBkN2y97xNma0P9C6DEPfwkprZe=+0+0iuKYNwwZA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Dec 7, 2020 at 1:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Dec 7, 2020 at 9:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Dec 1, 2020 at 3:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Tue, Dec 1, 2020 at 12:39 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > So, I think we have two options. If people are willing to move to
> > > > "disk labels" or to patch their DTBs with mmc aliases, things can stay
> > > > as is. Otherwise, we can revert the async probe parts of the mmc host
> > > > drivers, but that would still leave us in a fragile situation.
> > >
> > > Can you reliably detect whether the mmc aliases in the dt exist?
> > > If that's possible, maybe the async flag could be masked out to only have
> > > an effect when the device number is known.
> >
> > IMHO DT aliases are not a proper solution for this.
> >
> > Yes, you can detect reliably if an alias exists in the DT.
> > The problems start when having multiple devices, some with aliases,
> > some without.  And when devices can appear dynamically (without
> > aliases, as there is no support for dynamically updating the aliases
> > list).
>
> Actually you hit a problem earlier than that: the async probe is a
> property of the host controller driver, which may be a pci_driver,
> platform_driver, usb_driver, or anything else really. To figure out
> whether to probe it asynchronously, it would have to be the driver
> core, or each bus type that can host these to understand which
> device driver is responsible for probing an eMMC device attached
> to the host.

From what I've seen so far, my current thought on this issue is that
it's up to Ulf as the MMC maintainer what the next steps are.  For me,
at least, his argument that MMC block numbers have already shuffled
around several times in the last several years is at least some
evidence that they weren't exactly stable to begin with.  While we
could go back to the numbers that happened to be chosen as of kernel
v5.9, if someone was updating from a much older kernel then they may
have different expectations of what numbers are good / bad I think.

I will also offer one possible suggestion: what about a KConfig option
here?  In theory we could add a KConfig option like
"CONFIG_MMC_LEGACY_PROBE" or something that.  One can argue about what
the default ought to be, but maybe that would satisfy folks?  If you
were happy giving up a little bit of boot speed to get the v5.9 block
numbers then you could set this.


-Doug
