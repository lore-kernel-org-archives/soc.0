Return-Path: <SRS0=HHLn=FS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3292EC2BB40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 20:24:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E42B221D42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 20:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E42B221D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qNA/i1OAmfSnd/z7wCnsVdLlmlz5ktTQu8cYGMJ0al4=; b=m9hSKce6v/OM0CxttpC1EKr+d
	4kQ+zXeNKJZQQOayvYAEtjUfeedeXah2WPvpNJYLXUMzBDLBi7E/kVD/YkN+Lh2KVpDToYGS0h8xD
	uxCbLuqmm2yCo9tVEKl8gsHG0cbwhSx7O4JK/GgnHbmrdmgp/h5+/Cdn2XkqBetUQQoQnrOESlUIv
	xpfhNWvxjhIQkBrRNHwVVSAwFpPJfBo5U9I/n/9+XyT02WBUvh1AQ6xBD1lLzKgMCfGhERW/BCTXs
	HBB2keQLSkhiPIzNoqUCwCXeNEzqyep7mXewWk/z4eAEbkXIktt3PDfdGVkL+WQnFEB2By8+i/vmW
	KnkNgRu3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kouNJ-00032t-GA; Mon, 14 Dec 2020 20:23:17 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kouNF-000328-Fu
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Dec 2020 20:23:15 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id x26so9728023vsq.1
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Dec 2020 12:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qemVwS3A1TNGUMdxCtwvfGT3Y17qMtJiy4ra8p4sq1Y=;
 b=lVWkvwBKzHTtPjibBLUe3+b1OsiC3s9T2X27UCHwCMTWzy/shD9mndOiYoc1BNXKM7
 dCJypQpSPnw7SmqPi7VjaCdXpBvhuAJpsDvR+BSmZ/fmPut/kXpBvc52hzes8DQGKgnq
 iw3EFQQMb2FJL/acs5+LcMLX6in5eD3GA9PGN6YLmHR6YJqCMatwxPmRSjVuH8DaKvNO
 jXyKptm7RmvWup5/xyrjNxSyinSNkr/bfW+gxLQ9KGYAeoR9O+0FXBCksDgs6jL4KyS9
 Fc8Eq1/T6ujVQKhJ32GmFJBDe82bO3oLsh/Cc5YUCzzQ6pBc6sF3JAlYjMHDpsI5R4lP
 Uqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qemVwS3A1TNGUMdxCtwvfGT3Y17qMtJiy4ra8p4sq1Y=;
 b=G6W2gFtj17rd+f8rnm9quTJ+szf0VJ9M8IaOLj05yVgsC1A2sPPHM+KChMtQ19M9En
 BHq5cE0S25bHBqIQp3OJUIwwDbEqGyeYIV1m+lTmjzhyCKyOMEKBj6jWDShheD2tX+V1
 Vy+PyqzdJU8ppoxMDJxqemmB3LyiPq0NfwLFyrOIinKlaGepe3RHZ1Ggq0yw9TJtqF+3
 OwI4VkoRrP6/vyIRO7gjwOk/WGEN8AzWLgibx83M+bgyMLbfCCfgSrs6U9LmY3CbavXW
 A4Nn1AszWlVcVqVdOuw7z2FzuzuQdbwsWnqcKZFMVsuxQRe1s128Y9BAKmAYVR5TG3EJ
 JhoA==
X-Gm-Message-State: AOAM530Xtpa6ppIB+VjjalGhmjGAUMDKvAv+jVgo5VSk4D5r2KQBCPXE
 4qR+aYHiqxXQJBhJSjIHPvx/O6etjOvm9dltl99aRw==
X-Google-Smtp-Source: ABdhPJzf6tl7vK/G2uNALFfDiSu3tqFx1Q3ZvfjSeph3O9cndzHePiJ9fRqUV2uTvmfBjtjIqdOZMxZdUcVV3ABpq+g=
X-Received: by 2002:a67:7f41:: with SMTP id a62mr1604403vsd.55.1607977391606; 
 Mon, 14 Dec 2020 12:23:11 -0800 (PST)
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
 <CAMuHMdWEuzUTg+f_SBqvT1zFYVFL=odgMLz68DjcvaTrbtd94g@mail.gmail.com>
In-Reply-To: <CAMuHMdWEuzUTg+f_SBqvT1zFYVFL=odgMLz68DjcvaTrbtd94g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Dec 2020 21:22:34 +0100
Message-ID: <CAPDyKFpG2JZ6riZo=fFJa7q16bvhFyx2kR1K-s3aSfwZ9NDo6A@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_152313_882465_C50A329B 
X-CRM114-Status: GOOD (  39.44  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201214202234.B5t_lzlU4OnvKyX9EC8JEAmyAOmDfYQ73EklYQbKIa8@z>

On Tue, 8 Dec 2020 at 08:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Doug,
>
> On Mon, Dec 7, 2020 at 11:15 PM Doug Anderson <dianders@chromium.org> wrote:
> > On Mon, Dec 7, 2020 at 1:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Mon, Dec 7, 2020 at 9:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Dec 1, 2020 at 3:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > > On Tue, Dec 1, 2020 at 12:39 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > So, I think we have two options. If people are willing to move to
> > > > > > "disk labels" or to patch their DTBs with mmc aliases, things can stay
> > > > > > as is. Otherwise, we can revert the async probe parts of the mmc host
> > > > > > drivers, but that would still leave us in a fragile situation.
> > > > >
> > > > > Can you reliably detect whether the mmc aliases in the dt exist?
> > > > > If that's possible, maybe the async flag could be masked out to only have
> > > > > an effect when the device number is known.
> > > >
> > > > IMHO DT aliases are not a proper solution for this.
> > > >
> > > > Yes, you can detect reliably if an alias exists in the DT.
> > > > The problems start when having multiple devices, some with aliases,
> > > > some without.  And when devices can appear dynamically (without
> > > > aliases, as there is no support for dynamically updating the aliases
> > > > list).
> > >
> > > Actually you hit a problem earlier than that: the async probe is a
> > > property of the host controller driver, which may be a pci_driver,
> > > platform_driver, usb_driver, or anything else really. To figure out
> > > whether to probe it asynchronously, it would have to be the driver
> > > core, or each bus type that can host these to understand which
> > > device driver is responsible for probing an eMMC device attached
> > > to the host.
> >
> > From what I've seen so far, my current thought on this issue is that
> > it's up to Ulf as the MMC maintainer what the next steps are.  For me,
> > at least, his argument that MMC block numbers have already shuffled
> > around several times in the last several years is at least some
> > evidence that they weren't exactly stable to begin with.  While we
> > could go back to the numbers that happened to be chosen as of kernel
> > v5.9, if someone was updating from a much older kernel then they may
> > have different expectations of what numbers are good / bad I think.
> >
> > I will also offer one possible suggestion: what about a KConfig option
> > here?  In theory we could add a KConfig option like
> > "CONFIG_MMC_LEGACY_PROBE" or something that.  One can argue about what
> > the default ought to be, but maybe that would satisfy folks?  If you
> > were happy giving up a little bit of boot speed to get the v5.9 block
> > numbers then you could set this.
>
> This is not limited to MMC.
> The same is true for sdX, ethX (e* these days), ttyS*, i2cX, spiX, ...
> The rule has always been to handle it by udev, disklabels, ...

That's right.

Although, those rules haven't been sufficient for some cases, which
has been discussed many many times by now. I can dig out some of the
old threads from the mail archive, just tell me and will help to find
them.

For mmc we have decided to improve the situation by adding support for
aliases in DT. The support seems robust enough to me, but if you think
there are problems with it, please tell me and I am happy to help to
improve it.

In regards to adding a new Kconfig option for "legacy probe", I am
open to this if that's what people think is needed. Although, as
pointed out earlier in this thread, it won't move us into a stable
situation. The only solution to get to that point, is either to use
udev/disklabel rules or the mmc aliases in DT.

Kind regards
Uffe

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
