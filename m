Return-Path: <SRS0=mBfy=S6=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE5DC433EF
	for <soc@archiver.kernel.org>; Tue, 15 Feb 2022 21:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 227A9C340EC; Tue, 15 Feb 2022 21:14:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B414FC340EB;
	Tue, 15 Feb 2022 21:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B414FC340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ewfe4TG75hNdQYiqI5YcRGb9gBCJCzU8HIieAhtXL9Q=; b=rUAnTaT6QlkDIZSbdWSdyVfoP0
	/IhvV+6wHA7VESbxmaQ0RieXS20ndEBV8tIvsXyH/k5IlVK9Mx8b9B6gxBFLWyXPtF/wQc/tMi1/F
	59BFtiff3amxKR2ZXyQGcWyREYWaMSuavp6yZ7tYIVti1E6erzFBouUTvaoCpEfwCHZ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1nK59U-0067eJ-EW; Tue, 15 Feb 2022 22:14:24 +0100
Date: Tue, 15 Feb 2022 22:14:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?UGF3ZcWC?= Dembicki <paweldembicki@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Shawn Guo <shawnguo@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Hao Fang <fanghao11@huawei.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	linux-kernel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: kirkwood: Add Ctera C-200 V1 board
Message-ID: <YgwXsIRR/B9UmBOD@lunn.ch>
References: <20220215163926.894-1-paweldembicki@gmail.com>
 <Ygvv/CWUYumhKoCh@lunn.ch>
 <CAJN1Kkz3_z8M1j_mtOJzriUWj1m6iAEdZSZFg-zB2Gw2BYY4wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJN1Kkz3_z8M1j_mtOJzriUWj1m6iAEdZSZFg-zB2Gw2BYY4wA@mail.gmail.com>

> > Thanks for adding a comment. So you need something like a PWM driving
> > it? Have you tried playing with drivers/input/misc/pwm-beeper.c ?
> 
> It use a PWM device. Driver gpio-pwm isn't accepted in mainline so far.
> 
> > Some of the mvebu family have a simple PWM functionality as part of
> > the GPIO controller. I don't remember if kirkwood has this.
> 
> Kirkwood have very simple blink mode only: GPIO pin make visible blinks.

[Goes and looks at the datasheet]

Yes, Kirkwood has fixed rate blinking. It is the later generation of
devices which have true PWM capabilities.

	Andrew
