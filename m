Return-Path: <SRS0=8Kzp=G2=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3631C4167D
	for <soc@archiver.kernel.org>; Mon, 13 Nov 2023 10:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E947C43391; Mon, 13 Nov 2023 10:20:34 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CB67C433C7;
	Mon, 13 Nov 2023 10:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7CB67C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-66d09b6d007so28608486d6.1;
        Mon, 13 Nov 2023 02:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699870832; x=1700475632; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FB3t9eIHw+pKT3CBB8s0t2nQUBpXnYyol/A+bIoemXQ=;
        b=O67kgG19UOoNy1QHLGYYO/LuDJn9/98B5cKVVhpvtwmhxafWi3ElbNypztuKToFoIy
         mlxrs2UM7q7lkffwHVyEtwmy61CIJah8Ik03xjIY04Qdxa3ID2EZYwes+ERhccuhUbCo
         1QuJf2URgioSJk6gBR8zI2zkC5SneqqNd2FhsOhbSjld0I/M9az63nMF2MO0crtRrilH
         xoepBYVQD/FSbj02U1W11NSxDHu4TS9FRbDwHK3LxllRjsd2GhHJ5xEg8Ul1jcCc+CMc
         PuBGsrF7PiZhJo0G0gC4plW1HATz2HCnY3RnEciY57ujeFGF91Ugk52DclUYyfrh1dGa
         Vq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870832; x=1700475632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FB3t9eIHw+pKT3CBB8s0t2nQUBpXnYyol/A+bIoemXQ=;
        b=CA7HI5cWvPQVf/28e3cOySZLxLmf1lH5XneQPZP/TstoveKuMGHb8A53Pa/Mos+NM2
         JtLbPmKKIqVtWfDh17yraB0WNV844AgJSqwMC03vUl2zg+tsB+rVsLep13iAohjraSHj
         1q9QdPbQiIok1+PGa9kq3tSelrSV5czGrqkspE/gkiqOL1mV0n8DZ/MNi7MGZ8jxUlV+
         ewsXlwKuSoXQrsHDubCoEZ0gq/M4YyFMvmAKuQHB5tqDxqGZ53afnwR6k95Hn+cuFWDO
         Ny4uDdOhBBOhZbRQB+BPn7YYdaGzoztONhvfoFqNSjByXD1tmxwQiOLdjcZJnx8Iiq13
         Q2VA==
X-Gm-Message-State: AOJu0YxyeOkuMbphsHa24nHxx5E8tsk9/Ekbfr8244XhDa09cJJ2//5a
	S1RhmZZjzepM50yiFXN6UF8rAHCO6beTsYNl3wc=
X-Google-Smtp-Source: AGHT+IHcamihKm+ziuVIZapYWw1ITNZRzLvq04tB/x59umIja9AF0bX8BVytW1nYcQa699XIK195qbQ3GDjcnycnRno=
X-Received: by 2002:a05:6214:a90:b0:671:8630:f590 with SMTP id
 ev16-20020a0562140a9000b006718630f590mr5914012qvb.18.1699870832421; Mon, 13
 Nov 2023 02:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-7-3d63a5f1103e@maquefel.me> <ZLqSo6B5cJXVRJS/@smile.fi.intel.com>
 <c49f77492cacc5a30079720af58a9f2fca761609.camel@gmail.com>
In-Reply-To: <c49f77492cacc5a30079720af58a9f2fca761609.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Nov 2023 12:19:56 +0200
Message-ID: <CAHp75VccVh+M444AAixVzSvM6-FsDm8jDYdakHhNFTAL8WOGMA@mail.gmail.com>
Subject: Re: [PATCH v3 07/42] soc: Add SoC driver for Cirrus ep93xx
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me, 
	Hartley Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>, 
	Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Sebastian Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Michael Peters <mpeters@embeddedts.com>, Kris Bahnsen <kris@embeddedts.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, netdev@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 11:33=E2=80=AFPM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> On Fri, 2023-07-21 at 17:13 +0300, Andy Shevchenko wrote:

...

> > > +       spin_lock_irqsave(&ep93xx_swlock, flags);
> > > +
> > > +       regmap_read(map, EP93XX_SYSCON_DEVCFG, &val);
> > > +       val &=3D ~clear_bits;
> > > +       val |=3D set_bits;
> > > +       regmap_write(map, EP93XX_SYSCON_SWLOCK, EP93XX_SWLOCK_MAGICK)=
;
> > > +       regmap_write(map, EP93XX_SYSCON_DEVCFG, val);
> >
> > Is this sequence a must?
> > I.o.w. can you first supply magic and then update devcfg?
> >
> > > +       spin_unlock_irqrestore(&ep93xx_swlock, flags);

...

> > > +void ep93xx_swlocked_update_bits(struct regmap *map, unsigned int re=
g,
> > > +                                unsigned int mask, unsigned int val)

> > Same Q as above.
>
> EP93xx User Manual [1] has most verbose description of SWLock for ADC
> block:
> "Writing 0xAA to this register will unlock all locked registers until the
> next block access. The ARM lock instruction prefix should be used for the
> two consequtive write cycles when writing to locked chip registers."
>
> One may conclude that RmW (two accesses to the particular block) sequence
> is not appropriate.

It's not obvious to me. The terms "block access" and "block cycle"
occur only once in the very same section that describes ADCSWLock. The
meaning of these terms is not fully understandable. So, assuming that
you have tried it differently and it indeed doesn't work, let's go
with this one.

> [1] https://cdn.embeddedts.com/resource-attachments/ts-7000_ep9301-ug.pdf



--
With Best Regards,
Andy Shevchenko
