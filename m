Return-Path: <SRS0=HzfL=JF=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22A9C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:25:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACD636113C; Thu,  8 Apr 2021 15:25:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F83161103;
	Thu,  8 Apr 2021 15:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F83161103
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.belloni@bootlin.com
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 164BD2000F;
	Thu,  8 Apr 2021 15:25:28 +0000 (UTC)
Date: Thu, 8 Apr 2021 17:25:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
Message-ID: <YG8gaHqlJ+oCfkTt@piout.net>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>

Hi,

On 08/04/2021 17:08:26+0200, Arnd Bergmann wrote:
> arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml: /: 'etm@73C000' does
> not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
> 'pinctrl-[0-9]+'
> arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: /: 'etm@73C000' does not
> match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
> 'pinctrl-[0-9]+'
> 

This was introduced by 4d930c421e3b ("ARM: dts: at91: sama5d2: add ETB
and ETM unit name"), trying to fix another warning.

I guess this is because
Documentation/devicetree/bindings/arm/coresight.txt is not yaml yet.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
