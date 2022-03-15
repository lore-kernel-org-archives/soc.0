Return-Path: <SRS0=3y6m=T2=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E032C433F5
	for <soc@archiver.kernel.org>; Tue, 15 Mar 2022 11:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51ED7C340F4; Tue, 15 Mar 2022 11:00:48 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0A70C340E8;
	Tue, 15 Mar 2022 11:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0A70C340E8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nU4ue-0002hT-9o; Tue, 15 Mar 2022 12:00:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Frank Wunderlich <linux@fw-web.de>,
	devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	linux-ide@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Rob Herring <robh+dt@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-rockchip@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/6] Add sata nodes to rk356x
Date: Tue, 15 Mar 2022 12:00:21 +0100
Message-Id: <164734201499.2137788.90858927315746768.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220311210357.222830-1-linux@fw-web.de>
References: <20220311210357.222830-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 11 Mar 2022 22:03:51 +0100, Frank Wunderlich wrote:
> This Series converts the binding for ahci-platform to yaml and adds
> sata nodes to rockchip rk356x device trees.

Applied, thanks!

[6/6] arm64: dts: rockchip: Add sata nodes to rk356x
      commit: b2e5612f6ea23c87397e50f8d976cd8c95e3ed17

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
