Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78E1C433ED
	for <soc@archiver.kernel.org>; Mon, 12 Apr 2021 13:14:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 90A366135A; Mon, 12 Apr 2021 13:14:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 397C66134F;
	Mon, 12 Apr 2021 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618233272;
	bh=HluCuZer1wtOQ7yKaD3BOmoFclNAYXr1PfGHYNVB/bA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SUBPbOVkl6FAG7SkAML9yDX5OmGri2iOWnL/7Ro3W3KKwQ3KlkcDun8y77dFZCkO4
	 z/Bd7g4G14i3hilZ9K9qdwTezrWUnq4gB05ToR5Az2+dCu4GVhkpcTXUN7oxKZGz9I
	 rGwCHiJKlUL1GN6FaUJedHh2L7utwVXMsAxKqhtXjJHGZiC7OPvROEV7yabzFl5Iel
	 6BSZ8Sb0ikmOTUb5BMS6w2VnTpUPEQfeep6rTKrmY4TYBExIQg5WT0cpp7YqpjLyoF
	 fRLGbTNBMoS8qjb1t6EI3r+va476hH4dZq76tdIFsbYUeKy21fNH/wuxmvDBKmvnJx
	 12S9QXd2qmzxw==
Received: by mail-wr1-f42.google.com with SMTP id a6so12906279wrw.8;
        Mon, 12 Apr 2021 06:14:32 -0700 (PDT)
X-Gm-Message-State: AOAM532PURYMNpMPKr6J+lXWrl8lctemJg0/iach+WOrU6dDg79DI80S
	LSMuMx1IkerGrMRmFcvZShgbALWyLmH7XffCc6E=
X-Google-Smtp-Source: ABdhPJw/vFv/9BLF3d72KloeteQhapgsTZaQc+JcJdx2qTh3Sa54/Kh2Nj9F4fjgwuvsqXqIynxFLzTMYPIaG6v7918=
X-Received: by 2002:adf:e483:: with SMTP id i3mr4156187wrm.286.1618233270813;
 Mon, 12 Apr 2021 06:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 12 Apr 2021 15:14:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
Message-ID: <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@st.com>, Kevin Hilman <khilman@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Tony Lindgren <tony@atomide.com>, 
	Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 12, 2021 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:

> >
> > For this merge window, I don't think any of them are show-stoppers (Rob, let me
> > know if you disagree), but in the long run we may want to gradually enforce
> > a rule about not merging changes that introduce any new warnings, in order to
> > have a chance of cleaning up the existing ones.
>
> This may not be as simple as it sounds, as DT binding updates typically
> follow a different path than DTS(i) updates.  DT bindings updates may be
> picked up by a subsystem maintainer, by Rob, or by the platform
> maintainer.

I checked out the bindings from linux-next, which seems to have covered
most of these. Sometimes it pays off to be lazy and merge them after
everyone else.

> For trivial updates (e.g. adding a compatible value, and sometimes
> extending a limit), a DTS(i) update may be accepted by the platform
> maintainer before the corresponding DT binding update.  The latter may
> even be merged one or more kernel revisions later, especially when
> involving subsystems that are not traditionally rooted into platforms
> using DT.
>
> Of course we could mention any expected warning regressions in our pull
> requests for soc.

Right, that would certainly help. Some maintainers send all binding
updates both to the driver maintainers and to the soc tree, along
with the other changes that only go into one tree. That is of course
also more work on your side, but it solves the problem entirely.

> > renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports:
> > 'port@0' is a required property
>
> [...]
>
> I've replied to these as a response to your PR reply, see
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdWHLnXgBSjP7VKUdx-YNr9rSKFkE5Ge5q_tarU6HP9Lhw@mail.gmail.com/

Ok, thanks.

      Arnd
