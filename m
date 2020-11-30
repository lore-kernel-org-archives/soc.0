Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E59C83016
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 18:15:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 45F7220789; Mon, 30 Nov 2020 18:15:52 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1482074A
	for <soc@kernel.org>; Mon, 30 Nov 2020 18:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eXzgCuN7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D1482074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=torvalds@linuxfoundation.org
Received: by mail-lf1-f67.google.com with SMTP id t6so23407080lfl.13
        for <soc@kernel.org>; Mon, 30 Nov 2020 10:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H93VChb+sVDTZJCSL0yt9I/1R/7Lu+WEYlaSl0sXgTA=;
        b=eXzgCuN7073pTNG0csTzX/DdnH7UPcUOnbwk6PaAVilE/XN5tq15kUHWr+pOO1gOnH
         qp97XkMGlfswR8jtOJQIcLCC6iRSBQXSw5z6gNL1p6WjoFI3JhOhaDsAZiZxOTT5ZNif
         /dANSWfNakGAJAYTp9w8DgQ/8/5XMhUFXSJtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H93VChb+sVDTZJCSL0yt9I/1R/7Lu+WEYlaSl0sXgTA=;
        b=gyBRzttOjXFCzAEUxBIkU5DzE+s4KcoLoIcv0XGKSKp83o0/eiqJigog25FMFMEGJX
         rQFJFgDKpc/uY+P1X1vlwGETQETD9zVpJv8N6XLhvF+kEW7siBx6D/nQ8jUuc1kivFow
         M4DtlYV9drsxZPTaOc1z7RUE1zS/eX6sTNl2WO87c9X++Gw5J7P/WicOqJe6pompIODr
         ErF6IPF4AGysP67M0kIkxgs8Miat4BKbyRaMcAz6JEu3wIiRdMzempP6uNpegPw8LVFg
         tmnCDXiEZKuSqBdM6m2BLauqoyb/QPmQJJUfgKpgpLCcSmdPpIKi1MkrsMmd3HDA7+vi
         /ntQ==
X-Gm-Message-State: AOAM530SCbLLzhqs1ZfXze7/PcGEDS3br2PhAFimWA6z5n/w4vwom75E
	nYqI0XPmk7PMlcV4GW37sWnMNRRidoiNTQ==
X-Google-Smtp-Source: ABdhPJzUoYy/59mGCaYW07QPcYAweN0x2f2lb72p+X12ZchRlISloW4KmQdLObObp9ifvduE0GA1FA==
X-Received: by 2002:a05:6512:3a6:: with SMTP id v6mr9328936lfp.90.1606760147834;
        Mon, 30 Nov 2020 10:15:47 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id q29sm2526576lfd.22.2020.11.30.10.15.46
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 10:15:46 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id j205so23424564lfj.6
        for <soc@kernel.org>; Mon, 30 Nov 2020 10:15:46 -0800 (PST)
X-Received: by 2002:a19:ed0f:: with SMTP id y15mr9347723lfy.352.1606760145852;
 Mon, 30 Nov 2020 10:15:45 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com> <20201130180523.GZ1551@shell.armlinux.org.uk>
In-Reply-To: <20201130180523.GZ1551@shell.armlinux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Nov 2020 10:15:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgZhkMu5UFgmD2Yt96S_nrhMzTTXfqOwgBe4nsg0R_M6Q@mail.gmail.com>
Message-ID: <CAHk-=wgZhkMu5UFgmD2Yt96S_nrhMzTTXfqOwgBe4nsg0R_M6Q@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Arnd Bergmann <arnd@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 10:05 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> If you think that /dev/sda for example is always the machine's internal
> HDD, that is wrong.

Yes. See the whole part about

 "Note that it really is only the internal devices that matter. Once you
  start plugging in an external USB hug and random devices, ordering
  clearly won't be reliable.

  So this is not a "everything must be ordered". But people who think
  that that then means "everythinbg can be random" are wrong"

in my email.

And the key word here is:

> I have a HP Pavilion laptop with its internal HDD with a Windows
> installation. Because I didn't want to destroy that in any way, I
> bought an external USB3 SATA enclosure and SSD, and installed Debian
> Stable on there.

.. but it will still generally be stable with the same hardware
configuration, and not fluctuate randomly from boot to boot when the
hardware is the same.

Is it a guarantee? No. External plugged in hardware can change things.
In fact, when you have things like Thunderbolt involved, since it just
looks like PCI, even the PCI probing order won't be the same with or
without the plugged-in device.

But again: avoid randomness. The difference between non-random and
random is that one is predictable and one is not.

Predictability is good. It's not necessariyl always achievable, but
it's very much something we should strive for VERY HARD.

Predictability and reproducibility help debugging enormously. It means
that things like "git bisect" work a lot better. It makes user reports
much more understandable when two users with identical hardware see
identical issues.

Seriously. Anybody who argues against reproducibility is so far out to
lunch that it's not even funny.

You seem to argue on a complete technicality.

            Linus
