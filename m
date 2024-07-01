Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE4FC30653
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 08:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 712E9C4AF11; Mon,  1 Jul 2024 08:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85ADFC116B1;
	Mon,  1 Jul 2024 08:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719823283;
	bh=g3cEDjTf4Xom5tTS1ZIFBi+XCHV0H0zZFGlwlfVVvdo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=H/2LyLVwImlaN2jXGEZ0HbL4nmNHcbFgx+PD4v0/EwgvbhHRJ+cKOPJllW0V9pSF+
	 EU15kOgymSOcIDPZhRzNRbj5qNLtREXGenlh6sF7iEgz9pTP2i5UEog3CMUtqOAmmy
	 3rK0fiijeIJE94LaR1AK/zVOrYNpoqsIpjVCsZTB750PfUySn21lB61v0RMEmYlde8
	 cFSVlwCwGxonNsmypAgoHKWRQEz2Eigy4EwdqV/+m84ZpKBDQK3cibu7Zlbpl1HsBA
	 0cOaXG+xyceUdMOreCxlVXkbt8keggqRedo6kjJhMOvwx+hxNN8mGqdaFpjqS1ul3n
	 0U5XgR7YdbAZw==
Date: Mon, 1 Jul 2024 10:41:15 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Dan Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, 
	Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v12 0/8] Turris Omnia MCU driver
Message-ID: <nznz6bdxcin3srtf2le34gxbyrmhwquym3xdowoognqaswrjgg@ujvaoaydzj6f>
References: <20240617152606.26191-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617152606.26191-1-kabel@kernel.org>

Hi Arnd,

will you be merging this series?

Thanks.

Marek
