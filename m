Return-Path: <SRS0=eD+5=G2=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2388C4332F
	for <soc@archiver.kernel.org>; Mon, 13 Nov 2023 10:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9103C433CA; Mon, 13 Nov 2023 10:04:47 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4D9AC433C8;
	Mon, 13 Nov 2023 10:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4D9AC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5079f9ec8d9so4680391e87.0;
        Mon, 13 Nov 2023 02:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699869885; x=1700474685; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wYZtbNfscHtuB7ayNjS/FaQpaEtL1M0UhXyvKDUhQKc=;
        b=FuwfX71oFGeGw0alIMO78qXO7MQsOyNxOZ3AZ2JN6bG8AoJwnhz6yFW1RInsfvCmdW
         sg/1KsRaS5zWwi6sPNs+c6DWYd0B4SDVDjRpBakm5ekNwLfUvfnflO+F/Xdd7O10waed
         qyAZ41OMcI5RBSLNiRsgXSoymiVGEL71ZhmwYcYxvsyEeo8lXW/H82IKBUV3sudge9Je
         RmtDjDvrjYqZphiFKWKHFFFW46zkPyQbyPS6/qs5HD7at/9MIefCnPjRB3X0gJwW0/Ud
         JaR/zeaxopi6g8ZzYlOW0F7eFIs2PbZRuZgdgLBayfZF/qC/Sjyt2cf4icw2m+nueKL/
         G+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869885; x=1700474685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYZtbNfscHtuB7ayNjS/FaQpaEtL1M0UhXyvKDUhQKc=;
        b=jRBdaT2Pd/J74/mRJtELCoAEAFxOGlnEDt3CwmDO0uWBRjZNebUP9wbwp0Iru5zz9a
         /8K1jlll8ZXVgJkNS9GIWzMXNV8QkUk9hOfACWPuMk7Stt+MMMhN2z8EQPLMzHJWFg6A
         Xkjk2HbJ6ch2ce8KTNzFkl7PoGqv/70luDZy/k9jHFmmmIs1+Il72JVBWFsD2p/VsgYl
         FiV/lbwTndF1vgYMUfFM6YAPdC5CXsWFHK8XViGq9i2ara52CJpr9yHVvqLTWaUPfs+j
         BOb7o7pRKmnzDAswqQ6MGyj5421FsqOmfI8Nk0vTb/AsNV6MJto6c/77YblNvZs5qeui
         wf3g==
X-Gm-Message-State: AOJu0YyP6EIgYjI0aL5po2C64ArJiFFQIQQni6RrzWEgBpYDj5J0Sp/n
	PUGeLOssX6jVJNfsf8xLbxbt6t6SEcBRBQ==
X-Google-Smtp-Source: AGHT+IFY0VBv65sXA0Ec0khQRe36/4QIzik1qErLOvxwk7VCfLMt8d6A4Y8Yy/Esbvbw7QCTYBejoA==
X-Received: by 2002:a05:6402:520b:b0:543:5144:1779 with SMTP id s11-20020a056402520b00b0054351441779mr8907514edd.11.1699869864130;
        Mon, 13 Nov 2023 02:04:24 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a67-20020a509ec9000000b0053e43492ef1sm3514675edf.65.2023.11.13.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:04:23 -0800 (PST)
Message-ID: <0cf1d748cb4a672483991f44d638a271218effe6.camel@gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me, Hartley
 Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek
 <kernel@wantstofly.org>, Russell King <linux@armlinux.org.uk>, Lukasz
 Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Sebastian
 Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michael Peters
 <mpeters@embeddedts.com>, Kris Bahnsen <kris@embeddedts.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Mon, 13 Nov 2023 11:04:21 +0100
In-Reply-To: <CAHp75VeYHscM-r94kTrpH44W=OGVq+qoNNQZoVrR5_n-_K_Xsw@mail.gmail.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
	 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
	 <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
	 <CAHp75VeYHscM-r94kTrpH44W=OGVq+qoNNQZoVrR5_n-_K_Xsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0

Hi Andy!

On Mon, 2023-11-13 at 11:59 +0200, Andy Shevchenko wrote:
> On Sat, Nov 11, 2023 at 8:18=E2=80=AFPM Alexander Sverdlin
> <alexander.sverdlin@gmail.com> wrote:
> > On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:
>=20
> ...

[1]

>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mdelay(1000);
> > >=20
> > > Atomic?! Such a huge delay must be explained, esp. why it's atomic.
> >=20
> > atomic or not, SoC is supposed to reset itself here.
> > However there is an errata [1] and the SoC can lockup instead.
>=20
> Good, and what I'm saying is that this piece of code must have a
> comment explaining this.

And it has, but for some reason you've trimmed it in your reply...

--=20
Alexander Sverdlin.

