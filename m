Return-Path: <SRS0=tHIT=GY=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F54C4332F
	for <soc@archiver.kernel.org>; Sat, 11 Nov 2023 18:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA75CC433C7; Sat, 11 Nov 2023 18:18:34 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E53AAC433C8;
	Sat, 11 Nov 2023 18:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E53AAC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507a29c7eefso4161547e87.1;
        Sat, 11 Nov 2023 10:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699726712; x=1700331512; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Os4KBIFKBrhxCNe2iV6sYOSUCifSAC9wTubOo6x2YGA=;
        b=YrsbZ4/vNvCdHzvNoS9/sd29U3DlrBMldFqzpgNjeCtwErI84NNITGi8PR75VpkkEj
         iVMQwTXxR3+WwfLk1zEio8JFu+AgPV9UfNSB25hOEmDpCzrgURLXAuDrpt0HN/Fy47Dm
         C5bMrnnEm00T08Se3hi6lUelGfeUehB4MS7PdY666vR4dmfSibTocB46iE+AxVpzSHHq
         P9riFTuNApt9mAh466EV34CULu70/dLY6XxNYt04doa9bMUDhKyEw0mzzMu/0TVL7xBF
         DVPKbC3hm68DbMou48Gt9yZlhICx8x33fa4UYZE3uHf1WpIj50eIDfPy0phb0buzdIOM
         peVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699726712; x=1700331512;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Os4KBIFKBrhxCNe2iV6sYOSUCifSAC9wTubOo6x2YGA=;
        b=t6XV6OBQaK7RSvNkNZdQ6yB9LNBnZhXbxYGKdj5WEqtC6CSz+fRbq6+CYhJAifKZDT
         SVt0Cg3VIA2FBPn9DY3a9efmZwTxqSwWjoXua1r6Lb9qV455O1r32w0AyxQzwj2lrcnz
         KeV7xQfFsOxHPK/Qy7iR9uC2Iraupl+qCX3M4nNCSEUwD5Fp5Z0P0cels/08Xq4ApX1z
         N9QyJdVoK8ZZ7gM6qeihHByv1qRTqA4f6lW0/AviRaDRJ8e9FxdBb16Q6cY86BT+CYsy
         tcT7l6XW9m24/Hh2SEzrnuf/HpUH4cvP0ftcrdPEhh8ab1nemi75ZrIFn8cjXJPZtTM6
         WH9w==
X-Gm-Message-State: AOJu0Yw6EW1PJUwrOnXHXF74euMoD/un7xm8y10Cur+3j24JCJ5z2ggT
	+N0/Ef8yOYoqz82feshVCueQuS16jJU1lw==
X-Google-Smtp-Source: AGHT+IGWSLvEEWKMjKSkylq9sGZ0KV/8c86kVFIgYc1m0RkjmWY37s2qpjH05vtA3bG5UrjESvvwcA==
X-Received: by 2002:a05:6512:2399:b0:500:be57:ce53 with SMTP id c25-20020a056512239900b00500be57ce53mr2275395lfv.42.1699726711568;
        Sat, 11 Nov 2023 10:18:31 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id n20-20020a170906b31400b009e656ce2930sm1403421ejz.60.2023.11.11.10.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 10:18:30 -0800 (PST)
Message-ID: <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me
List-Id: <soc.lore.kernel.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek
 <kernel@wantstofly.org>, Russell King <linux@armlinux.org.uk>, Lukasz
 Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>,  Thomas Gleixner <tglx@linutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
  Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Uwe
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
Date: Sat, 11 Nov 2023 19:18:28 +0100
In-Reply-To: <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
	 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0

Hi Andy,

On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Issue the reboot */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ep93xx_devcfg_set_clear(priv=
->map, EP93XX_SYSCON_DEVCFG_SWRST, 0x00);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ep93xx_devcfg_set_clear(priv=
->map, 0x00, EP93XX_SYSCON_DEVCFG_SWRST);
>=20
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mdelay(1000);
>=20
> Atomic?! Such a huge delay must be explained, esp. why it's atomic.

atomic or not, SoC is supposed to reset itself here.
However there is an errata [1] and the SoC can lockup instead.
So even pr_emerg() makes sense to me.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_emerg("Unable to restart =
system\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;

[1] http://web.archive.org/web/20161130230727/http://www.cirrus.com/en/pubs=
/appNote/AN258REV2.pdf

--=20
Alexander Sverdlin.

