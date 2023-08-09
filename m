Return-Path: <SRS0=0hww=D2=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA50C001B0
	for <soc@archiver.kernel.org>; Wed,  9 Aug 2023 13:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F4A3C433C9; Wed,  9 Aug 2023 13:58:20 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7068C433C7;
	Wed,  9 Aug 2023 13:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7068C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qTjgu-0007Qm-Nw; Wed, 09 Aug 2023 15:57:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Jay Fang <f.fangjian@huawei.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Benjamin Fair <benjaminfair@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Rob Herring <robh@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	soc@kernel.org,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Patrick Venture <venture@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Avi Fishman <avifishman70@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nancy Yuen <yuenn@google.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Shiraz Has him <shiraz.linux.kernel@gmail.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chen-Yu Tsai <wens@csie.org>,
	Antoine Tenart <atenart@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Thierry Reding <treding@nvidia.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-sunxi@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: (subset) [PATCH v2 00/23] ARM: DT include cleanups
Date: Wed,  9 Aug 2023 15:57:33 +0200
Message-Id: <169158939237.3288791.15504684466280859190.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 03 Aug 2023 16:42:40 -0600, Rob Herring wrote:
> Arnd, This is all the remaining ARM and SoC related patches of DT
> include cleanups which have not be applied by sub-arch maintainers.
> 
> A few of these are v2, but most are just resends of v1.
> 
> 

Applied, thanks!

I didn't find a reply to the thread in terms of it going
in alltogether, so went forward and picked the Rockchip things
I missed before.


[12/23] ARM: rockchip: Drop unused includes
        commit: 8cbdf5d2880923070198c240534f4cca3e04dfb1
[20/23] soc: rockchip: Explicitly include correct DT includes
        commit: fc7696e2ae81404c6ca176e7ebbddd4b19c40953

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
