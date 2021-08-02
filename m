Return-Path: <SRS0=2+8r=MZ=pengutronix.de=ore@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BEBC4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 09:21:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C62A861029; Mon,  2 Aug 2021 09:21:08 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19DDB60BD3
	for <soc@kernel.org>; Mon,  2 Aug 2021 09:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19DDB60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1mAU86-0001ek-K3; Mon, 02 Aug 2021 11:21:02 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <ore@pengutronix.de>)
	id 1mAU84-0000Rl-GO; Mon, 02 Aug 2021 11:21:00 +0200
Date: Mon, 2 Aug 2021 11:21:00 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>,
	Juergen Borleis <jbe@pengutronix.de>,
	Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] ARM: dts: add SKOV imx6q and imx6dl based boards
Message-ID: <20210802092100.ctkncu6g4ka4rvtt@pengutronix.de>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-5-o.rempel@pengutronix.de>
 <20210726012043.GC5901@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210726012043.GC5901@dragon>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:19:00 up 242 days, 23:25, 24 users,  load average: 0.01, 0.06,
 0.07
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

[...]
> > +	reg_vcc_mmc_io: regulator-vcc-mmc-io {
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_vcc_mmc_io>;
> > +		compatible = "regulator-gpio";
> > +		vin-supply = <&reg_5v0>;
> > +		regulator-name = "mmc_io_supply";
> > +		regulator-type = "voltage";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpios = <&gpio7 13 GPIO_ACTIVE_HIGH>;
> 
> enable-active-high?

right, thx!

> > +		states = <1800000 0x1>, <3300000 0x0>;
> 
> Hmm, I do not see this 'states' in fixed-regulator.yaml.

It is in gpio-regulator.yaml

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
