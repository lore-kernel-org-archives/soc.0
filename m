Return-Path: <SRS0=CDwG=SR=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4986CC433EF
	for <soc@archiver.kernel.org>; Wed,  2 Feb 2022 21:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F4A7C340F0; Wed,  2 Feb 2022 21:21:46 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA758C004E1;
	Wed,  2 Feb 2022 21:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA758C004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1My3In-1mIa5Z26il-00zabr; Wed, 02 Feb 2022 22:21:42 +0100
Received: by mail-wr1-f45.google.com with SMTP id e8so1073691wrc.0;
        Wed, 02 Feb 2022 13:21:42 -0800 (PST)
X-Gm-Message-State: AOAM533Fzrq9NoOg2Hy7uISu9tswaz5dryUr/+MDSiXy9zBz0attkArH
	MikYOiKtiprmSbJJRaeANxLYwhlOHT/vNxSDnhY=
X-Google-Smtp-Source: ABdhPJyS0pXYjoI1KSj8v4HS5DRpiR5z8Z+MmivHV59Rfz0qHTXBAOHLhOORnhnqrVG7qMP59ls3cQTx3h8P+oStNX4=
X-Received: by 2002:a05:6000:3c6:: with SMTP id b6mr26662700wrg.12.1643836901999;
 Wed, 02 Feb 2022 13:21:41 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com> <20220202165315.18282-1-nick.hawkins@hpe.com>
 <20220202175635.GC2091156@minyard.net> <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
In-Reply-To: <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Feb 2022 22:21:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3itj=nshdRCoFQQh5fg-RsEaqj1PdBxfeN2-TzqmoPpQ@mail.gmail.com>
Message-ID: <CAK8P3a3itj=nshdRCoFQQh5fg-RsEaqj1PdBxfeN2-TzqmoPpQ@mail.gmail.com>
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
To: "Verdun, Jean-Marie" <verdun@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: "minyard@acm.org" <minyard@acm.org>, "Hawkins, Nick" <nick.hawkins@hpe.com>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	"soc@kernel.org" <soc@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Stanislav Jakubek <stano.jakubek@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Hao Fang <fanghao11@huawei.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Wang Kefeng <wangkefeng.wang@huawei.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TpExNBf1VHia3xWaOwqNcjJFflm4jM+UiZOXK28ZwAdHq1Ya84o
 AExLoQbSU/6pXDuk/ROnp0Yk/jMl7MHVP1qfFRP0LSIoUZKtyNuVeOtrPaRkoD4KL2HC1Rc
 vQvl6alH6EmuFNiQANT9uolKdvPu20bDPMEtSWmMxwKxGqq0YrPgUzfLAXqRjrR5Xgqr/Kf
 9OpPzny6tdlxXDTHR8yKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e00ykHQ5yho=:zVDc4OztUJaAFo95hHHAsg
 kmQzFokNIfWD5HJsPNebWhu//n06Te456Wa6aGOBynJY5Ucl78SNhhHbZF6R9kVSsfP0ZAeS3
 FDqRnvCRP+lqZfxk/bqDsIv2Yl0IbpQs2Kp3wLD/ZtbU05u5fJBW1HyYyEsZce207ZV21DjVz
 PF1i0Z/cSj4oSvN+5ptnbOWa/rvLU84a8BtoJ5L/tKb49zUxTCUDZ2oCRghqZfU/pgGtgsB6D
 jBQ9CR1KZGrRSJ8Ih4+R9cIVUl+8g9XjAuBwCwgSm0CXE9HKjY4VstvJXrbTncbu+1nuWA/Cy
 QaWIx+FF9ZmaJTwacl7Ed4qOyNCDCb7Tyg5vSmCPRMb+3em4LMasjdBnlzC2uvR3hRL/pS5Te
 YWbJ/3vtHzElcbZKBYmJ/OtGTE6EE/3Ox/snTRiWBQeV4vFe96X7XcN4mb/pL7QXi9INFr2dp
 8cpBdEW/htCkvKohhjYvBzsfy+4PgjAPsjGgtgFiK7yJPmvk+VWGFM8lo8Kq4LsYlx99YsCSR
 X/34cyxloMxvQq/e+qZ2SSu5O2wk0Qx7HxsvGuKIiq1nevkUd59v0K+3p8x7Mz41gDLoLzFgl
 gNBLWXp4LvDyVim22hp3xYF3GTkkTADOYF+FJxuBzprBEoSmeoiRcRRuk4VzSHf0viSI4anUs
 GlPvMxU2ecJvrRolGGLjI7ootHn0XTi/kOkQl7xZXNSmOmpM90HHcQdu2jvsvKtGFOm7E+Hqf
 F8Rrz+npveOpLGFECK+9s+DPC2zN9h64N+NoIt25kp0M1CLqJBObQYUet55zZ8oO+J58NuUDy
 waDWdawyqHE4SYL4E9HggGJb12KjSxea98Tiv3kt+Mv2N2JqDI=

On Wed, Feb 2, 2022 at 7:14 PM Verdun, Jean-Marie <verdun@hpe.com> wrote:
>
> > This is far too big for a single patch.  It needs to be broken into
> > functional chunks that can be reviewed individually.  Each driver and
> > each device tree change along with it's accompanying code need to be
> > done in individual patches.  The way it is it can't be reviewed in any
> > sane manner.
>
> > -corey
>
> Thanks for your feedback. We are getting a little bit lost here, as our plan was to submit initial
>
> - bindings
> - dts for SoC and 1 board
> - initial platform init code
>
> Then drivers code avoiding to send many dts updates which might complexify the
> review. We wanted to send all drivers code to relevant reviewers by tomorrow.
>
> So, what you are asking ( do not worry I am not trying to negotiate, I just want
> to avoid English misunderstandings as I am French) is to send per driver
>
> - binding
> - dts update
> - driver code
>
> For each driver through different submission (with each of them containing the
> 3 associated parts) ?
>
> What shall be the initial one in our case as we are introducing a platform ?
> An empty dts infrastructure and then we make it grow one step at a time ?

Ideally, what I prefer to see is a series of patches for all "essential" drivers
and the platform code that includes:

- one patch for each new binding
- one patch for each new driver
- one patch that hooks up arch/arm/mach-hpe/, MAINTAINERS
  and any other changes to arch/arm/ other than dts
- one patch that adds the initial .dts and .dtsi files, with all the
  devices added that have a valid binding, no need to split this
  up any further

This should include everything you need to boot into an initramfs
shell, typically cpu, serial, timer, clk, pinctrl,  gpio, irqchip. We will
merge these as a git branch in the soc tree.

In parallel, you can work with subsystem maintainers for the
"non-essential" drivers to review any other driver and binding,
e.g. drm/kms, network, i2c, pci, usb, etc. The patches for
the corresponding .dts additions also go through the soc tree,
but to make things simpler, you can send those in for a later
release.

          Arnd
