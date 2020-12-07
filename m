Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78308C4361B
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 21:55:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 316D42396D; Mon,  7 Dec 2020 21:55:21 +0000 (UTC)
X-Gm-Message-State: AOAM533ALY/uFEPD/7Hnr7TstsdtfgXhQobTR24VfrrOrd+rooPKbkN8
	xFQBVy/YbxsuEOLsdV+bRP+J/cyWT9+mvbgWwnE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607378121;
	bh=6s3lw0BOEiFJAQ228QkxzmN4Ue6MPZrtxOi61zz23VA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Ozqf1eVirGGdtYdAqoFQ6ohaduuOWei7gt5IRTveZs23uDIW26F3b5rzXkEz8myfW
	 c3pFcac/+dSBJpc6mAXBJl9JvQYAjBn2YxSJNakDDHicoVrD1aYEuJuDtucSA1TvRV
	 D4jfHxm1Shvw/EnFhrKCuZEfQudRPOKnOkIylqB1E+xKaO26prultR7V5y0c2S6JcC
	 EhFfblMLuBAjdIqk8qo527kBVAnwwmzm+Od2wKvfqQyHCeCYIsvYROaCUCh6e22bMx
	 KLVL4BnmKMbq38waIBtq+Ae/VxPclj0lP61H2GMsqG1GFK9De9taQtuNfbNb/y2gbD
	 xLRG/vzmbfBIg==
X-Google-Smtp-Source: ABdhPJwNp7L3JQoRo1DbbUVqt6LGXZf5XP9uSkIH43z7/KBuPbJOlvmObMj3s8JNYRVmk8+iab+qCxhbhNMCFe+LHuY=
X-Received: by 2002:a05:6808:9a9:: with SMTP id e9mr683105oig.4.1607378120398;
 Mon, 07 Dec 2020 13:55:20 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
 <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
 <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com>
 <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com> <CAMuHMdUT83EkE-phUX2Z431AtGPfZvXeKwQriDKEHJKfr2R40A@mail.gmail.com>
In-Reply-To: <CAMuHMdUT83EkE-phUX2Z431AtGPfZvXeKwQriDKEHJKfr2R40A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 7 Dec 2020 22:55:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
Message-ID: <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Doug Anderson <dianders@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 7, 2020 at 9:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Dec 1, 2020 at 3:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Tue, Dec 1, 2020 at 12:39 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > So, I think we have two options. If people are willing to move to
> > > "disk labels" or to patch their DTBs with mmc aliases, things can stay
> > > as is. Otherwise, we can revert the async probe parts of the mmc host
> > > drivers, but that would still leave us in a fragile situation.
> >
> > Can you reliably detect whether the mmc aliases in the dt exist?
> > If that's possible, maybe the async flag could be masked out to only have
> > an effect when the device number is known.
>
> IMHO DT aliases are not a proper solution for this.
>
> Yes, you can detect reliably if an alias exists in the DT.
> The problems start when having multiple devices, some with aliases,
> some without.  And when devices can appear dynamically (without
> aliases, as there is no support for dynamically updating the aliases
> list).

Actually you hit a problem earlier than that: the async probe is a
property of the host controller driver, which may be a pci_driver,
platform_driver, usb_driver, or anything else really. To figure out
whether to probe it asynchronously, it would have to be the driver
core, or each bus type that can host these to understand which
device driver is responsible for probing an eMMC device attached
to the host.

       Arnd
