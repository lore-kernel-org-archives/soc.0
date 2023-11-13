Return-Path: <SRS0=8Kzp=G2=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA497C4332F
	for <soc@archiver.kernel.org>; Mon, 13 Nov 2023 10:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C51BC433CA; Mon, 13 Nov 2023 10:00:28 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BA02C433C8;
	Mon, 13 Nov 2023 10:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BA02C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-66d0ceba445so22074946d6.0;
        Mon, 13 Nov 2023 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699869626; x=1700474426; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbOR8jc4vESBCIxoa+hxCKP6qo+nQDlXSDfPg0qKWS8=;
        b=YM/QTL/7RvoJHAp6JqfNJvfYGkaLQR87Kxg9SG7RN0g+7JwTXCrzkxrA/O2PqjX8S8
         M8qSgA9/8oV9iSKJGLeJO+ufJJBzUHXijzRxoNnGrXy/HzWn0NIbPcoYsS7LCYzZNSKC
         Vo9GBZwbS1Quw843tNQqp3fOCl0s348ZwM9Dv8GsgnjheRt7v8jHifSolmNlwPnDrwI0
         dJDELs6V8WFQ9w1Dd7cmHafsNWLtBVH/2RMaxo/9i0Saepo3fRbbrfycEEZDSYlSoWiD
         DYRDmcS+7+rREuoV0iDVf+hrT2oNmakI1JY8Gw3N7wMyC3f5qtslSSkvBlfvEMg7+XxH
         +WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869626; x=1700474426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbOR8jc4vESBCIxoa+hxCKP6qo+nQDlXSDfPg0qKWS8=;
        b=gyBWV0na0AwCfoXDFL6siUOyBNbcV6BKSZriDfDKy+HyphfAjWQ6fW9FKMhQwCnPmf
         AUfejEIJsac9HiyjM2lSvEfg9tykd19IjtWrlT7dxHQKM99Lu+lDyWyJj0vBI4RUw2nr
         z/5lL7cTTpeGj+dVjPbEqrotANH524gbGEOcdERPOKsjLQjJcPNpoguxV/vdvpwyTJeC
         ClhrJUpuU1LIloEeVqo9Y7aHB5VknYacXyt/Vbea2SEkOIS/uoTXrWv99s8g5kVHnunb
         OsI2rcDi4UOgb3tntJi1XcRad5Epg7Qr+I0jS6yFqpLJPIvy5O/jCDqYOzWSqMEwv1l3
         HTcA==
X-Gm-Message-State: AOJu0Yw/0k3FesEzIToyiL/KkpxhdFq/wgLsu7mu+SBOxA1g/dBQXm1C
	FdwXRzSh4ZwGh6+UXRLqDTcSodzIKpHmqWDDzP0=
X-Google-Smtp-Source: AGHT+IGCUr7PujFC+poPa2QrZRvWL4HOk1bJVQMa23HsF2MY33M5q50/7KY3Uea2911BZ50MrpHn+FMZq5R37QecRrw=
X-Received: by 2002:ad4:45b4:0:b0:658:1eec:408a with SMTP id
 y20-20020ad445b4000000b006581eec408amr4664228qvu.40.1699869626386; Mon, 13
 Nov 2023 02:00:26 -0800 (PST)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me> <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
 <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
In-Reply-To: <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Nov 2023 11:59:49 +0200
Message-ID: <CAHp75VeYHscM-r94kTrpH44W=OGVq+qoNNQZoVrR5_n-_K_Xsw@mail.gmail.com>
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

On Sat, Nov 11, 2023 at 8:18=E2=80=AFPM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:

...

> > > +       mdelay(1000);
> >
> > Atomic?! Such a huge delay must be explained, esp. why it's atomic.
>
> atomic or not, SoC is supposed to reset itself here.
> However there is an errata [1] and the SoC can lockup instead.

Good, and what I'm saying is that this piece of code must have a
comment explaining this.

> So even pr_emerg() makes sense to me.

This is irrelevant to the comment.

> > > +       pr_emerg("Unable to restart system\n");
> > > +       return NOTIFY_DONE;
>
> [1] http://web.archive.org/web/20161130230727/http://www.cirrus.com/en/pu=
bs/appNote/AN258REV2.pdf

--=20
With Best Regards,
Andy Shevchenko
