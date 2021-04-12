Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE45BC433ED
	for <soc@archiver.kernel.org>; Mon, 12 Apr 2021 18:52:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 820B861362; Mon, 12 Apr 2021 18:52:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32E8961352;
	Mon, 12 Apr 2021 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618253575;
	bh=vmh72/XeZ2EcVu0BkeFIMrOShLBZVwPfATYyjCSkxXY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=s6JZEqyuTxWJBYVkq1VRelW1EcwH3H4riAEFagpmQNkJ+t7Q7p7U9runvhYk2/ihH
	 /W2RNm7PNMesKQTlmmQ8vpJpTYqvxXn5p7BLjDEZAV8WpeYH8J/0X9RqAOLVZ58Oxw
	 OzOJDccSo59Z0mxfJb+TiRTZveM3xo16zma6dSZ/ki80/jGF6tR7QCoQ113bddi3bA
	 gMUDBSUk1PWjjstE0Lsc6dTFFmJJPdFzk5vtf+IBkxS6BrbPcX+r3q9TKbaChYEPjv
	 heOzncogUfVyli1Xb4tZ8yz9gkWBs9CdMKotu9WEP8T04nCbCta5h8ST6wgARtRdVs
	 Hqx9nlPiGmIyQ==
Received: by mail-wm1-f45.google.com with SMTP id z24-20020a1cf4180000b029012463a9027fso7472120wma.5;
        Mon, 12 Apr 2021 11:52:55 -0700 (PDT)
X-Gm-Message-State: AOAM532A4Hh89crxx74/m5fTeeUycU867oJo8TUgGggT6qxRsHBOVHDk
	zS1p5h9maltzxsbLDY55KVeJgsTgBu8h0fIOFLU=
X-Google-Smtp-Source: ABdhPJz83AM6Og1E/29eeE0tygPLaSuAZ4OdBuwM+e8QXLur9sHx4AIBZ4LhOaHNDEcvMz6VMMzQ3r0zqQT/YVry8o0=
X-Received: by 2002:a05:600c:19cf:: with SMTP id u15mr468118wmq.43.1618253573862;
 Mon, 12 Apr 2021 11:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
 <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com> <20210412160116.GA904837@yoga>
In-Reply-To: <20210412160116.GA904837@yoga>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 12 Apr 2021 20:52:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
Message-ID: <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, DTML <devicetree@vger.kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@st.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Tony Lindgren <tony@atomide.com>, 
	Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>, 
	Tero Kristo <kristo@kernel.org>, SoC Team <soc@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, 
	Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 12, 2021 at 6:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 12 Apr 08:14 CDT 2021, Arnd Bergmann wrote:
> > On Mon, Apr 12, 2021 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> So the same binding patch is picked up both in the driver and soc tree?
> I was expecting that to cause (harmless) conflicts when things arrive in
> Linus' merge queue?
>
> Or are you saying people go the length to create immutable branches for
> each binding?

I think it's usually one immutable branch for all the bindings of a given
merge window. This avoids the merge conflicts, and you can add further
bindings on the same branch before sending it off to the soc tree.

> I'm curious because it's fairly often that we introduce clocks,
> interconnects etc where the macros from the dt bindings includes aren't
> available for another release (so we use numerical constants and then go
> back and fix them up later).

Ah right, it is particularly bad for platforms that don't have a regular
layout in these blocks and need to define a new constant every time
another clock/reset/pin/... is discovered in the downstream sources.

I was mainly referring to the simpler problem of defining a binding
document for a device once, and then merging the nodes.

       Arnd
