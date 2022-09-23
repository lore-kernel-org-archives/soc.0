Return-Path: <SRS0=awD+=Z2=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A65C6FA82
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 15:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E71FDC43140; Fri, 23 Sep 2022 15:41:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48F99C433D6;
	Fri, 23 Sep 2022 15:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48F99C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0A943FF807;
	Fri, 23 Sep 2022 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663947672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LOFCfohDpnYrndXvlrDTlXTTFQBAEp7WqO5o0hBuduA=;
	b=B5ikYdYxrZr/QZJSlWDhOjq2P2VGteKgEuTUt2w9yzqA+kQuBmdfuQsOASRzMHGSHmYnY6
	lUGJDu+MR9ErXareltP3YrGtyJpqgsLftue5xSODgR38Rd6mxAs9sOb17b7r2psbKUMGaW
	kyMjDkGH2Yy259gKA/ae6zpPHjDGbGlBUuc9QNYpoFmmh3xUwNkQn912a3r/ScuXJdmIKV
	etsa4c0ifvBdVpZYA4KzYqnwe6cvgMejQJnIHzoxCRyv+5kO7ZoZThbhSJfzAjgueVJ/HN
	x1hlCoruJRQzf6LiaOhYtGDz7Q4xLNzL1i1+Xs1YPjMQZ4HfQ0yaLoubZxWnrw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.1 (#1)
Date: Fri, 23 Sep 2022 16:41:09 +0100
Message-ID: <87h70yxfmy.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt64 for mvebu for v6.1.

Gregory

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.1-1

for you to fetch changes up to 2b14d382ec97ca5b420239ee6e16da390fab476c:

  arm64: dts: marvell: 98dx25xx: use correct property for i2c gpios (2022-09-02 18:11:28 +0200)

----------------------------------------------------------------
mvebu dt64 for 6.1 (part 1)

 - Add UART1-3 for AC5/AC5X SoC
 - Improve uDPU support (Aramda 3720 based board)
 - Add new eDPU based on uDPU

----------------------------------------------------------------
Chris Packham (2):
      arm64: dts: marvell: Add UART1-3 for AC5/AC5X
      arm64: dts: marvell: 98dx25xx: use correct property for i2c gpios

Robert Marko (10):
      dt-bindings: vendor-prefixes: add Methode Electronics
      dt-bindings: marvell: convert Armada 37xx compatibles to YAML
      arm64: dts: marvell: espressobin-ultra: add generic Espressobin compatible
      arm64: dts: marvell: uDPU: add missing SoC compatible
      arm64: dts: marvell: uDPU: align LED-s with bindings
      arm64: dts: marvell: uDPU: remove LED node pinctrl-names
      arm64: dts: marvell: rename temp sensor nodes
      arm64: dts: marvell: split Methode uDPU DTS
      dt-bindings: marvell: armada-37xx: add Methode eDPU compatible
      arm64: dts: marvell: add support for Methode eDPU

 .../bindings/arm/marvell/armada-37xx.txt           |  26 ----
 .../bindings/arm/marvell/armada-37xx.yaml          |  47 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      |  38 ++++-
 arch/arm64/boot/dts/marvell/armada-3720-eDPU.dts   |  14 ++
 .../dts/marvell/armada-3720-espressobin-ultra.dts  |   4 +-
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts   | 155 +-------------------
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi  | 160 +++++++++++++++++++++
 9 files changed, 262 insertions(+), 185 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-eDPU.dts
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
