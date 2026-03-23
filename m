Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10892E8B98
	for <soc@lists.linux.dev>; Mon, 23 Mar 2026 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292574; cv=none; b=accfKXxOYWVGLyHLTsrJJu1dB4bdwIN9pNxAxx6exT4e3Q+altSbzl4RyjR2gveAdrlRD9iOqEfygAHHDxJxuJezUSNqhJ9yXjfdC6y6rD3H9dC3ekqkUqAWItCGVrHt9uRW04sIpB0gSx5Bn+UP7I+/OsbNby9aYWZkle2U1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292574; c=relaxed/simple;
	bh=mxwtyI0DqCyBUUMSy2sNcEfaamTmrYvEIXx8FmM3rHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mGworPlBH3iX4dn48j3oR5jeferJNw+l9493/QKqjQRIg17Kqno1mbXiauNmsnRHHXbaqPX2hxutyaljdvWu6TVZ/cjXPvtKsOBBY1aQ1fxxmcN1rPfC/6tGUbGMnoH7NUkxgimTD2RCxoLg7BzWlpVpKBiIuLjuGphvl70xwgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WSZuHleM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WSZuHleM"
Received: by smtp.kernel.org (Postfix)
	id A93CAC2BCB0; Mon, 23 Mar 2026 19:02:54 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp12.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6AC7C4CEF7;
	Mon, 23 Mar 2026 19:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6AC7C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C7288C0004A8;
	Mon, 23 Mar 2026 12:02:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C7288C0004A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774292565;
	bh=mxwtyI0DqCyBUUMSy2sNcEfaamTmrYvEIXx8FmM3rHw=;
	h=From:To:Cc:Subject:Date:From;
	b=WSZuHleMUxT3bgdFdkeb0g8J7qKtOuAVhtYIf7azbNJbNZGbfqeQxdqjaJ28qRYY2
	 nI9i+JBzf2xIuVESYoH/h3y61nUNzfGBzxNvnImI7pbT7ZXZ5+valC3UmCmhA9duNG
	 cVCTdmykUxZqpX1bMay6LA945TjKOQW0P1I6lFqs=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 6B8A0A83;
	Mon, 23 Mar 2026 12:02:45 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	William Zhang <william.zhang@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree changes for 7.1
Date: Mon, 23 Mar 2026 12:02:38 -0700
Message-ID: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree

for you to fetch changes up to 220bdfcb4b4788f57faa2c28454d8b2dd3bcab6c:

  ARM: dts: BCM5301X: EA9200: specify partitions (2026-03-20 16:57:31 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree updates
for 7.1, please pull the following:

- Rafal provides a complete description of the PCIe Root Complex nodes
  in order to silence a number of dtc warnings

- Rosen provides the necessary NVMEM properties to allow describing the
  WAN device MAC address from NVRAM, also adds better LEDs, USB GPIOs
  and Wi-Fi buttons for the Linksys EA9200 router

- Linus completes the BCA devices description by adding the I2C block
  and fixing interrupts for the DMA block on 63138 and 6878

----------------------------------------------------------------
Linus Walleij (7):
      ARM: dts: bcm6878: Fix PL081 DMA block IRQ
      ARM: dts: bcm63138: Fix DMA IRQ
      ARM: dts: bcm6846: Add I2C bus block
      ARM: dts: bcm6855: Add I2C bus blocks
      ARM: dts: bcm6878: Add I2C bus block
      ARM: dts: bcm63138: Add I2C block
      ARM: dts: bcm63148: Add I2C block

Miquel Raynal (1):
      ARM: dts: BCM5301X: Drop extra NAND controller compatible

Rafał Miłecki (1):
      ARM: dts: BCM5301X: Describe PCIe controllers fully

Rob Herring (Arm) (1):
      ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus nodes to root level

Rosen Penev (9):
      ARM: dts: BCM5301X: add root pcie bridges
      ARM: dts: BCM5301X: EA9200: set WAN MAC from nvram
      ARM: dts: BCM5301X: panamera: set WAN MAC from nvram
      ARM: dts: BCM5301X: AC3100: set WAN MAC from nvram
      ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
      ARM: dts: BCM5301X: EA9200: add WiFi button
      ARM: dts: BCM5301X: EA9200: add USB GPIOs
      ARM: dts: BCM5301X: EA9200: add LEDs
      ARM: dts: BCM5301X: EA9200: specify partitions

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi             |  58 +++++++++++-
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi     |   7 +-
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        |  16 ++--
 .../boot/dts/broadcom/bcm4709-linksys-ea9200.dts   | 100 +++++++++++++++++++++
 .../boot/dts/broadcom/bcm4709-netgear-r8000.dts    |  73 +++++++--------
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi |   7 ++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts  |   3 +
 .../dts/broadcom/bcm47094-linksys-panamera.dts     |   7 ++
 .../boot/dts/broadcom/bcm47094-luxul-xap-1610.dts  |  36 ++------
 .../dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts    |  36 ++------
 arch/arm/boot/dts/broadcom/bcm63138.dtsi           |  11 ++-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi           |  11 ++-
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |   9 ++
 arch/arm/boot/dts/broadcom/bcm6855.dtsi            |  18 ++++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi            |  11 ++-
 15 files changed, 289 insertions(+), 114 deletions(-)
