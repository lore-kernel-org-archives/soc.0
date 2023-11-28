Return-Path: <SRS0=Yuoh=HJ=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF979C07E97
	for <soc@archiver.kernel.org>; Tue, 28 Nov 2023 23:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B293C433D9; Tue, 28 Nov 2023 23:25:16 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F439C433C8
	for <soc@kernel.org>; Tue, 28 Nov 2023 23:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F439C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id E68CD379440
	for <soc@kernel.org>; Tue, 28 Nov 2023 23:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hnfnlU8_GMH for <soc@kernel.org>;
	Wed, 29 Nov 2023 00:26:45 +0100 (CET)
Received: from werkpc.lan (87-101-2-254.dsl.cambrium.nl [87.101.2.254])
	by mail.rnplus.nl (Postfix) with ESMTPSA id B3145379289;
	Wed, 29 Nov 2023 00:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1701214001; bh=G3JB671WawIpbUjjbrLf8COupnjT/0gEiSIXdRR+XLM=;
	h=From:To:Subject:Date;
	b=EgnkeBuDR0Tw+njhvtrf3miCyHthsJ+NqYbR0NY4u/ES2+I9u44o4HPuAnsWbKH6R
	 TXXczAkAJPjKYWTTj0ZRXZtTpf3xuCqp4DRDuFkQmAAE8//ZbDj3OZH7WtiLxqpfQn
	 SbhAerfJ9/PGdj0FGxfdM3c+jbd3uanlNieu7szY=
From: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	renze@rnplus.nl
Subject: [PATCH v2 0/2] ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
Date: Wed, 29 Nov 2023 00:23:15 +0100
Message-ID: <20231128232456.2932350-1-renze@rnplus.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

These patches add a device-tree (and a bindings update) for the
Aspeed BMC on the ASRock X570D4U, so that it can be added as a
supported OpenBMC platform.

Changes since v1:
  - Fixed indentation
  - Added "aspeed,ast2500" compatible
  - Switched to lower case hex values
  - Added function and color attributes to the LEDs
  - Renamed LEDs to led0 and led1
  - Removed hogging of output-bmc-ready GPIO (should be set from userland instead)
  - Get MAC addresses of the ethernet interfaces from the FRU EEPROM
  - Add descriptions to the busses exposed by the I2C switch (i2c-1@70)
  - Add blank lines between nodes in fan section
  - Drop bootargs from chosen section

Greetings,
Renze Nicolai

Renze Nicolai (2):
  dt-bindings: arm: aspeed: add Asrock X570D4U board
  ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 359 ++++++++++++++++++
 3 files changed, 361 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts

-- 
2.43.0

