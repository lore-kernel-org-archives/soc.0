Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCD0C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 09:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 776EC61050
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 09:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 776EC61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApMVWvv8KahwYWYxaTs1agpRJzDWWm+Uxcz/rFNcjuQ=; b=oTjTCS9QPsIcoY
	yEpD365W8e6encjQkIZosPrfQrYogD3LPJ3m+tSmcmcnrJeA6HU5xYhwnZ/CCG652CdzvtWXdbvii
	UCmApxr3l5hbOt1RqpTkCt9FfP1Ve4mn4NQwqQCj/iHPN6cOFzxU/2NoAt13y3MJoOTHoKAWwivBR
	xPaO0huYFhmqq6hz5/spO4vvjifqQFsu+X8BqackqVYgK00jiKXvBgNss4hX6i1E0QAw9FhQfWiLA
	6uofaugNH8hUo6NwLEMv44YbiIT7sceSec6bL9SAIWxc21t3nHaH2XTL7dLZ4lN0fzuUB8AD50bn9
	UY4W2qh3jN2BXet8hEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAU8M-00FXWM-0j; Mon, 02 Aug 2021 09:21:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAU8H-00FXVS-N5
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 09:21:15 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
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
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
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
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_022113_796232_0954E076 
X-CRM114-Status: GOOD (  16.88  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210802092100.Pt9cDNeA1fOasYZPwrrjxTcnOZKou760X5IxnIdY5G4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
