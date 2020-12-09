Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5B3C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 16:48:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 12B2C23C8D; Wed,  9 Dec 2020 16:48:05 +0000 (UTC)
X-Gm-Message-State: AOAM533DqN9TM6xk1n/i0I7JkPv4iMHN5oHdnzja0XM/8v6J1jeGcGGQ
	DruV1lkaQPazBk/aR/HEy0yB6z8GSzVo9xRP3TY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607532485;
	bh=eOXy3q/OrnpPVD7qFh+0rWuVST8KP6A+adEPD0I8BZI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FTaVKuW6Gzdo8SkfcT+QGUbk3Gc7qeCsbY6RCjXbPD5lHAkwXzgtrtgiZNeWfozgU
	 esZFK+xcg8ZyO78zCGFwdeHlpqX21DJgO+CMzSv6ce6/2cZVwctQaqC0eATvbwSEl/
	 3giCgMhqlDfN79XwsyVtp4a8xWK3HflMWD1xO6IoY5aSGKLj6slygO9qqeuBvIGQzW
	 0zKedNROY3WaWIuzOIAtrKoz/XVM2U3RJQ3b+0DUHK8Hi/9X81HwRyVyMOYGzT0sLB
	 2W4StgPK6NNl7OQY0QD8QdwrsCVdaxgDFZPQmg829DsbYlr4DbFLlyEqXglVNGTazk
	 RM98vV0s/heTw==
X-Google-Smtp-Source: ABdhPJzLm/V1PpLyoHr7j2zHkSCHVXujtN5dqk3y81FTHDxPr0vVKWkWksZSlGCPJwwSzXfl0bP6k0Oo4u2Xw9RgXw4=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr2550724otk.251.1607532484268;
 Wed, 09 Dec 2020 08:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
 <CAFr9PXmx1XZmVOp8mLygnDUfEKPpo6=ZQPMKSCnZf0i23mNqVw@mail.gmail.com>
In-Reply-To: <CAFr9PXmx1XZmVOp8mLygnDUfEKPpo6=ZQPMKSCnZf0i23mNqVw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 17:47:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0KHiO0Xis9+hiJa7uDZET9xzf7wRExxZXBUFXeAEMXqQ@mail.gmail.com>
Message-ID: <CAK8P3a0KHiO0Xis9+hiJa7uDZET9xzf7wRExxZXBUFXeAEMXqQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 7, 2020 at 11:55 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Linus,
>
> On Sun, 6 Dec 2020 at 06:43, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > OK finished!
> > Patches 1, 2 & 3 applied to the GPIO tree for v5.11.
>
> Awesome! Thank you Linus. :)
>
> Arnd and Olof: Sorry for being a noob.. Is there anything I need to do
> for patches 4 and 5 (device tree bits)?
> They are in the Linux SoC patchwork.

I've picked them up from there along with the second series of DT changes.

The easiest way for me though is if you include the patches in a pull request
or patch series that can go through the soc tree in one chunk.

       Arnd
