Return-Path: <kuba@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A492EC77B61
	for <soc@archiver.kernel.org>; Mon, 24 Apr 2023 22:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D8DBC433B3; Mon, 24 Apr 2023 22:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2511C433D2;
	Mon, 24 Apr 2023 22:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682375378;
	bh=/XB/pRoz4/h3AwwkgCCzvIAy3cxQfw42RvBmVv0DJhM=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=U2Yp2/z7t6zyo1xCerBgL9FLGGAQh9MiU8yLWwHqyElj6gGLs+Ic9uUnd6Y9g83QI
	 Kd9PXjaDrFD8osNO22XYdaI85nDeMVuImaThWLTq5hwRsx+wRtgHSxELyaS39uikdW
	 /n1jfBdYtWg39CwqAulMZXdzyQ9et3X6EKTp9znImT8GkO2un/Tn91o4w7KewYikzV
	 OjhJWxtstk9UIcJP3+O0j1jmpqzC+cvb0kILeS9v6CS0PMkoILyYja6D5/+dYR3R9l
	 Tu3PMElbxryd5tzW+UFNjL1Y+AEBsPJ1+u3NC28dSDPK6siVRu7FkgUhNvyW09gRAn
	 2B1JYH1WxxiJQ==
Date: Mon, 24 Apr 2023 15:29:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: "Nikita Shubin" <nikita.shubin@maquefel.me>, "Arnd Bergmann"
 <arnd@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Alexander
 Sverdlin" <alexander.sverdlin@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?=
 <j.neuschaefer@gmx.net>, "Russell King" <rmk+kernel@armlinux.org.uk>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 "Alessandro Zummo" <a.zummo@towertech.it>, "Alexander Gordeev"
 <agordeev@linux.ibm.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Brian Norris" <briannorris@chromium.org>, "Chuanhong Guo"
 <gch981213@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, "Damien
 Le Moal" <dlemoal@kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@linaro.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Emil Renner Berthing" <kernel@esmil.dk>, "Eric Dumazet"
 <edumazet@google.com>, "Florian Fainelli" <f.fainelli@gmail.com>, "Guenter
 Roeck" <linux@roeck-us.net>, "Hartley Sweeten"
 <hsweeten@visionengravers.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?=
 <heiko@sntech.de>, "Hitomi Hasegawa" <hasegawa-hitomi@fujitsu.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Jean Delvare" <jdelvare@suse.de>,
 "Joel Stanley" <joel@jms.id.au>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Damien Le Moal"
 <damien.lemoal@opensource.wdc.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Liang Yang" <liang.yang@amlogic.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Lukasz Majewski" <lukma@denx.de>, "Lv Ruyi"
 <lv.ruyi@zte.com.cn>, "Mark Brown" <broonie@kernel.org>, "Masahiro Yamada"
 <masahiroy@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Nicolas
 Saenz Julienne" <nsaenz@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 "Paolo Abeni" <pabeni@redhat.com>, "Qin Jian" <qinjian@cqplus1.com>,
 "Richard Weinberger" <richard@nod.at>, "Rob Herring" <robh+dt@kernel.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>, "Russell King"
 <linux@armlinux.org.uk>, "Sebastian Reichel" <sre@kernel.org>, "Sergey
 Shtylyov" <s.shtylyov@omp.ru>, "Stephen Boyd" <sboyd@kernel.org>, "Sumanth
 Korikkar" <sumanthk@linux.ibm.com>, "Sven Peter" <sven@svenpeter.dev>,
 "Takashi Iwai" <tiwai@suse.com>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Thomas Gleixner" <tglx@linutronix.de>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Walker Chen" <walker.chen@starfivetech.com>, "Wim Van Sebroeck"
 <wim@linux-watchdog.org>, "Yinbo Zhu" <zhuyinbo@loongson.cn>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org, Netdev
 <netdev@vger.kernel.org>, soc@kernel.org
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
Message-ID: <20230424152933.48b2ede1@kernel.org>
In-Reply-To: <8101c53e-e682-4dc3-95cc-a332b1822b8b@app.fastmail.com>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
	<8101c53e-e682-4dc3-95cc-a332b1822b8b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Apr 2023 13:31:25 +0200 Arnd Bergmann wrote:
> Thanks a lot for your continued work. I can't merge any of this at
> the moment since the upstream merge window just opened, but I'm
> happy to take this all through the soc tree for 6.5, provided we
> get the sufficient Acks from the subsystem maintainers. Merging
> it through each individual tree would take a lot longer, so I
> hope we can avoid that.

Is there a dependency between the patches?
-- 
pw-bot: nap
