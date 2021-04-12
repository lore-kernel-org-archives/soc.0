Return-Path: <SRS0=l2vm=JJ=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E88C433ED
	for <soc@archiver.kernel.org>; Mon, 12 Apr 2021 11:22:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD4F261350; Mon, 12 Apr 2021 11:22:24 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C62260FF1;
	Mon, 12 Apr 2021 11:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C62260FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=geert.uytterhoeven@gmail.com
Received: by mail-ua1-f42.google.com with SMTP id h5so4108693uaw.0;
        Mon, 12 Apr 2021 04:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BOw8Zb9w4xHJ1taZse28RR3kjNLN3a7583crYWk8gl8=;
        b=FFNuuJDjO8Yv+qpY0nI3wfIfAApcrJJY9+ERH3iEg7z19vB9CvXLq9LPCBy/k3YrRY
         tAZwCifE3PIcF+pg/KWOMKEFUEtMi/m3mp/uHolobbHYI4ss/cJ6+NuSwmm+Nszmc0aF
         rtOV8ecKi3kPNYuYqxvP2/7i0c1DtBBdP3xMlojXrUdxsNf6B+cgM6BnRis13aLSvpdM
         6xD4oW2loVOAXSrgDQ5cAAL9aTnZbUsMEr8OEAUgCjkyQuN0fcV9zUJcYXdHdgbNl18s
         RXQKqREM/fKRE402GfrtKds7nzG2ANRnYI9apM42iKz7llTAju6dppQHHx8ogMtZSM5z
         FwDQ==
X-Gm-Message-State: AOAM530zlhFgmg3MRxl7ruD5ggqJaICCHFfCTA/za4TPcTXN/qY3q/u4
	PNWiwQZl0G+2zGtbtrWqhNkCDukvzWcnluQUUyZdU4jd/y8=
X-Google-Smtp-Source: ABdhPJzwN/8I7ekYFgRmXOMQCCikWGGErXYZWEqFSkw6dmIHbUWE7b+UrKtmzgjr8PMBQmvA10PER2FVIpwY9UFT5+E=
X-Received: by 2002:a9f:3852:: with SMTP id q18mr9655708uad.58.1618226543535;
 Mon, 12 Apr 2021 04:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617359678.git.geert+renesas@glider.be> <161789462010.1629934.8245364544434971043.b4-ty@arndb.de>
In-Reply-To: <161789462010.1629934.8245364544434971043.b4-ty@arndb.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Apr 2021 13:22:12 +0200
Message-ID: <CAMuHMdWHLnXgBSjP7VKUdx-YNr9rSKFkE5Ge5q_tarU6HP9Lhw@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM DT updates for v5.13 (take two)
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Thu, Apr 8, 2021 at 5:24 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Fri, 2 Apr 2021 12:37:15 +0200, Geert Uytterhoeven wrote:
> > The following changes since commit c8aebc1346522d3569690867ce3996642ad5=
2e01:
> >
> >   arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding (2021-03-1=
6 09:58:00 +0100)
> >
> > are available in the Git repository at:
> >
> > [...]
>
> Merged into arm/dt, thanks!

Thank you!

> There were a couple of added warnings from 'make dtbs_check W=3D1':
>
> renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports: 'port@0'=
 is a required property

The same issue is present in several other pre-existing DTS files, too.
Commit 066a94e28a23e04c ("media: dt-bindings: media: Use graph and
video-interfaces schemas") in v5.12-rc1 made port@0 mandatory, but that
port is not present on boards were the interface isn't used (yet).
Probably we should add placeholder port@0 nodes to all SoC .dtsi files,
like we already have in display, audio, hdmi, and lvds nodes.

> renesas/r8a779a0-falcon.dt.yaml: thermal-zones: 'sensor-thermal1', 'senso=
r-thermal2', 'sensor-thermal3', 'sensor-thermal4', 'sensor-thermal5' do not=
 match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinct=
rl-[0-9]+'

I don't see that one with the latest bindings in linux-next (i.e. commit
9468e7b031876935 ("dt-bindings: thermal: rcar-gen3-thermal: Support five
TSC nodes on r8a779a0")).

> renesas/r8a779a0-falcon.dt.yaml: timer@e61e0000: compatible:0: 'renesas,t=
mu-r8a779a0' is not one of ['renesas,tmu-r8a7740', 'renesas,tmu-r8a774a1', =
'renesas,tmu-r8a774b1', 'renesas,tmu-r8a774c0', 'renesas,tmu-r8a774e1', 're=
nesas,tmu-r8a7778', 'renesas,tmu-r8a7779', 'renesas,tmu-r8a7795', 'renesas,=
tmu-r8a7796', 'renesas,tmu-r8a77961', 'renesas,tmu-r8a77965', 'renesas,tmu-=
r8a77970', 'renesas,tmu-r8a77980', 'renesas,tmu-r8a77990', 'renesas,tmu-r8a=
77995']

Trivial DT binding update posted (but not CCed to devicetree) in
https://lore.kernel.org/r/20210331124555.2150-1-wsa@kernel.org/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
