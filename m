Return-Path: <SRS0=YUml=KH=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BABDC5478C
	for <soc@archiver.kernel.org>; Fri,  1 Mar 2024 16:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C932CC43142; Fri,  1 Mar 2024 16:05:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D054AC433F1;
	Fri,  1 Mar 2024 16:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D054AC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C10F71BF20C;
	Fri,  1 Mar 2024 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709309112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=7Tciyw/kQdq4GNWgXQIMkKj028oPMnhQ9lE4nVzxL7g=;
	b=pbswQajvdr7lcyXJNUJXw+QbKJTGHIlZfQRw7O5JZ+yWpySNBGlY1iFVBF5/7LMYZgvtpk
	30u14kIFd4gx932O+E1BkLala95Ru542kryZOrYWbWx69emaLz/DHSABzjgb07BNXb193D
	IFsIk8LZiRWLFjzL7HC+TIHc8aA/rg/sGZ+xeq2exqNw9myndQW1mGKYoPqiCcL9BFH+nm
	KApZ9/OtTZzxOkeXPUELBTQ1wvXuYwiOT0WwppgnxoVBr9Yzk4OtcD8RlDjc9mOelI9QE/
	gno2OUoCeN0KiYC1PNm6FkB3mOtXsmAHjWuLPzLVFtNNnHzWm+Z1Z7lADzlD6Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.9 (#1)
Date: Fri, 01 Mar 2024 17:05:11 +0100
Message-ID: <87cysehr9k.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt for mvebu for v6.9.

Gregory

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-6.9-1

for you to fetch changes up to 2f9086ef0a20b4751e7c5b40a46becd44c336106:

  arm: dts: marvell: clearfog-gtr-l8: align port numbers with enclosure (2024-03-01 16:35:13 +0100)

----------------------------------------------------------------
mvebu dt for 6.9 (part 1)

a38x: improve solidrun armada 388 clearfog GTR device support:

Initial device-tree merge for Clearfog GTR devices had issues causing
problems with sfp connectors. The fixes are:
 - Converted armada-38x dt-bindings to yaml and replaced invalid
   compatibles.
 - Added pinctrl nodes for all referenced gpios and removed invalid io
   from first sfp connector.
 - Added descriptions for secondary sfp connector and updated labels
   of dsa switch ports.

----------------------------------------------------------------
Josua Mayer (10):
      dt-bindings: marvell: a38x: convert soc compatibles to yaml
      dt-bindings: marvell: a38x: add solidrun armada 388 clearfog boards
      dt-bindings: marvell: a38x: add kobol helios-4 board
      dt-bindings: marvell: a38x: add solidrun armada 385 clearfog gtr boards
      arm: dts: marvell: clearfog: add pro variant compatible in legacy dts
      arm: dts: marvell: clearfog-gtr: add board-specific compatible strings
      arm: dts: marvell: clearfog-gtr: sort pinctrl nodes alphabetically
      arm: dts: marvell: clearfog-gtr: add missing pinctrl for all used gpios
      arm: dts: marvell: clearfog-gtr-l8: add support for second sfp connector
      arm: dts: marvell: clearfog-gtr-l8: align port numbers with enclosure

 .../devicetree/bindings/arm/marvell/armada-38x.txt | 27 -------
 .../bindings/arm/marvell/armada-38x.yaml           | 70 ++++++++++++++++++
 .../dts/marvell/armada-385-clearfog-gtr-l8.dts     | 38 +++++++---
 .../dts/marvell/armada-385-clearfog-gtr-s4.dts     |  2 +
 .../boot/dts/marvell/armada-385-clearfog-gtr.dtsi  | 84 ++++++++++++++++------
 arch/arm/boot/dts/marvell/armada-388-clearfog.dts  |  5 +-
 6 files changed, 167 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-38x.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-38x.yaml
