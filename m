Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13F0C25B75
	for <soc@archiver.kernel.org>; Thu,  6 Jun 2024 07:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91406C4AF16; Thu,  6 Jun 2024 07:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B32C4AF0F;
	Thu,  6 Jun 2024 07:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717658713;
	bh=+dT3zLjmC4JMt1RrMdgW6Me3Gqai/TF0UoZl/qk0Y7w=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=UuQp4t53o8YjM4cSMYbUicjmZnQzsTkvkQmQaniLzLtzu9A+NNMOxZzz5+txRPO3y
	 VRNrM5T18Ra0MjVfB8m3qxYO3OOcHe779oztSpndD34CGz1GwryCod5j97gdFKafxe
	 yHijxhhoVOgTX3D82/FH3/OwRqdtU+0rPVqSxWq8pnM5KVTx7gn8QDx3EDX71qgYx9
	 X+xVqp98sBLUOMJzNzNgXpXxZrK/9EIlfVAXE9cpZM2/luHe9I8SXwU9ddscto1RFw
	 KMDt2IjY7bKhMCUd81fYB2ge92wos9Wp+EumBAivCFrMPX5RmNxgIgYgJia9vE2CMr
	 HmEFsnW3Yo96g==
Date: Thu, 6 Jun 2024 09:25:04 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Dan Carpenter <dan.carpenter@linaro.org>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, Rob
 Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v11 0/8] Turris Omnia MCU driver
Message-ID: <20240606092504.37d31917@dellmb>
In-Reply-To: <CAHp75VdGQUBnbZ2G4tLYBBCD+PeiY4G6HZ6U9ammSMg72TNX7Q@mail.gmail.com>
References: <20240605161851.13911-1-kabel@kernel.org>
	<CAHp75VdGQUBnbZ2G4tLYBBCD+PeiY4G6HZ6U9ammSMg72TNX7Q@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Jun 2024 22:05:37 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:
> >
> > Hello Andy, Hans, Ilpo, Arnd, Gregory, and others,
> >
> > this is v11 of the series adding Turris Omnia MCU driver. =20
>=20
> Thank you!
> There are a few small issues here and there, but overall LGTM. The
> only one main question is what to do with gpiochip_get_desc(). I Cc'ed
> Bart for this.

Thank you for the review, I am going to apply the changes you requested
and wait for Bart, and we'll see what to do with the
gpiochip_get_desc().

Marek
