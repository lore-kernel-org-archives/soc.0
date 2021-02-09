Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD8BC433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 14:27:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A438F64EE7; Tue,  9 Feb 2021 14:27:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CA0164ECD;
	Tue,  9 Feb 2021 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612880867;
	bh=IUb6DV3nU1zdGhhWAb17Qi2tqhYOdDTW8nBtL3IEZJk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pyq/U5LjUu8OBj1pwTvyj4dLtPR5jAyfyIz+TslDj9ucJxLjxPo0vz4Tt3oLEQVcA
	 5U9WAPfLVw0qF8TSK3D9wOHXFd15HwCGSB1EWNlxQCLjUaz1GUbzgO/vklhySSNjcq
	 quk5+skE7AuMotOKEoHBzlQP8CLnUkXQIjdZL1FhECY1SAo/UbLzL+EPzgYL4lHdca
	 Vjc70Bfbtn1flMzp3GUY2xgnBqyzQIHeFjddvN/yaml4VSCatzgx5u2JFxl4jOcDVV
	 7OhsRNtLB34z+hFWTnDBfvzBz2v26SN6HMgMt0bUEesVq620ckgNMTMh1tJgj9BNc4
	 F89+ZRjISXTRQ==
Received: by mail-ej1-f47.google.com with SMTP id y9so31782121ejp.10;
        Tue, 09 Feb 2021 06:27:47 -0800 (PST)
X-Gm-Message-State: AOAM532RerjmzJJbcLnQyEyjeQ6kedE1my0bYKj8tjjcS4uN+mXaIdBI
	OVWuDfO5KPFgPtP/QE0BOcXpzsUlR5PTAaOgRw==
X-Google-Smtp-Source: ABdhPJyf3fDdh3vgBVlRXkwPQY2+f4xwXx5hBCpKQMUMFm8rdoadj2gemHW29NQWQecKohtHD7YsfotKbI+11sDJrEc=
X-Received: by 2002:a17:907:262b:: with SMTP id aq11mr16445765ejc.360.1612880865579;
 Tue, 09 Feb 2021 06:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20210125191240.11278-1-krzk@kernel.org> <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap> <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan> <20210208184230.onhlioflyylkx6xo@kozik-lap>
 <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
 <20210208213537.GA351084@piout.net> <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
 <20210208231040.GF351084@piout.net>
In-Reply-To: <20210208231040.GF351084@piout.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 9 Feb 2021 08:27:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJicBkH_a2kvM=+p3wde1T5Cx7C+qNR3r0WjksZfBnCKA@mail.gmail.com>
Message-ID: <CAL_JsqJicBkH_a2kvM=+p3wde1T5Cx7C+qNR3r0WjksZfBnCKA@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sylwester Nawrocki <snawrocki@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Frank Rowand <frowand.list@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Torgue <alexandre.torgue@st.com>, 
	Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 5:10 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 08/02/2021 23:14:02+0100, Arnd Bergmann wrote:
> > On Mon, Feb 8, 2021 at 10:35 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > On 08/02/2021 20:52:37+0100, Arnd Bergmann wrote:
> > > > On Mon, Feb 8, 2021 at 7:42 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > Let me steer the discussion to original topic - it's about old kernel
> > > > > and new DTB, assuming that mainline kernel bisectability is not
> > > > > affected.
> > > > >
> > > > > Flow looks like this:
> > > > >
> > > > > 0. You have existing bidings and drivers.
> > > > > 1. Patch changing bindings (with new compatible) and drivers gets
> > > > >    accepted by maintainer.
> > > > > 2. Patch above (bindings+drivers) goes during merge window to v5.11-rc1.
> > > > > 3. Patch changing in-tree DTS to new compatible gets accepted by
> > > > >    maintainer and it is sent as v5.12-rc1 material to SoC maintainers.
> > > > >
> > > > > So again: old kernel, using old bindings, new DTB.
> > > > >
> > >
> > > I don't think forward compatibility was ever considered. I've seen it
> > > being mentioned a few times on #armlinux but honestly this simply can't
> > > be achieved. This would mean being able to write complete DT bindings
> > > for a particular SoC at day 0 which will realistically never happen. You
> > > may noteven have a complete datasheet and even if you have a datasheet,
> > > it may not be complete or it may be missing hw errata that are
> > > discovered later on and need a new binding to handle.
> >
> > You do not have to write the correct DT for this, the only requirement
> > is that any changes to a node are backward-compatible, which is
> > typically the case if you add properties or compatible strings without
> > removing the old one. A bugfix in this case is also backward-compatible.
> >
> > The part that can not happen instead is to write a DT that can expose
> > features that any future kernel will use.
> >
>
> But I think we are speaking about the other way around were you would be
> e.g. removing properties or splitting a node is multiple different
> nodes following a different understanding of the hardware.
> And in this case, any rework of the bindings will be forbidden, like
> 32b7cfbd4bb2 ("ARM: dts: at91: remove deprecated ADC properties") will
> break older kernels trying to use the new dtb.
> 761f6ed85417 ("ARM: dts: at91: sama5d4: use correct rtc compatible") is
> an other case.
> I'm not sure want to keep the older properties or the older compatible
> string as a fallback for this use case.
>
> > > > However, once the firmware is updated, it may no longer be possible to
> > > > go back to the old kernel in case the new one is busted.
> > > >
> > >
> > > Any serious update strategy will update both the kernel and device tree
> > > at the same time, exactly like you already have to update the initramfs
> > > with the kernel as soon as it is including kernel modules.
> > > I would expect any embedded platform to actually use a container format,
> > > like a FIT image that will ship the kernel, DT and intiramfs in a single
> > > image and will allow to sign all parts.
> >
> > Embedded systems that do this have no requirement for backward
> > or forward compatibility at all, the only requirement for these is bisectability
> > of git commits.
> >
>
> Yes and I can't see any drawbacks in this approach.
>
> > > > A similar problem can happen with the EBBR boot flow that relies on
> > > > a uefi-enabled firmware such as a u-boot, while using grub2 as the
> > > > actual boot loader. This is commonly supported across distros. While
> > > > grub2 can load a matching set of kernel+initrd+dtb from disk and run
> > > > that, this often fails in practice because u-boot needs to fill a
> > > > board specific set of DT properties (bootargs, detected memory,
> > > > mac address, ...). The usual way this gets handled is that u-boot loads
> > > > grub2 and the dtb from disk and then passes the modified dtb to grub,
> > > > which picks only kernel+initrd from disk and boots this with the dtb.
> > > >
> > > > The result is similar to case with dtb built into the firmware: after
> > > > upgrading the dtb that gets loaded by u-boot, grub can still pick
> > > > old kernels but they may not work as they did in the past. There are
> > > > obviously ways to work around it, but it does lead to user frustration.
> > > >
> > >
> > > Are there really any platforms with the dtb built into the firmware?
> > > I feel like this is a mythical creature used to scare people into keeping
> > > the DTB ABI stable. Aren't all the distribution already able to cope
> > > with keeping DTB and kernel in sync?
> >
> > I think most traditional PowerPC systems fall into this category, most
>
> My understanding was that the traditional PPC systems had a small device
> tree and usually are not affected by driver changes but I may be wrong.
>
> > systems that boot using UEFI+grub (as I explained), and anyone who
> > uses a distro kernel on custom hardware with their own dtb.
> >
>
> Aren't the ones using a distro kernel with a custom dtb more concerned
> by backward compatibility (i.e. new kernel with old dtb) rather than old
> kernel on new dtb? If they have an old dtb, an old kernel, and update to
> a new kernel, backward compatibility will ensure this continues to work.
> If then they work on updating their dtb, they still have the old one and
> can make the distribution match dtb and kernel. This is already handled
> properly by debian and I guess the other distributions as it is anyway
> already matching kernel and initramfs.

SUSE is doing the opposite AIUI. This is a bit harder because adding
any new provider breaks compatibility as the old kernel will wait for
a non-existent driver for the new provider. That was the motivation
for deferred probe timeouts. Of course, I wouldn't really call a
platform stable if you are still adding clock, pinctrl, power-domain,
etc. providers.

Rob
