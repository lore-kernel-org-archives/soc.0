Return-Path: <SRS0=8Kzp=G2=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33017C4332F
	for <soc@archiver.kernel.org>; Mon, 13 Nov 2023 10:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 094D8C433CA; Mon, 13 Nov 2023 10:23:34 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A386C433C7;
	Mon, 13 Nov 2023 10:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A386C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7d9d357faso46936667b3.0;
        Mon, 13 Nov 2023 02:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699871012; x=1700475812; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISelrhUz+tUwTPOpVjAn5G1ABI4YmRZvCmOYJcKmy7Q=;
        b=QJjELbP7r2UF3/nspWGIiEPn7DVEjzsv9dXe1SDgmd/6G3OyX534uG1NOaCd913NtA
         9fGog5HI6adENOig68wE6NqmKo1TGBRX5D7Nsw0edsTKCwSgdtqhKFCzD0oPVI/ZHjRV
         7UTfZ8ifWMdTEj3u3LtaqZ1eGhlZM8al1319lSmkLE4BubyYBd7p3gSAcPVofPjDkgx7
         Q1uFKA44MrUGYherFcUEQtgPEZ7PJq/dJnccC2rTsyTUYSpWlOMTvEkuLgNshD9RPKbN
         4SDtLRIlygqsD+GOv1EaiMNeBbcxEOD5FzUzsMhPHuKL7IJ8GsBktSTMFJIM1xWTti6t
         Ufcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699871012; x=1700475812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISelrhUz+tUwTPOpVjAn5G1ABI4YmRZvCmOYJcKmy7Q=;
        b=lSYoUTzWCencTDFNN7D1KNnFlqf89s8WLO5BtRQGmx4L96kFKphSs8iIC62mlyU0+w
         +t5YCEV9bxbxjahmab8d2M4mTvIb4fpN5sWKs393XBkMYNyRD1vWnFnHWexYwbGKVcNu
         leCAMbhkGELxK44sRMJ6BVFl3yUn/NaG6fkupIItW9gTmIF8bWEmJJudN5zVDnYiyhOq
         F/9g1aiy3KyjYe3/x9dB/UsTGo0egjn/XfAiMBEc4TZUVOgulQ6pJGHG/z4k2F7UuBHy
         kX7CKFPyYdoI2/Bg+g/vyF8sOftE67sks5tmFHtD9Xjf77NnOLdN+fdksyjuFhq5jZmD
         Tw4w==
X-Gm-Message-State: AOJu0YzxgP2GaZ73gD1F+OzD3QizczYsiZdVgwaX0ewZl8McC1sJ9b+8
	HGmaP8o/1Att+jbkxBycS7faJEMHy7wR+LOHEmE=
X-Google-Smtp-Source: AGHT+IGeFMq6OPRYVFpLBqn7U8F7RLctOzbaeZinyDCceNJQA9yzq0afSM1d3lxBYSz248sE7pBipt1geSP2uWLF31w=
X-Received: by 2002:a81:4782:0:b0:5a7:a817:be43 with SMTP id
 u124-20020a814782000000b005a7a817be43mr6070415ywa.6.1699871011907; Mon, 13
 Nov 2023 02:23:31 -0800 (PST)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me> <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
 <fcfdc6f05926db494ea0105e5523cc21ecfdf4e7.camel@gmail.com>
In-Reply-To: <fcfdc6f05926db494ea0105e5523cc21ecfdf4e7.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Nov 2023 12:22:56 +0200
Message-ID: <CAHp75VcsF8GtmE2iDf2xPWi7U5WXhi1ZFUSeA_Y+TfHQn72Jrg@mail.gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
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

On Mon, Nov 13, 2023 at 12:07=E2=80=AFPM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:
> > > +       /* Issue the reboot */
>             ^^^^^^^^^^^^^^^^^^^^^^
> This is the relevant comment, one can extend it, but looks already quite
> informative considering EP93XX_SYSCON_DEVCFG_SWRST register name.

This does not explain the necessity of the mdelay() below.

> But Nikita would be able to include more verbose comment if
> you'd have a suggestion.

Please,add one.

> > > +       ep93xx_devcfg_set_clear(priv->map, EP93XX_SYSCON_DEVCFG_SWRST=
, 0x00);
> > > +       ep93xx_devcfg_set_clear(priv->map, 0x00, EP93XX_SYSCON_DEVCFG=
_SWRST);
> >
> >
> > > +       mdelay(1000);
> >
> > Atomic?! Such a huge delay must be explained, esp. why it's atomic.

--=20
With Best Regards,
Andy Shevchenko
