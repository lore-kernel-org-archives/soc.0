Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB746C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 07:33:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A65CD23A69
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 07:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A65CD23A69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/vHfV7lzToCfgUedIPrNGb436gvhK45gewaKstaYlzs=; b=104Mhnu1J2XMFbnkP1pC9aAbS
	DntEcJKWV3oZjO2WolcMPsIsvLY3IV+ZEIO+NRR6MKw0x80soumNHueaXQvXSQ5tasChDfek3PIHv
	rQLQrZA71PtNJPWaSSxX/bsyHruEuzY6jQc8iRWi4SdtG0OsMCQ7hDI8ykZ3NGN+HrzWWs1xWkuAH
	I95LpSDAVohHKqVc4Y6ECeiOS0WuO9Ri/Bd1IGK0/u7aozkpm5EMvqiDHD727BzxZC4Wj9dEAhh82
	rmUR3iUUleoSrd2VYHULemxCfEuc80DUutFBz3ek+Sj4x1IwtZhK9A5YX5yQrM0la0D77Xo9k7Dnl
	LFceD90zA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXTp-0008Nj-9j; Tue, 08 Dec 2020 07:32:13 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXTm-0008NB-Aj
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 07:32:11 +0000
Received: by mail-ot1-f65.google.com with SMTP id j12so15024136ota.7
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 07 Dec 2020 23:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ntm5kX2/68W+Rb853G9+JOfMY9ZEj0sbIzeYrRjxZk=;
 b=JoJB+UOxz9gAWWn2LojSBTk3AdF2lCU3FoxBoMtR/IAlB3har/c7kOMrkdTTCa0Fj2
 7tysJmlyE2m0ePzZjdjn1qu9VhRzJbTx61LTgHFyXFo+/O4n7TzkOA4jevuvTrEb5qx6
 ziYqpUa5rS/InB2NJBNQ4yVozhrYXD8t12yBeQyduplvNXfGQf43t+u65BjVYy3GsnNl
 DorrvauZlBnronT2jSfLT2HxHFCyCEdIjptuBWmeTJbxiisXE0v33EL1JnRqPKamfe1J
 8I2cQuNm83YpSpHHN0JOicGNvZ5NWeaJsfJhDE5f3Oiw1r5/Zg6s4Fr1lYiGJCphX4Tx
 1oAQ==
X-Gm-Message-State: AOAM5302KAMRo+3EFLQLmMgzZsIRtqfVGimxYhQphsc8bdhqY8MH+xeM
 fmnAtHERKIE1clGUpZGKyvu9hb6guYaPxu44k+4=
X-Google-Smtp-Source: ABdhPJzP3zsmCeQZJGI7WUQZGhFTcbnh1RiZSiteZgaVGYQqSLbzhPDTO9A8RxzKoxXx6hYzxTPBjTUhJJRQIgbFnHI=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr15841607oth.250.1607412729258; 
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
 <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
 <CAD=FV=WXcSBkN2y97xNma0P9C6DEPfwkprZe=+0+0iuKYNwwZA@mail.gmail.com>
In-Reply-To: <CAD=FV=WXcSBkN2y97xNma0P9C6DEPfwkprZe=+0+0iuKYNwwZA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Dec 2020 08:31:57 +0100
Message-ID: <CAMuHMdWEuzUTg+f_SBqvT1zFYVFL=odgMLz68DjcvaTrbtd94g@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Doug Anderson <dianders@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_023210_380461_ADA25C75 
X-CRM114-Status: GOOD (  32.12  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208073157.O5W6JhBihcxH60SReqzi6fA4fVuwsPnX1cLZqsyrR5U@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
