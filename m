Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6F2C433E0
	for <soc@archiver.kernel.org>; Sat, 16 Jan 2021 08:02:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 55EBB238D7; Sat, 16 Jan 2021 08:02:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 483BE2076E;
	Sat, 16 Jan 2021 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1610784176;
	bh=9QQvwsTXxCQTUMTA2paCEpf3H5RUTI78+wpTdzGz3Fw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=jDAyvHrP2Sr1yuEirPGTUA+cOd6cY1bq8YNWwJN5X9Si67fO7T+PNbvgXGyRX0qGT
	 CsteMjJuEnhNT5tJxjo9nf+Hjlo+A+fMts6PH4X8PuoD+LUY2B/P3OOxKRLlvq8KaT
	 V20EM5AWF2BblfPPgzSsf+k1tx4B0sfBgzqQEpVc=
Date: Sat, 16 Jan 2021 09:02:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-spi <linux-spi@vger.kernel.org>,
	Linux I2C <linux-i2c@vger.kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Remove ARM platform efm32
Message-ID: <YAKdq5GYprtSVLGY@kroah.com>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>

On Fri, Jan 15, 2021 at 05:44:59PM +0100, Arnd Bergmann wrote:
> On Fri, Jan 15, 2021 at 4:51 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > From: Uwe Kleine-König <uwe@kleine-koenig.org>
> >
> > Hello,
> >
> > compared to v1 (Message-Id:
> > 20210114151630.128830-1-u.kleine-koenig@pengutronix.de) I did the following changes:
> >
> >  - add "serial" to the summary line of the patch removing the serial
> >    driver
> >  - actually remove the serial driver in the patch that claims to do this
> >    instead of patch 1.
> >
> > On irc Arnd signalled to want to merge the first patch. As there are no
> > hard interdependencies between these, I think the best approach is for the
> > individual maintainers to pick up the patches they are responsible for.
> 
> I've applied patches 1 *and* 7 now, left 2 through 6.
> 
> Subsystem maintainers: Please let me know if you want to pick the
> driver removal patches into your tree, or if which ones I should apply
> here, with your Ack.

I've already taken patch 6 into my tty/serial tree, thanks.

greg k-h
