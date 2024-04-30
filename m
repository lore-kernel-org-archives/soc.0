Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7FFC4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 11:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6D40C4AF1A; Tue, 30 Apr 2024 11:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D00C4AF19;
	Tue, 30 Apr 2024 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714478072;
	bh=IapLrD/jogJqlTH0kGzdqSYfKtIIUt9wn2mvkUe0d0k=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=kAYfwnR98InXLzwlWJqhJA+JJwOhNTOxNuHCOr4RLbp9x8NKXnlALo/tp99txLx5D
	 A6L77Zd/oAV1I+ZP3rWVoFgPC7SrlJNbLS9BwUzJb9J8Pow4CpbGZ2tEbComEoLqak
	 cis1JMW3l5PHjwsqJbWZnJju62BIOR48k+31tZhtFG7TKgdAx4OMKRHVDXPuCUlS8J
	 lcRNkrbkXpZaPhiOuTIPh1CA6lqP383MVfvUdxwGj4wISR6qmPChKtUPMlE+qUNU0U
	 ClQsCpxIooroqgx27cmxLAR8VjL8181Zxg8IuTivqPkJHmWwJWhsHkr6QI3Zekz59q
	 MCzjOH19AN24Q==
Date: Tue, 30 Apr 2024 13:54:23 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy
 Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Dan Carpenter <dan.carpenter@linaro.org>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Herbert
 Xu <herbert@gondor.apana.org.au>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, Rob
 Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v7 0/9] Turris Omnia MCU driver
Message-ID: <20240430135423.2034fb51@dellmb>
In-Reply-To: <875xw45cgj.fsf@BLaptop.bootlin.com>
References: <20240424173809.7214-1-kabel@kernel.org>
	<875xw45cgj.fsf@BLaptop.bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Apr 2024 18:13:32 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Hello all,
>
...
> 
> It is still early as there are some comment pending but I wonder who
> will responsible of merging all theses patches ?
> 
> Arnd ? Hans ? Ilpo ? me ?

I am assigning these patches to Arnd on patchwork all this time, so I
guess it could be him, unless he has a problem with this?

I've just sent v8.

Marek
