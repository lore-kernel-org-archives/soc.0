Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4640CC63777
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 17:44:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0500920855; Mon, 30 Nov 2020 17:44:24 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF42206E3
	for <soc@kernel.org>; Mon, 30 Nov 2020 17:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OpbVqC/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF42206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=torvalds@linuxfoundation.org
Received: by mail-lf1-f68.google.com with SMTP id z21so23206988lfe.12
        for <soc@kernel.org>; Mon, 30 Nov 2020 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hGGnCVO25VOQfg1PzcbDjqG+MdPgry8c2i2t7+r3Ezo=;
        b=OpbVqC/70CdGr9YEoMNyq56qEVPpQmbjvAsLgtlaJoyII6eswjqe7S4biOHSMstc3n
         YUniZkwX7b1I+uUfHDRpPTPw6l9kKhL20qsHluB+J4/sDH3RuD+1IjpWNP6qBnTTMw50
         sHR3xPzr7wC9l6SkL4QQkuixNxBs9xBM105nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hGGnCVO25VOQfg1PzcbDjqG+MdPgry8c2i2t7+r3Ezo=;
        b=SNT+of35iBfACXGN8pHv8Sa4yTU7bfs70NIgruVgx0cB1iTPZDReCPfupIii3FFI8o
         xKdpBT0vjrG5534T6XUPswGx91WPuQ5xecCuyLk25miSPcMCZFWSxw3rT8awdcE67oEa
         VOOM4u5kreH/w4DgvXi3KfQMcovCWTbkvHYZNv2B1yDRCygKYlelU4cGalq/KG0OmgHL
         FnlFTREYPbUOeTYPfO6aLk1J3an+cocCpEjJD7mx5POVNPXg294UUBJ6YzXkXFyo6VRW
         uxCY+djMbY5j+qJOdL/BxzG7O71UHoESsLidhXE0cV4w5niGSr0oqzf36qomBq8M+gpG
         96VQ==
X-Gm-Message-State: AOAM530II6W+5VNtAnxY6EbejPBqBBD2VPxprX2MxoQpZvVgHPP5oljJ
	YlDACZsHGjTugCIivX5taWcd+BbzwuCliw==
X-Google-Smtp-Source: ABdhPJysw6RdLT3mft3ieUFTGw/boRIqTtpclmXQPzQydXumisPJGtQbW1MI0hWGKDboaISaneSraw==
X-Received: by 2002:a19:418e:: with SMTP id o136mr10541528lfa.80.1606758261071;
        Mon, 30 Nov 2020 09:44:21 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id f3sm2517173lfc.124.2020.11.30.09.44.19
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 09:44:20 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id y7so19213682lji.8
        for <soc@kernel.org>; Mon, 30 Nov 2020 09:44:19 -0800 (PST)
X-Received: by 2002:a2e:50c:: with SMTP id 12mr9985564ljf.371.1606758259392;
 Mon, 30 Nov 2020 09:44:19 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com> <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
In-Reply-To: <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Nov 2020 09:44:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
Message-ID: <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Doug Anderson <dianders@chromium.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 9:04 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Without static assignment, maybe we could do numbering of MMC devices
> in some type of a pre-probe routine?  Is that what you're suggesting?

Yes.

So basically, the way the async probing works for say SCSI is that we
have multiple "layers of asynchroniety". We have the usual "init calls
done asynchronously", but then within the init calls themselves you
can start sub-scans asynchronously.

In order to get reliable ordering between multiple controllers, the
PCI bus is probed in order in pci_init() (or whatever), so each SCSI
controller gets called in a fixed order.

That then gets to scsi_scan_host() does that async_schedule() thing to
actually scan the SCSI buses on that host.

> If so, it seems like it might be a pretty big change to figure out how
> that ought to work (if it can be made to work).

Try to start out doing discovery synchronously, but then any extra
work (actual IO like partition scanning etc) with an "async_work()".

> Just to confirm, I assume you are specifically excluding all block
> devices attached via USB, right?

I have this memory that we tried to scan the root bus in order, just
because people will have internal USB devices that way, and it makes
it *much* easier if they show up in predetermined places.

Note that it really is only the internal devices that matter. Once you
start plugging in an external USB hug and random devices, ordering
clearly won't be reliable.

So this is not a "everything must be ordered". But people who think
that that then means "everythinbg can be random" are wrong. It's
really really inconvenient, because things like disk labels and
various device IDs are not reliable either, and can be very confusing
when two otherwise identical machines look different before you've
installed a full system on them, for example.

So you should strive very hard to make everything that is directly
connected to one SoC always come up in the same order, for example.

And storage devices are special. As Dmitry points out, it doesn't much
matter in what order something like a mouse is scanned. Who cares? If
you have multiple pointer devices, you'll either use them
interchangably, or you'll have some other way to identify them. But
storage is a _lot_ more basic than basically stateless input devices
are.

And no, disk labels really don't always exist. Never ever say "but but
but disk labels".

               Linus
