Return-Path: <SRS0=ChmJ=FE=chromium.org=dianders@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E82C64E7B
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 18:11:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F13F2074A; Mon, 30 Nov 2020 18:11:34 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 212CF207F7
	for <soc@kernel.org>; Mon, 30 Nov 2020 18:11:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZXrbIa/8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 212CF207F7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=dianders@chromium.org
Received: by mail-ua1-f41.google.com with SMTP id x13so4043443uar.4
        for <soc@kernel.org>; Mon, 30 Nov 2020 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Dq7wgs7NqFyUi65GhuLYJFO9sNtbbe65SBXiBnvq+4=;
        b=ZXrbIa/8DaIaxmun2H25fsWAS8RLe2N5gq5Imr/04QzbQ609MMqEkHkKQVTlL3DDdN
         LUe/cPX1bzXE0eBBl/Is1JV0qVGOzczWmxGBmmS31c1P20iMuERtLDJzbD/4Hgk3a9TT
         ock7ND/J5damPnyRysPzK8apdxzkIZDbtNqOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Dq7wgs7NqFyUi65GhuLYJFO9sNtbbe65SBXiBnvq+4=;
        b=p0x5o6SvDP0ush/ymMpeUwZNXkmWW4YFMO5sSWBq2Ga3WVR5eymVbyXu3QqPtd+Amx
         yWkFhzXUxakLZIbTeNkJg+k/RLAVpyZeF7yie1aEGXRe91scTvGRxPEHghVdDASkwcNr
         Nbphhzxr/W79bxW9hyZs4y4IzzxAWqDFke7Vva+fCZG0T3k0YN9u9mLRJKuVLJ07RAVZ
         ZPdqsMZ7nQCF1na+l9hyA6Jhm9+FDNiEMW+6XTR7O6djGS+PEU3xzW4HJ3x7urzpQEhk
         Bi+SwEZSHtst2n+J4sWYAPczGAd/ze0dC0TAVNdGfJ61eY8aA6fUL0HD2Q+s6eSo6hkO
         SIdg==
X-Gm-Message-State: AOAM533hBSo0Rv1cyxH9AihdPua4Y2m6qa2tcUmZhYNdvZnm+QkkzHku
	95/GTGzZmNvDhLphqNgL7ZgDMnAmT771Vw==
X-Google-Smtp-Source: ABdhPJyXwA78cem3bvZDGFEAYOQyLLuhl+shhyXxxuLQUUEfF2cmeDJRkXdWFaXNz4ZVmPketXdEQQ==
X-Received: by 2002:ab0:4ad7:: with SMTP id t23mr16398391uae.117.1606759892525;
        Mon, 30 Nov 2020 10:11:32 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id t7sm4019872vkk.43.2020.11.30.10.11.31
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 10:11:32 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id v8so6829260vso.2
        for <soc@kernel.org>; Mon, 30 Nov 2020 10:11:31 -0800 (PST)
X-Received: by 2002:a67:4242:: with SMTP id p63mr16948698vsa.34.1606759890976;
 Mon, 30 Nov 2020 10:11:30 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com> <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
In-Reply-To: <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Nov 2020 10:11:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
Message-ID: <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Nov 30, 2020 at 9:44 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So basically, the way the async probing works for say SCSI is that we
> have multiple "layers of asynchroniety". We have the usual "init calls
> done asynchronously", but then within the init calls themselves you
> can start sub-scans asynchronously.
>
> In order to get reliable ordering between multiple controllers, the
> PCI bus is probed in order in pci_init() (or whatever), so each SCSI
> controller gets called in a fixed order.
>
> That then gets to scsi_scan_host() does that async_schedule() thing to
> actually scan the SCSI buses on that host.
>
> > If so, it seems like it might be a pretty big change to figure out how
> > that ought to work (if it can be made to work).
>
> Try to start out doing discovery synchronously, but then any extra
> work (actual IO like partition scanning etc) with an "async_work()".

Right, so basically this is like how MMC did it before my patches.  I
was just trying to save the extra 40 ms.


> > Just to confirm, I assume you are specifically excluding all block
> > devices attached via USB, right?
>
> I have this memory that we tried to scan the root bus in order, just
> because people will have internal USB devices that way, and it makes
> it *much* easier if they show up in predetermined places.
>
> Note that it really is only the internal devices that matter. Once you
> start plugging in an external USB hug and random devices, ordering
> clearly won't be reliable.

I guess that's more of a heuristic though, right?  There may be
computers with an internal USB hub before the storage.  There may also
be computers (small embedded raspberry-pi-type-things) where the
primary storage for the system is expected to be an external USB
device, possibly connected through a hub.


> So this is not a "everything must be ordered". But people who think
> that that then means "everythinbg can be random" are wrong. It's
> really really inconvenient, because things like disk labels and
> various device IDs are not reliable either, and can be very confusing
> when two otherwise identical machines look different before you've
> installed a full system on them, for example.
>
> So you should strive very hard to make everything that is directly
> connected to one SoC always come up in the same order, for example.

So I guess the answer here is: strive very hard but you don't have to
guarantee that every corner case is covered?


> And storage devices are special. As Dmitry points out, it doesn't much
> matter in what order something like a mouse is scanned. Who cares? If
> you have multiple pointer devices, you'll either use them
> interchangably, or you'll have some other way to identify them. But
> storage is a _lot_ more basic than basically stateless input devices
> are.

Yes, storage devices are special, but the point I was trying to make
is that with SoCs there may be a whole lot of devices (with complex
dependencies) in the path of storage devices.  They can need clocks,
regulators, GPIOs, etc and any of those things could be slow to probe
and we might want to speed up boot by making them async.  They also
could be parented on busses that could be slow to probe or might
themselves have dependencies on clocks, regulators, GPIOs, etc.  It
won't always be obvious which of these things are in the path of a
block device.

In a traditional PC I think there are fewer dependencies?


I guess the question is: why is static assignment of numbers not an
acceptable solution to the problem?  It gives us the desired fixed
numbers and automatically avoids all weird probe ordering / dependency
problems.

-Doug
