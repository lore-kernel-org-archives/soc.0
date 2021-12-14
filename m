Return-Path: <SRS0=nEOA=Q7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBEEC433F5
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 18:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B63B0C34606; Tue, 14 Dec 2021 18:59:43 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7028BC34600;
	Tue, 14 Dec 2021 18:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7028BC34600
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MKsf5-1nDuQT1juH-00LG14; Tue, 14 Dec 2021 19:59:40 +0100
Received: by mail-wm1-f46.google.com with SMTP id z206so744977wmc.1;
        Tue, 14 Dec 2021 10:59:40 -0800 (PST)
X-Gm-Message-State: AOAM532f+UICtsV6rd4aI/ki1WNl1VXnSxriG06sGffZF2acYI0QY3XB
	bzA3xsXK+MiTw3gaMPAAvw/AXhYgyjL5Lf67aZM=
X-Google-Smtp-Source: ABdhPJyCPlaPGB/J/sliqo7G9+UCEV+mnAvA0IHx/6Q8DbhASxPzlH7VspUW3pThYNMP7OqSNWLQ68yB/2tzJEvZVvU=
X-Received: by 2002:a05:600c:6d2:: with SMTP id b18mr976745wmn.98.1639508380021;
 Tue, 14 Dec 2021 10:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20211214033617.2979148-1-f.fainelli@gmail.com> <e7f3edb9-4691-2136-7884-b7bea2ac892c@gmail.com>
In-Reply-To: <e7f3edb9-4691-2136-7884-b7bea2ac892c@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Dec 2021 19:59:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3TkCRSfy=0ogn-+cXB-o0YoJKmYNwnmXeGdZoxjGCOYA@mail.gmail.com>
Message-ID: <CAK8P3a3TkCRSfy=0ogn-+cXB-o0YoJKmYNwnmXeGdZoxjGCOYA@mail.gmail.com>
Subject: Re: [GIT PULL 1/1] Broadcom devicetree fixes for 5.16
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:WG9uhT8RogYweVbybbfXGsie1RRWPJysBCr807fLx5E931C2LEX
 vHO8Qn0H/GTr0VD49Wfg4830hSwgdRyNtJSyKJq9hDhKH+tEHueduwXYuLZIUfLkDf59hUq
 s8eepFilW7NYFFtL64MVgxRMqGa3auEs7VbDNHPekfTviApt6OMugr1Fe4BVDrDXFZmRYIP
 QE6+Pr543Tu5aNnXVRQKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:70L/67eseD0=:FdcRb46L45jpZaukAsgx5/
 J67ETPM97EcqZV+lgoBZLTF2KCb+5XdjeS9hWYnLqZFNHzgBTGXByD6hTYY75Bp9hVufY0RSV
 eekjbjtcx5sAIKqvc7TRo8lDau1x1gJTTA7qLETuJ5TPfrrnbLVNYw8tPsgVyhFY4KSuXBTWc
 0mEQcE/bGz44f+6/i+PNIKzJs409KD1f0iKOVV572k8V/v6Afkv+Wit2nylS4+VTgRQRu6p9S
 9RuEU73Wp0jDUQhRPXN5Yrdmp046NkHkCOP5IFwKvIOAa+zycA06gqsKhC9beNi0ZswGPq3nB
 G/4xSaQyfv0w75sisQ9YtyEN4xYRjprNh0ixY9zDeEdyMez6EeW7iG+HKoz7d/BzD5yi0D8q3
 2MscIhICp6c1Y153zmdJX7gnQ59iyU50Ysdcwvo34XydaLrSYq1Dgsrxgd0VdeU9cEWT+ZNro
 V1LapTHC0HGJDyV30Z4QOXnTZUUaE+xfLXqvC0xscFiPgckTyX6He+OLV9p8Lx5ngvKLJK432
 EFeSAA7/QqxBOSSAB4wswVNAE3ezz6glZmhyZmAdZ9do2tmj0FWI1dYfq7QxYzGB5Ho4tipel
 eGeFwIhBEwQJPhZwRIvd5Iaz2tpLUs6+8KVPDBa5tuwROdvcqQdsyPkQr5s1h17iKwZ0/cTgi
 Ca7875A66Vt8LZKId+U8PGoAW+Ffs2kuIIj67zxxRNzoYsn3xF00nAHlURlWnd3DXdkc=

On Tue, Dec 14, 2021 at 6:13 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 12/13/21 7:36 PM, Florian Fainelli wrote:
> > Florian Fainelli (1):
> >       Merge tag 'tags/bcm2835-dt-fixes-2021-12-13' into devicetree/fixes
> >
> > Phil Elwell (2):
> >       ARM: dts: bcm2711-rpi-400: Fix GPIO expander labels
> >       ARM: dts: gpio-ranges property is now required
>
> It looks like the change above needs to be accompanied by
> pinctlr-bcm2835.c changes which have been applied into Linus W's tree.
> Arnd, are you able to back out this pull request for the time being? I
> don't believe any of those fixes are critical for v5.16.

I was already holding off because of a comment I had on the vchiq patch,
as discussed on IRC. I assumed you had already seen the discussion there,
so I did not reply here.

        Arnd
