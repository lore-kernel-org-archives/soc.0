Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66795C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 22:14:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 39B6864EC2; Mon,  8 Feb 2021 22:14:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0706C64E8F;
	Mon,  8 Feb 2021 22:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612822460;
	bh=Jz5ldc3n4cQjWXYnjOx9dEi0FPQikbupSytoZs9t8fM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QosbwHagLfDLM1NXlaur2JOi1IXG/Tgmk9PGbk+tUyl/M1u5TwXIerIMDkRPICVlO
	 I8/JoSAOQtWgqAfuXxX9rc261y2RmAuL2FsYL9kHYB/nhLM0q91cwts9Zqz5SXNawJ
	 D/Mj5pLh4wPfXih4trZyOv6+LL3DZ9yqQWNxouN5kBv7kHvu0HxA8Yf0sVBA+4vQG2
	 KZZSGSwH8ZjguwVFgyt/EWB/wntJWCEDQg+4IpNfwlKbkPs5xtUD2cB/7EaHtXqENa
	 jF1VyNcZJNcDREUxWtsILnaLm+bAWeTfr+V5ULgjlO3n2ftIjjI46GJKHU0Xn5aaog
	 m9RdTqAy+x0qQ==
Received: by mail-oi1-f170.google.com with SMTP id m7so17292636oiw.12;
        Mon, 08 Feb 2021 14:14:19 -0800 (PST)
X-Gm-Message-State: AOAM53212odFcjebyUocus9V00VJCHtoGujsLpq3UYPwnoUJX6q0ki2c
	fpCEkr959WRvV2fguIkiRyqXMWbXbGHOO6uq0ZQ=
X-Google-Smtp-Source: ABdhPJxpP9gwbCKa5AjzT24YqrIRgkRJHNusj8IBg0vOWggBqvILeWTgqpQB9MkANzSqDzqYHq8H75jqsgUnq1pQndI=
X-Received: by 2002:aca:d908:: with SMTP id q8mr555697oig.67.1612822459216;
 Mon, 08 Feb 2021 14:14:19 -0800 (PST)
MIME-Version: 1.0
References: <20210125191240.11278-1-krzk@kernel.org> <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap> <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan> <20210208184230.onhlioflyylkx6xo@kozik-lap>
 <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com> <20210208213537.GA351084@piout.net>
In-Reply-To: <20210208213537.GA351084@piout.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 23:14:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
Message-ID: <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, 
	arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sylwester Nawrocki <snawrocki@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Frank Rowand <frowand.list@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Alexandre Torgue <alexandre.torgue@st.com>, Kevin Hilman <khilman@baylibre.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 10:35 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 08/02/2021 20:52:37+0100, Arnd Bergmann wrote:
> > On Mon, Feb 8, 2021 at 7:42 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > Let me steer the discussion to original topic - it's about old kernel
> > > and new DTB, assuming that mainline kernel bisectability is not
> > > affected.
> > >
> > > Flow looks like this:
> > >
> > > 0. You have existing bidings and drivers.
> > > 1. Patch changing bindings (with new compatible) and drivers gets
> > >    accepted by maintainer.
> > > 2. Patch above (bindings+drivers) goes during merge window to v5.11-rc1.
> > > 3. Patch changing in-tree DTS to new compatible gets accepted by
> > >    maintainer and it is sent as v5.12-rc1 material to SoC maintainers.
> > >
> > > So again: old kernel, using old bindings, new DTB.
> > >
>
> I don't think forward compatibility was ever considered. I've seen it
> being mentioned a few times on #armlinux but honestly this simply can't
> be achieved. This would mean being able to write complete DT bindings
> for a particular SoC at day 0 which will realistically never happen. You
> may noteven have a complete datasheet and even if you have a datasheet,
> it may not be complete or it may be missing hw errata that are
> discovered later on and need a new binding to handle.

You do not have to write the correct DT for this, the only requirement
is that any changes to a node are backward-compatible, which is
typically the case if you add properties or compatible strings without
removing the old one. A bugfix in this case is also backward-compatible.

The part that can not happen instead is to write a DT that can expose
features that any future kernel will use.

> >
> > However, once the firmware is updated, it may no longer be possible to
> > go back to the old kernel in case the new one is busted.
> >
>
> Any serious update strategy will update both the kernel and device tree
> at the same time, exactly like you already have to update the initramfs
> with the kernel as soon as it is including kernel modules.
> I would expect any embedded platform to actually use a container format,
> like a FIT image that will ship the kernel, DT and intiramfs in a single
> image and will allow to sign all parts.

Embedded systems that do this have no requirement for backward
or forward compatibility at all, the only requirement for these is bisectability
of git commits.

> > A similar problem can happen with the EBBR boot flow that relies on
> > a uefi-enabled firmware such as a u-boot, while using grub2 as the
> > actual boot loader. This is commonly supported across distros. While
> > grub2 can load a matching set of kernel+initrd+dtb from disk and run
> > that, this often fails in practice because u-boot needs to fill a
> > board specific set of DT properties (bootargs, detected memory,
> > mac address, ...). The usual way this gets handled is that u-boot loads
> > grub2 and the dtb from disk and then passes the modified dtb to grub,
> > which picks only kernel+initrd from disk and boots this with the dtb.
> >
> > The result is similar to case with dtb built into the firmware: after
> > upgrading the dtb that gets loaded by u-boot, grub can still pick
> > old kernels but they may not work as they did in the past. There are
> > obviously ways to work around it, but it does lead to user frustration.
> >
>
> Are there really any platforms with the dtb built into the firmware?
> I feel like this is a mythical creature used to scare people into keeping
> the DTB ABI stable. Aren't all the distribution already able to cope
> with keeping DTB and kernel in sync?

I think most traditional PowerPC systems fall into this category, most
systems that boot using UEFI+grub (as I explained), and anyone who
uses a distro kernel on custom hardware with their own dtb.

       Arnd
