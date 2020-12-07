Return-Path: <SRS0=s/rV=FL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F48C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 21:56:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B37223436
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 21:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B37223436
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B6IwL6x0apj+jT1P/9ucWKRnUkXeIzqGV12tKyeQbAI=; b=Eht9CAhlJ0TEQYhQR/5L0zZcD
	ugCP/s+3IQX9rGF+nFke1aYvMwaizimVBncmWykPnadvOkQCu/JQbVwQbEyq6pKEWKBnwMwHoQwef
	NlNKtfmWRDZn8HQ6Idp2RHdlJ1zbEhhuPW8p6ImNzyY25oq3tCsSpb/FwSwoTDFmsVVMESpQ+bDXs
	aQcq8cmJqKUvm0/kGMxLFKBi1u5myG/ju6gG6TMFWS61sPXi8S60YOPGN3wZ/q87ujEDwxd9efC7e
	v1ISpTfTSbpQ4QtEf6hwwjIcA4rGpwW2Ps2//9ebBv93pKDLOxCZHwmQoVGL4QSL46geXiDuqMXU9
	GVBUfjADA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmOTd-0000MT-9Z; Mon, 07 Dec 2020 21:55:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmOTa-0000LW-SJ
 for linux-arm-kernel@lists.infradead.org; Mon, 07 Dec 2020 21:55:23 +0000
X-Gm-Message-State: AOAM531MkIS5x579UDO+GCt2FPa7PRnzb1MbMFHd5sj7wR3dXrZOlnPH
 2ia7kzxjrnDZvcgGQTrXr9rjEFythiwLL6s1Xow=
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
 <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
 <CAMuHMdUT83EkE-phUX2Z431AtGPfZvXeKwQriDKEHJKfr2R40A@mail.gmail.com>
In-Reply-To: <CAMuHMdUT83EkE-phUX2Z431AtGPfZvXeKwQriDKEHJKfr2R40A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 7 Dec 2020 22:55:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
Message-ID: <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_165522_987791_57E8911B 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201207215503.CmHSazNORM7mrGx_kJDhnxup8_U9zS4wIB743sVpsrc@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
