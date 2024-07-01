Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE9FC30653
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 11:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A38DBC4AF0A; Mon,  1 Jul 2024 11:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD215C116B1;
	Mon,  1 Jul 2024 11:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719833910;
	bh=bHOqgyma+zpO2MbWNympnDKo29K7Cl31NJv3Wl7N7Ls=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=d9MVcZ5AeL+425pje4XMZ6l6YpWd1CNiLok9QRR+ekiNWmELFXkzbZMcs/q/9zn7p
	 /F0EgE81q02J8q9PIVONMS58R+QfbDfrHbhQd8bYGvyS58OPVT1EIo10mD0SZafIF3
	 pGi7riOC8oX3DrD593mh6cIz9XoFc07qtScKf5g8sKvuIhmXuJocD0MFlF5AhCtDFm
	 TX3QYaG4jLgxTyRusplRJKKC95ZnYz24bmr8fSjJgolit68VApDzS4i4N6SlwDNM8M
	 vwaZE4hyeYChyhxLXXuyrA4cNwdROXAc/lGUnqxMCC0f6k4rgBAnqHk6firwxeYBUx
	 Zj4FJmaqFTTBg==
Date: Mon, 1 Jul 2024 13:38:21 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Dan
 Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, Rob
 Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v12 0/8] Turris Omnia MCU driver
Message-ID: <20240701133821.059576fd@dellmb>
In-Reply-To: <nznz6bdxcin3srtf2le34gxbyrmhwquym3xdowoognqaswrjgg@ujvaoaydzj6f>
References: <20240617152606.26191-1-kabel@kernel.org>
	<nznz6bdxcin3srtf2le34gxbyrmhwquym3xdowoognqaswrjgg@ujvaoaydzj6f>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Jul 2024 10:41:15 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> Hi Arnd,
>=20
> will you be merging this series?

Just to clear up, I wanted to ask whether you will be merging or
someone else should take stuff to drivers/platform.

Anyway, I sent v13 with one more cosmetic change, requested by Bart.

Marek
