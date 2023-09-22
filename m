Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C5EC04AAB
	for <soc@archiver.kernel.org>; Fri, 22 Sep 2023 11:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3AC6C433C9; Fri, 22 Sep 2023 11:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B0FC433C8;
	Fri, 22 Sep 2023 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695383220;
	bh=V/qr2SZplWfADHpWHxntKDDdGnthWkaZQS1mjpAoveU=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=fdmHR/N2CKRGTsstlvdEff93vNsTPkVYUuZ+/Gr1YSFSO7eQV+TKFYdVZ4RMfZIHm
	 Mr7CzFAWSOgT4GsgMwLHXPCE3gxUxmE3Fr0teTK/vu/y7RomhfkLAI2SLPnt/Jkw+c
	 MNSP1xZPZ5oFTv02Tk1xlfi308XfdTIw1MHniYM3hiykLeH78A9CD1cBxGMNVZjIrh
	 E0a+jqqMqbZEDSXkAXgymFu0g5LD5w5sC5zLiJeNlLsxWJLTd9S2Nl2SH2A5kgjJf5
	 /yFbTSADMRTpZaKuU1ByMCvYqxZT0RVRxyPS7VZlztTf+aQBZjYOtjZCIWs9eUK+Iu
	 WSvDvc9m25Idw==
Date: Fri, 22 Sep 2023 13:46:56 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 5/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <20230922134656.23171869@dellmb>
In-Reply-To: <5940424f-ebaf-a73b-4157-fc3fb7fa7d3c@roeck-us.net>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-6-kabel@kernel.org>
	<5940424f-ebaf-a73b-4157-fc3fb7fa7d3c@roeck-us.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > +static int omnia_wdt_start(struct watchdog_device *wdt)
> > +{
> > +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> > +
> > +	/*
> > +	 * The MCU also implements LED controller, and the LED driver may in
> > +	 * some cases require more I2C bandwidth. In order to prevent stealing
> > +	 * that bandwidth from the LED driver, configure minimum time between
> > +	 * pings to 10% of the configured timeout (for 120 second timeout we
> > +	 * will be pinging at most every 12 seconds).
> > +	 */
> > +	mcu->wdt.min_hw_heartbeat_ms = 100 * mcu->wdt.timeout;  
> 
> This is not what min_hw_heartbeat_ms is supposed to be used for, and it is
> an abuse of the API which is not guaranteed to work. The value is exopected
> to be set at registration time, and it is not supposed to change dynamically.
> It is also competely unnecessary since no sane watchdog daemon will ping
> at such a high rate. Please drop.

Hello Guenter, thanks for the review.

Sorry about this, I thought this was correct cause rti_wdt driver and
feared that watchdog daemons would actually ping at such rate.

I will drop it in the next version of the series.

Marek
