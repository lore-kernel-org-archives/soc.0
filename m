Return-Path: <SRS0=RoS7=H7=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DF6C3DA6E
	for <soc@archiver.kernel.org>; Wed, 20 Dec 2023 16:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA35FC433CA; Wed, 20 Dec 2023 16:55:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B981C433C8;
	Wed, 20 Dec 2023 16:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B981C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A5A5E0002;
	Wed, 20 Dec 2023 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703091323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ts3kU1s2hQf45Pt2tVsF5xHK/RVGwLlDmAAzyiW8e5I=;
	b=KzOczP5iwE1WbPHTE6uu7aApico3UOB9c4odGzJ4ci7fymnF6FLoeBYjgewD8Fzg3AGzQ6
	UmY+omlNiew93ERZHXnpYCt69GIBfiL1NFDTn0SQHseYmetTNSTHGpRhm3GHIxGQrJCDcm
	dVXibNVaJ2ok763P6+nKCyWLvCB6E+EidxBcPRiMwwheW+ZeBMtdVzswZlB8R4zlcI5s7d
	UulfArTo+O47YMJ5yXt6Q2X3hVcc6KCdBjtwWjN5lxZTfLoQskaiS2FypMfTlrFVVKd/n6
	RjRdOstS8z3QMbTEMVPEX7h3RBGTgBZBPe+R5Etcc8QtuKbsUU+6zTK1mUde9Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.8 (#1)
Date: Wed, 20 Dec 2023 17:55:22 +0100
Message-ID: <87le9obypx.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt64 for mvebu for v6.8.

Gregory

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.8-1

for you to fetch changes up to c11e7732a90c21155de8db40dbba84f043520821:

  arm64: dts: cn913x: add device trees for COM Express boards (2023-12-15 15:51:33 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.8 (part 1)

Add devices tree for CN9130 and CN9131 COM Express Boards
Fix device tree for Turris Mox and for switch nodes

----------------------------------------------------------------
Elad Nachman (3):
      MAINTAINERS: add ac5 to list of maintained Marvell dts files
      dt-bindings: arm64: add Marvell COM Express boards
      arm64: dts: cn913x: add device trees for COM Express boards

Linus Walleij (2):
      ARM64: dts: marvell: Fix some common switch mistakes
      ARM64: dts: Add special compatibles for the Turris Mox

Sjoerd Simons (1):
      arm64: dts: armada-3720-turris-mox: set irq type for RTC

 .../bindings/arm/marvell/armada-7k-8k.yaml         |  22 +++++
 MAINTAINERS                                        |   3 +-
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/ac5x-rd-carrier-cn9131.dts    |  44 +++++++++
 arch/arm64/boot/dts/marvell/ac5x-rd-carrier.dtsi   |  34 +++++++
 .../dts/marvell/armada-3720-espressobin-ultra.dts  |  14 +--
 .../boot/dts/marvell/armada-3720-espressobin.dtsi  |  20 ++--
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |  20 ++--
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  99 ++++++++++---------
 .../boot/dts/marvell/armada-7040-mochabin.dts      |  24 +++--
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |  22 ++---
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi        |  42 ++++----
 .../boot/dts/marvell/cn9130-db-comexpress.dtsi     |  96 ++++++++++++++++++
 .../boot/dts/marvell/cn9131-db-comexpress.dtsi     | 108 +++++++++++++++++++++
 14 files changed, 428 insertions(+), 121 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dts
 create mode 100644 arch/arm64/boot/dts/marvell/ac5x-rd-carrier.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
