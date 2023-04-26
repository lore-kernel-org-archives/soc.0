Return-Path: <SRS0=XHct=AR=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED494C77B60
	for <soc@archiver.kernel.org>; Wed, 26 Apr 2023 21:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9A97C4339C; Wed, 26 Apr 2023 21:06:50 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 514ACC433A4
	for <soc@kernel.org>; Wed, 26 Apr 2023 21:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 514ACC433A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-54fae5e9ec7so87582297b3.1
        for <soc@kernel.org>; Wed, 26 Apr 2023 14:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682543207; x=1685135207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C6tKrbT51GaZnl8zer1AnBo8yNRgpprgLkj0av5l+E=;
        b=Kh7TmG3JlHQoPDgJrxEspZSpUN+36yUdamiO43UnPnWU5WHRHExsZuq1crpHQPMIXw
         zzWzXMlOi38Xx4my+77mCqHvk7/X81J/7WthQKZt0CHx/5a1ohrap/HzGWEDQbQACJTb
         YhsFcjssiyz48P8HUQnvmRDVNrO8n5ZicePPH1S7Zj9YadbExO7GDrfEmhV8+JMdHi44
         dS/U1Lzmekv6Z1Px+wN/pWN5LwOrRpCZPrnqoQccfnfTFROZXP698w5QlH4NBcZahcI9
         Av/WtFSCGNW/WXdsMcqPPizaCNJVu9G6mBZV0Jx9mGGkKSo+tGaTmr2RPFnSQVsLEyzh
         SKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682543207; x=1685135207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C6tKrbT51GaZnl8zer1AnBo8yNRgpprgLkj0av5l+E=;
        b=O2hR2hpdsH5MFF+hzLHv3T/Y1BT4nWupKEDxtZMrOk+c1+Gq2A/yipV4Ko+WCLa2Wv
         owIQTJCcpT0KfayZyU+XIRe8p8vWFuHQEV9wkOvFMa8MWbeSqLmwvHLVGH9P1/TwbF6a
         O0+eFCrxElMQI8RACTq/2f3P9/twNYPXkd8y51WblkreElk7Nb9N4spbo3uHx+r2Cfmd
         Pe2EuFhEKPToxqXIXM0yrfe6w6y3V/SNW7S1EgW0ex++C12KnnKgCDLDswIiGWs03RLL
         S+gmLgu2ako7PyXT3ub0a6aYI2GNnzwD5fxrsgH2pAVSqTkazZQ2P66aJywTZiA4Z7K8
         rYUQ==
X-Gm-Message-State: AAQBX9e/82uUDGZcOB/VjbIPbuuBIAFWkKDsq8jr08qFuQk3PkLUj/L7
	jMWu0bVSBHaSYnnofgO0VoN6laHPStN084li+IAgAA==
X-Google-Smtp-Source: AKy350bnHkFKck7ScHLySUohS3TGug3PuU6k1b4WHzFwKnH0/14BD/IU48R1JEuMfUGu5baNdUtxQXCsghQML3QSaV8=
X-Received: by 2002:a81:5d02:0:b0:54f:8b56:bb3 with SMTP id
 r2-20020a815d02000000b0054f8b560bb3mr13933284ywb.5.1682543207061; Wed, 26 Apr
 2023 14:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <CACRpkdarANFQ7-p=-Pi_iuk6L=PfSLDsD3_w4dEVqarwXkEGMQ@mail.gmail.com> <b5396ef5-3fed-4e98-8f37-a9cd4473bddc@sirena.org.uk>
In-Reply-To: <b5396ef5-3fed-4e98-8f37-a9cd4473bddc@sirena.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Apr 2023 23:06:35 +0200
Message-ID: <CACRpkdaZvKoFuDHP0Cd1MuayKtnBjCG5wmWPjwq3pccCrb-P9A@mail.gmail.com>
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Brian Norris <briannorris@chromium.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Hartley Sweeten <hsweeten@visionengravers.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jean Delvare <jdelvare@suse.de>, 
	Joel Stanley <joel@jms.id.au>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Le Moal <damien.lemoal@opensource.wdc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Liang Yang <liang.yang@amlogic.com>, Lukasz Majewski <lukma@denx.de>, Lv Ruyi <lv.ruyi@zte.com.cn>, 
	Masahiro Yamada <masahiroy@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>, 
	Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Sebastian Reichel <sre@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Stephen Boyd <sboyd@kernel.org>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>, 
	Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
	Walker Chen <walker.chen@starfivetech.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, alsa-devel@alsa-project.org, 
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	netdev@vger.kernel.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023 at 11:02=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> On Wed, Apr 26, 2023 at 10:56:53PM +0200, Linus Walleij wrote:
>
> > This is a big patch set and the improvement to the ARM kernel it
> > brings is great, so I am a bit worried about over-review stalling the
> > merged. If there start to be nitpicky comments I would prefer that
> > we merge it and let minor comments and "nice-to-haves" be
> > addressed in-tree during the development cycle.
>
> I'm really not enthusiastic about the SPI bindings being merged as-is.

Agree, the bindings are more important than the code IMO,
they tend to get written in stone.

Yours,
Linus Walleij
