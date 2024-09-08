Return-Path: <SRS0=EDZP=QG=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B26ECE577
	for <soc@archiver.kernel.org>; Sun,  8 Sep 2024 21:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7B14C4CEC8; Sun,  8 Sep 2024 21:51:56 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1378FC4CEC3;
	Sun,  8 Sep 2024 21:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1378FC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HdzA9hOC0hHzGRZqed6XmF0v1kxmuoN/HSkiwuamSm8=; b=nmRnrrvNagarSqJeTAKjvZjmGH
	3bJlcLtn2hbyFjoTMT+/o51YrJat7sqi44Q+Dq2bCXR6kxeUxobgJVo9HJX/9YFdbOGt18TZf6vJm
	P63Fw0wNkPdlX35eHE+XneOSagzvJNATjtuWWpKAHkemzpcVgdbnww65PkPCh2k+lTqe1wl4xY3GB
	6JK1nuA8bPIYqvpECXFFsVUS153izOcUtRlBQE1VGBPiZmKNnt8V7pj23TD4kEjvOogUHzw416SRP
	K9LQF6/xG/yC60+NPBYUlsH1S2fk1MbQKJJxREGfN9gtIecOsA4A833LMKojTCzgXF48ynfPA5J2S
	gYU00DSw==;
Received: from i5e8616cc.versanet.de ([94.134.22.204] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1snPp3-0004IJ-8y; Sun, 08 Sep 2024 23:51:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.12 #2
Date: Sun, 08 Sep 2024 23:54:08 +0200
Message-ID: <1862312.dTVjPilprF@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 0296f20c72d23f41ca0ccd64eb849e9ef1aa8977:

  ARM: dts: rockchip: Do not describe unexisting DAC device on rv1108-elgin-r1 (2024-08-29 19:37:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.12-rockchip-dts32-2

for you to fetch changes up to 898eb75f443eaf6cb46facf52fc337fbdbdca079:

  ARM: dts: rockchip: Add pwm node for RV1126 (2024-09-04 11:20:00 +0200)

----------------------------------------------------------------
More pwm, i2s and i2c nodes for the RV1126 soc.

----------------------------------------------------------------
Karthikeyan Krishnasamy (3):
      ARM: dts: rockchip: Add i2c3 node for RV1126
      ARM: dts: rockchip: Add i2s0 node for RV1126
      ARM: dts: rockchip: Add pwm node for RV1126

 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi | 256 +++++++++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi         | 151 +++++++++++++++
 2 files changed, 407 insertions(+)



