Return-Path: <SRS0=nQjB=CE=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDFAEB64D7
	for <soc@archiver.kernel.org>; Fri, 16 Jun 2023 12:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F07E2C433CA; Fri, 16 Jun 2023 12:59:42 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89B93C433C0;
	Fri, 16 Jun 2023 12:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89B93C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686920372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=i5pzZqE82Yd+EsjjRCej2HPoWrh5MR43bR4h+fV8q84=;
	b=GVIR0givqLwdHw3R4lAUy6mj7ybGnpWLMl4qBuuM7MHI+CAKPuXH/muIfGXLpq6gXUbBQ/
	Q5BDZHhfT6w7sn3XjoIcIS9OiYITT5HJ5Rc8Bup3ph3XssdFOzJqzJXjyiobqEvIKSD+5t
	plnQI6tYVBY8rm2qKnonULBchUtEKkw4xGCTIgTD4TyZ+o494wvUX3/xojxzrBY6kVwkYq
	bnNqT37ai/c1geMtBPWeEsSqEr4VsfVnWYW64E0TVXfRyB8v8+GoSBIiFFspiN3if2uVkk
	AwSWkbUXPZyFQrKmGwdb/UluyXK1fnzH/Ga8VJKeUn0GRzoT6hzvN5nAUotIXA==
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B701F24000E;
	Fri, 16 Jun 2023 12:59:30 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.5 (#1)
Date: Fri, 16 Jun 2023 14:59:30 +0200
Message-ID: <87a5wzh8b1.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt for mvebu for v6.5.

Gregory

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-6.5-1

for you to fetch changes up to dc393f1fdf22eda7255e99aadb400d8faaf3bdcf:

  ARM: dts: mvebu: align MTD partition nodes to dtschema (2023-06-16 13:55:18 +0200)

----------------------------------------------------------------
mvebu dt for 6.5 (part 1)

Add Endian 4i Edge 200 board (kirkwood based)
Add missing phy-modes on Armada 388 clearfog board
Replace deprecated spi-gpio properties on Armada XP
Align MTD partition nodes to dtschema for all mvebu boards

----------------------------------------------------------------
Chris Packham (1):
      ARM: dts: mvebu: align MTD partition nodes to dtschema

Fabio Estevam (1):
      ARM: dts: armada-xp: Replace deprecated spi-gpio properties

Pawel Dembicki (1):
      ARM: dts: kirkwood: Add Endian 4i Edge 200 board

Russell King (1):
      ARM: dts: armada388-clearfog: add missing phy-modes

 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/armada-385-atl-x530.dts       |  14 +-
 arch/arm/boot/dts/armada-388-clearfog.dts       |   7 +-
 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts |   4 +-
 arch/arm/boot/dts/kirkwood-4i-edge-200.dts      | 205 ++++++++++++++++++++++++
 5 files changed, 221 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/kirkwood-4i-edge-200.dts

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
