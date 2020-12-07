Return-Path: <SRS0=s/rV=FL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4290C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 22:16:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 973B62396F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 22:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 973B62396F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=un9viuJ09V/c6+8xJc3RC6oy+SRphzLhKUOy0Y5Lb94=; b=xhUyEm5tT9ojyE4ZIMdgSm9LQ
	zWvjDsxFdi0RY/8ZyV8GsewAOXMJV0yXghryuTiCy0LBN3m2m/JO7GCcU0/VF/tBalpi3ZYNxlVgN
	IiIbkKPxPrKp5a2exiPnUPiH9BpRwyhbC27qW4ZsBxyP3wAxGf7bGzGC1qlcK9PnOb9t0p1T7kYyf
	cN1OZL/ExxfqGCb7ljMH61mnQmW4r6ipGF758iH/RcpJAFZa3/cxHmTVWzQejK9eWjp8pesvS34gB
	Q/pkB0gYNWS73b+w2E04KB9mWJtW2jKslmzMAOzLHV6yaEK3NiYjhN9GIjoY6dCCihfNbQLZhenbW
	HKUIxvX5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmOn8-0002fW-Cb; Mon, 07 Dec 2020 22:15:34 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmOn5-0002ev-MY
 for linux-arm-kernel@lists.infradead.org; Mon, 07 Dec 2020 22:15:32 +0000
Received: by mail-vs1-xe36.google.com with SMTP id v8so8505410vso.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 07 Dec 2020 14:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zba0muHnPBIN4bYfIYdIe1tLp1gTKybFphRm3inPByQ=;
 b=Zsvt8tU15EATRR7AKIJauxr8QEVxEngkzOadeW/cbN4n9/N90HtGVaq+XnpsCLmI1Z
 pmn7ElCa48hfbaohINYuFiwl5MbpaIUumSbS61WsFxjxTvIPqp8ca1zo75WkzJvmWwhX
 QT5ZssyLUem0TcgNsrlSGsa17X9INYF0SvvxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zba0muHnPBIN4bYfIYdIe1tLp1gTKybFphRm3inPByQ=;
 b=K2Avdi7PRU2BIDQtpLRg38kpqYubH8n0cIqVfwKnAx1sQnjaLKQHRtr+zEUrS8aOUg
 ISyI+9EVAebQePGPYUIy/H6FGGzRr0Y/IIM0RTGYP/rwsRmLHtmsw7pha7Wc7Ys9dary
 KVjBR9YwUcRriYQAMhBV98p7Q1RJpq95lbx0ukMMkn8HXVXigLaPc2I4el3UNp/Tj4xE
 /DB8byBl5jrbZfYWTZz5/2hCXAgwKVMqxw5sWXj1zfkXMlE2QXSVuGtiGHAK7Yq5qKjX
 LAGOH58+KU0YyyNFwHOb/pV37zFKIB/Z/MjwcmkYfKfNmvG2vCUg2ETLWlSVROR59LxF
 MjxQ==
X-Gm-Message-State: AOAM531xwoEX5or8Mjrv9VFKjT3tWahGh3F/xt87mm3TQlXVlHEyyGan
 S5Jtn/fccSF1PQWcwj/LLsIVntV7XgI2vw==
X-Google-Smtp-Source: ABdhPJwbkqbSkm4FmO9Du4gyD0S6XwgckhvX8kbk51yO9RbMWfXZojFxyu15GKTSKVqrRK6j1zBAdA==
X-Received: by 2002:a67:f3ce:: with SMTP id j14mr14616898vsn.26.1607379328778; 
 Mon, 07 Dec 2020 14:15:28 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id x186sm1841849vke.32.2020.12.07.14.15.27
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 14:15:27 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id s23so2152208uaq.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 07 Dec 2020 14:15:27 -0800 (PST)
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
 <CAMuHMdUT83EkE-phUX2Z431AtGPfZvXeKwQriDKEHJKfr2R40A@mail.gmail.com>
 <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
In-Reply-To: <CAK8P3a3xqqT7mcroY+-fg4T39msw72SB0NbbVKfBghmOFTNZqw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Dec 2020 14:15:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WXcSBkN2y97xNma0P9C6DEPfwkprZe=+0+0iuKYNwwZA@mail.gmail.com>
Message-ID: <CAD=FV=WXcSBkN2y97xNma0P9C6DEPfwkprZe=+0+0iuKYNwwZA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_171531_800040_7137CD38 
X-CRM114-Status: GOOD (  28.61  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201207221515.nHQRnRhFcXD4Zcp5bt4dthRlHnTlZLBozxAhLu0RkO0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
