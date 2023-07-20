Return-Path: <kuba@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E45EB64DA
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 16:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A4C6C433CA; Thu, 20 Jul 2023 16:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB08C433C8;
	Thu, 20 Jul 2023 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689871480;
	bh=LEysQCPOjkIGVkLgbEHtp05RCrkbKmho1Jnuua4nkos=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=NIyQ8SUkYcWyM9yLSgzx8MPNG0P8iiUExldPhZmRD5Ln3HJahN0rsWbXbDDcQrjAt
	 VBvdgCqp6zZQ0+jJVsALdzwoL+YSCAAzocpGkenN5ghkusUj63+Xwhyj38k+70D/Gg
	 z6bBpkDRiv2mGjW2JLcyl7HMjXlcHgo2YqKbTLmsVmvE3YzgRup93sAhZgFi3k4J+1
	 LSpFfd0vstfSeAOCi2WJX1xWMCIMjIWhrLRbRmk5mJ1C5TS3BMZjD/3iS33PV7H8sb
	 OS5xE0YGwFXfh/Kt3qp8afiRo9pAjHE2AAtBXJzPzzpbQ8lbu4hRZqVLLZCrsjsz7j
	 NiEhb9Kgm24vw==
Date: Thu, 20 Jul 2023 09:44:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nikita Shubin via B4 Relay
 <devnull+nikita.shubin.maquefel.me@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: <nikita.shubin@maquefel.me>, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Sebastian
 Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul
 <vkoul@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Damien
 Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>, Michael Peters
 <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 00/42] ep93xx device tree conversion
Message-ID: <20230720094437.0e378fb8@kernel.org>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Jul 2023 14:29:00 +0300 Nikita Shubin via B4 Relay wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> The main goal is to receive ACK's to take it via Arnd's arm-soc branch.
> 
> I've moved to b4, tricking it to consider v0 as v1, so it consider's
> this version to be v3, this exactly the third version.

Split this per subsystem, please.
You shouldn't spam everyone with 40+ patches.
-- 
pw-bot: cr
