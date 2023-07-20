Return-Path: <SRS0=fCxg=DG=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10896EB64DD
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 08:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBDDEC4339A; Thu, 20 Jul 2023 08:54:23 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 002B3C433CC;
	Thu, 20 Jul 2023 08:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 002B3C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51e57874bfdso734875a12.0;
        Thu, 20 Jul 2023 01:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689843261; x=1692435261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BGYd0XzLOZIaect1B8DLqJQBB8NGVA7ArI9KPRHwCuA=;
        b=R6F9AvgnvdC0oDU+DTR4MfnnL48BCbJgyhCk9A0VhVWOhqOQpe41/AATzBaPwXrlbp
         NiVoQ4an/IEe/zBQWtSt4j+0ECY7RSMDaQhEu0LpfpScWHmLaf5l2o7v0GzABUvd19s5
         w3jdfWKKI2Z7TETv8eOzBN9Q/hcD451Hvdx3NnYuVWduVN2kzLJ7Mi+gd7kIEYAdNLGx
         PfpKo5/5UeGO/gSzn2N0keUNKeCsk90RxfmW4xQ3nGSsJBlNdtDiyYfRTsLxuM+guq5h
         JAEcEamXP44sXSMwQx4SSiQZUZV6ASyXLRxNQClqiEF/jwHGMVw/ZkwvX6yxmHqpohoE
         Ggkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689843261; x=1692435261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGYd0XzLOZIaect1B8DLqJQBB8NGVA7ArI9KPRHwCuA=;
        b=cL0rRxFVeiDwaB2IWSYF9wY0IVUr0oMrwbVILuJKx7xpk/r3j0WbagxUewbFVrRky8
         Mz8G22/MbxDpn9NyCA1bOVNBPvX5WJampORiINtCKnymdBQ1GhBGVdG4JjjccdLe0N4j
         7CBRopQYbrjFR899MY+06RZ30PpsdWfuIfR8KDrMwjVb+9qsurs5sFkp5BxjDDTxf433
         4EZ0npWRx72noNDzLBTbcUHMEIyBfoNAhkDx8IIX1oL0LuotS/bBXQj1ANlhG3FN3C71
         FVq9liaEUFQzouwQ4KyulyNx/jpbs2pWhcgysIwXFx5YNdMIeUnQX3Cgctxp1aoZ5IUj
         9Ksg==
X-Gm-Message-State: ABy/qLaLaUA2k5P3Zt+vcenZ8auV19akhvW9CYjsF/svYAgDOwkZKDBX
	K96uukk83fY9A3riTKHCYPI=
X-Google-Smtp-Source: APBJJlFMasg2dNIicMwfx1YyIyQvduddQCgLot96389m6Z9iDA5SQh0KK8JlI0qHyY43u+aGtpP/9g==
X-Received: by 2002:aa7:c504:0:b0:51e:10d8:e066 with SMTP id o4-20020aa7c504000000b0051e10d8e066mr1651697edq.24.1689843260572;
        Thu, 20 Jul 2023 01:54:20 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id f20-20020a50ee94000000b00521ce1f04b8sm443021edr.12.2023.07.20.01.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:54:20 -0700 (PDT)
Message-ID: <e4486050b95ad53ba9e1d6080c4b6de4b646dcdd.camel@gmail.com>
Subject: Re: [PATCH v3 13/42] watchdog: ep93xx: add DT support for Cirrus
 EP93xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>,  Lennert Buytenhek <kernel@wantstofly.org>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>,  Alessandro Zummo <a.zummo@towertech.it>,
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
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andy Shevchenko
 <andy@kernel.org>,  Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen
 <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Thu, 20 Jul 2023 10:54:18 +0200
In-Reply-To: <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0

Hi Nikita,

On Thu, 2023-07-20 at 14:29 +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
>=20
> Add OF ID match table.
>=20
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

--=20
Alexander Sverdlin.

