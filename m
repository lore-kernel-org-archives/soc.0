Return-Path: <SRS0=IP8z=OF=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BADC3271E
	for <soc@archiver.kernel.org>; Fri,  5 Jul 2024 16:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29599C4AF0B; Fri,  5 Jul 2024 16:59:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BECF8C116B1;
	Fri,  5 Jul 2024 16:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BECF8C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8D67FF805;
	Fri,  5 Jul 2024 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720198764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=IEr/zNIlX4daBHw3vK6huLQdCOaNmFjAaao7GLDdT9I=;
	b=Wlp9UAaG+d8aWl1dFqejvc3seWFpyZcmho1tfhf3bwXBBzI+QRL/IajIGjmCYvUdHmhol5
	M7x6RTkFeldz2Us2oPI4l8QBKntRvZLa1h7HcdObutQu7GVyIwBIY1mxd6cpbahPzHW9nu
	zSEgl5DmadJ2IpWADo6slDpcxPQiBu0K0hnDCtDv4I2tjffrc1wzZOzhz0xNmfPC0zJFzs
	y4QjeB0tpmBsNfq+DuNbIiY1TLVwXNrS69+eTLNxcQBUOuk/T5ahjvOjTn/1ZEozKu/OMC
	RKK0hPluboAI7zpNKqEpFbmcTsEkVOZ7h3MVFn8Pi0D7JqeBiVDLvcWMdQnLSA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.11 (#1)
Date: Fri, 05 Jul 2024 18:59:16 +0200
Message-ID: <87wmlzixln.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt64 for mvebu for v6.11.

Gregory

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.11-1

for you to fetch changes up to e9ff907f40768351a3a86f5aa9b819436ee0ef19:

  arm64: dts: add description for solidrun cn9132 cex7 module and clearfog board (2024-07-05 14:53:16 +0200)

----------------------------------------------------------------
mvebu dt64 for 6.11 (part 1)

armada-3720: align GPIO keys and LED node namee with bindings
Add description for solidrun cn9130 som and clearfog boards

----------------------------------------------------------------
Josua Mayer (5):
      dt-bindings: arm64: marvell: add solidrun cn9130 som based boards
      dt-bindings: arm64: marvell: add solidrun cn9132 CEX-7 evaluation board
      arm64: dts: add description for solidrun cn9130 som and clearfog boards
      arm64: dts: add description for solidrun cn9131 solidwan board
      arm64: dts: add description for solidrun cn9132 cex7 module and clearfog board

Krzysztof Kozlowski (2):
      arm64: dts: armada-3720: align GPIO keys node name with bindings
      arm64: dts: armada-3720: align LED node name with bindings

 .../bindings/arm/marvell/armada-7k-8k.yaml         |  18 +
 arch/arm64/boot/dts/marvell/Makefile               |   4 +
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |   8 +-
 arch/arm64/boot/dts/marvell/cn9130-cf-base.dts     | 178 ++++++
 arch/arm64/boot/dts/marvell/cn9130-cf-pro.dts      | 375 +++++++++++
 arch/arm64/boot/dts/marvell/cn9130-cf.dtsi         | 197 ++++++
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     | 160 +++++
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 637 ++++++++++++++++++
 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts    | 673 +++++++++++++++++++
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi    | 712 +++++++++++++++++++++
 10 files changed, 2958 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-cf-base.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-cf-pro.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-cf.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
