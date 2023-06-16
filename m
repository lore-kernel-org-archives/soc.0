Return-Path: <SRS0=nQjB=CE=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8D8EB64D7
	for <soc@archiver.kernel.org>; Fri, 16 Jun 2023 13:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AF4B2C433C9; Fri, 16 Jun 2023 13:01:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFF54C433C8;
	Fri, 16 Jun 2023 13:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFF54C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686920494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=+Vqk6EUzp/JcaHYL1WybIBQcsTgJzV+jgJIrymzDDMg=;
	b=ERexkclTiHCmhcus1l2KRHo5F6PpZp5LwQjn6jrcsvwm7HBVScd/mC2gR2nzvjgCnk8JNs
	2X+PBGEL42qERiZIcDdclKVczevcaI17qr3tUrR4R6EWMhBu9XXisPUXsqFPHnbV1kTfHB
	d1hkWME+RyegS9ZW+NVxBzL4b+7XA7c1OxWgJYkcQmBxBr09NAgmzQr/bd0toyrnkdY67m
	1dZs1u0+no+aR4TIEO5G2zfP7e4YSO4dXFQqssdb0uNJY0O7kPLblGdOAtuIsO1SYEATHt
	dmtB4rJUzMwEyg/Whf/PahIJLpxUcAZl5laroM/TF98ppRKZSsoZEafAJvSqNg==
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C42BE000D;
	Fri, 16 Jun 2023 13:01:34 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.5 (#1)
Date: Fri, 16 Jun 2023 15:01:33 +0200
Message-ID: <877cs3h87m.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt64 for mvebu for v6.5.

Gregory

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.5-1

for you to fetch changes up to 0ee03b8c8576bf00bd65e60f9a6bb49ca17102ae:

  arm64: dts: marvell: Fix espressobin-ultra boot failure and wifi (2023-06-16 14:05:18 +0200)

----------------------------------------------------------------
mvebu dt64 for 6.5 (part 1)

Few improvements following the dt bindings:
 - add missing cache properties
 - fix nand_controller node name according to YAML
 - fix pca954x i2c-mux node names

Fix espressobin-ultra boot failure and wifi for EspressoBIN Ultra
(Armada 3720)

----------------------------------------------------------------
Ben Schneider (1):
      arm64: dts: marvell: Fix espressobin-ultra boot failure and wifi

Geert Uytterhoeven (1):
      arm64: dts: marvell: Fix pca954x i2c-mux node names

Krzysztof Kozlowski (1):
      arm64: dts: marvell: add missing cache properties

Vadym Kochan (1):
      arm64: dts: marvell: cp11x: Fix nand_controller node name according to YAML

 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi                 | 1 +
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts | 3 +++
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi            | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts       | 2 +-
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi            | 1 +
 arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi            | 2 ++
 arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi            | 2 ++
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi                 | 2 +-
 8 files changed, 12 insertions(+), 3 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
