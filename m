Return-Path: <SRS0=VwEy=AP=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFD4C7618E
	for <soc@archiver.kernel.org>; Mon, 24 Apr 2023 11:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22445C433AC; Mon, 24 Apr 2023 11:31:51 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B05EEC433D2;
	Mon, 24 Apr 2023 11:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B05EEC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 7A206582110;
	Mon, 24 Apr 2023 07:31:48 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 24 Apr 2023 07:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1682335908; x=1682343108; bh=Y9
	FYoJaNOjxIXKXj5iVt3HG1MU0gziVJXHg42DuXBOg=; b=H/aI5xfu4/X/cYq8+q
	xGRXgtXhxBpBlpJF5oNaL0cTiYSlseucxY51bY4PRf1gv4QIHv63oN/18nV2INkn
	6O2pTeLy0q1gyPwhORooxGeHzHI3WimhvlvsW4wWbDrEt8hw/FVRgnnlInC+4vwP
	kYbG0HHULZdaYWUwxjEb9o/FloV9dYAihc/IDkZXPxJYIj9+fUYsC5I/vtriUmgb
	FWybLUf+Y2VRK7qDk3jHQ7J32E/XtRUTSXbdYtSlt5nHb/u8lENeGKhiuW8+l/DS
	mAoSk2lpjRi3o7VwNGpJJ9ARQNskUw0EdqmtBWLord/1SW3xetGHzX3aI/cVpPmk
	woDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682335908; x=1682343108; bh=Y9FYoJaNOjxIX
	KXj5iVt3HG1MU0gziVJXHg42DuXBOg=; b=dpbP4Jh1s0eCqDGOmM7UDUyNWzhc4
	XX9bUZIXp933hmZB9xrD12WHtB6Mz1whx6WnhlN2Tj7VydKWDfUUAGl/7F9sJ3rD
	MiZ84QLQbINxpRY0pCCvJq5n3tlu/6yOlabr1cHGdW18SNLJFvym/jAh532kU1UJ
	Ka51E8Hk9RhZMWzJVPef/ePlOWrrcx5L9UOuQ/osK+hFYMPKwlUuS5b9WEV/rM4e
	Zrq47gLrjM0lVZGYInJ+pTUXtuyWn4mMye9MK+OFjIBfPHYbgsrxq3UV7LaA9oqA
	8yfZp/LRYFrNPCEeph46hWBXVhBJ51Wk/pvGPjdOsx8HfmcbvLQYmxGZA==
X-ME-Sender: <xms:o2hGZMsP1r_hHGjqMpUeClqOi55IE9JKADt-uJNa-nFyfqUf9AlLCQ>
    <xme:o2hGZJc3b-Gx9pVoYHmn9d6Zmc_6lwOPFMRFUZD37QHTN5IY4VtajG_r-xvSklBL3
    8lU67eg-UpjMXfN8f0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:o2hGZHyt4BARWluvy-ny0VstXoMFWLhD_0JgVOkCb6OyEz58lTf2Ew>
    <xmx:o2hGZPOxusZyYNgUhcREUxMNqc2Ze7MI2lllSsAiNTOJegNvuTE9-w>
    <xmx:o2hGZM_apVsxZaXCjLmibZImNAbgHZ-mYH0mKLyqEE9WovAP88tw8Q>
    <xmx:pGhGZP2rYsHBZNn0RRfI9M2aIExsAjxd8O6cZjaoBdj_dUcpRV9b9Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2684DB60086; Mon, 24 Apr 2023 07:31:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <8101c53e-e682-4dc3-95cc-a332b1822b8b@app.fastmail.com>
In-Reply-To: <20230424123522.18302-1-nikita.shubin@maquefel.me>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
Date: Mon, 24 Apr 2023 13:31:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nikita Shubin" <nikita.shubin@maquefel.me>
List-Id: <soc.lore.kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Alessandro Zummo" <a.zummo@towertech.it>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Brian Norris" <briannorris@chromium.org>,
 "Chuanhong Guo" <gch981213@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Emil Renner Berthing" <kernel@esmil.dk>,
 "Eric Dumazet" <edumazet@google.com>,
 "Florian Fainelli" <f.fainelli@gmail.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Hartley Sweeten" <hsweeten@visionengravers.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Hitomi Hasegawa" <hasegawa-hitomi@fujitsu.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Jean Delvare" <jdelvare@suse.de>, "Joel Stanley" <joel@jms.id.au>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 "Liang Yang" <liang.yang@amlogic.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Lukasz Majewski" <lukma@denx.de>, "Lv Ruyi" <lv.ruyi@zte.com.cn>,
 "Mark Brown" <broonie@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Nicolas Saenz Julienne" <nsaenz@kernel.org>,
 "Olof Johansson" <olof@lixom.net>, "Paolo Abeni" <pabeni@redhat.com>,
 "Qin Jian" <qinjian@cqplus1.com>, "Richard Weinberger" <richard@nod.at>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sebastian Reichel" <sre@kernel.org>,
 "Sergey Shtylyov" <s.shtylyov@omp.ru>, "Stephen Boyd" <sboyd@kernel.org>,
 "Sumanth Korikkar" <sumanthk@linux.ibm.com>,
 "Sven Peter" <sven@svenpeter.dev>, "Takashi Iwai" <tiwai@suse.com>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Walker Chen" <walker.chen@starfivetech.com>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Yinbo Zhu" <zhuyinbo@loongson.cn>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 soc@kernel.org
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
Content-Type: text/plain

On Mon, Apr 24, 2023, at 14:34, Nikita Shubin wrote:
> This series aims to convert ep93xx from platform to full device tree support.
>
> Tested on ts7250 64 RAM/128 MiB Nand flash, edb9302.
>
> Thank you Linus and Arnd for your support, review and comments, sorry 
> if i missed something -
> these series are quite big for me.
>
> Big thanks to Alexander Sverdlin for his testing, support, review, 
> fixes and patches.

Thanks a lot for your continued work. I can't merge any of this at
the moment since the upstream merge window just opened, but I'm
happy to take this all through the soc tree for 6.5, provided we
get the sufficient Acks from the subsystem maintainers. Merging
it through each individual tree would take a lot longer, so I
hope we can avoid that.

      Arnd
