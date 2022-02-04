Return-Path: <SRS0=vR/P=ST=armlinux.org.uk=linux+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B95C433F5
	for <soc@archiver.kernel.org>; Fri,  4 Feb 2022 12:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F774C340F0; Fri,  4 Feb 2022 12:31:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 589B8C004E1
	for <soc@kernel.org>; Fri,  4 Feb 2022 12:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 589B8C004E1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mzxF9rMeHdGHwkTPDimCxRmilWqf6MiwMi9qg5Sr64g=; b=vl3i11hF8iQy1h0Ag1YRBLQAG7
	dAUWYNtSwGnV/h/3SZGvDI79vCb1IEbbtu1UQ3FfZta2TTQ2uI3cfSWVhx6A7bIW/Wj5SVNcGD6XY
	418/0rcrILwiuHAWq2bEWrG3CtJrTzBtQ1S0fQbDDKu7PuyDjJWcpusaTPiE+f8BhmPgO0W9dxqG4
	ANF4a80aclwToWxEzEbz1ZbszC59Wpan34MN2z1REh6gVUGqTNlsaxyfNT/K03UeG6PDgF8dQPSMY
	lB6C1Kf71mwm4Og/bizKfCFlky7D1xuMSKf6R6BoJmtueaOi3urC0I9J+3NpAOum1WYjEIoCK3VOg
	bTdYh5bg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57040)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1nFxk9-0004Zj-N4; Fri, 04 Feb 2022 12:31:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1nFxk2-0004yb-7L; Fri, 04 Feb 2022 12:31:06 +0000
Date: Fri, 4 Feb 2022 12:31:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joe Perches <joe@perches.com>
List-Id: <soc.lore.kernel.org>
Cc: nick.hawkins@hpe.com, verdun@hpe.com, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Corey Minyard <minyard@acm.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Hao Fang <fanghao11@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Wang Kefeng <wangkefeng.wang@huawei.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
Message-ID: <Yf0cihUQ1byjnh3d@shell.armlinux.org.uk>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <Yf0Wm1kOV1Pss9HJ@shell.armlinux.org.uk>
 <ad56e88206a8d66b715035362abe16ece0bde7d3.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad56e88206a8d66b715035362abe16ece0bde7d3.camel@perches.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Feb 04, 2022 at 04:18:24AM -0800, Joe Perches wrote:
> On Fri, 2022-02-04 at 12:05 +0000, Russell King (Oracle) wrote:
> > On Wed, Feb 02, 2022 at 10:52:50AM -0600, nick.hawkins@hpe.com wrote:
> > > +	if (readb_relaxed(timer->control) & MASK_TCS_TC) {
> > > +		writeb_relaxed(MASK_TCS_TC, timer->control);
> > > +
> > > +		event_handler = READ_ONCE(timer->evt.event_handler);
> > > +		if (event_handler)
> > > +			event_handler(&timer->evt);
> > > +		return IRQ_HANDLED;
> > > +	} else {
> > > +		return IRQ_NONE;
> > > +	}
> > > +}
> 
> It's also less indented code and perhaps clearer to reverse the test
> 
> 	if (!readb_relaxed(timer->control) & MASK_TCS_TC)

This will need to be:

 	if (!(readb_relaxed(timer->control) & MASK_TCS_TC))

> 		return IRQ_NONE;
> 
> 	writeb_relaxed(MASK_TCS_TC, timer->control);
> 
> 	event_handler = READ_ONCE(timer->evt.event_handler);
> 	if (event_handler)
> 		event_handler(&timer->evt);
> 
> 	return IRQ_HANDLED;
> 
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
