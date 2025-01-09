Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFB24A1A
	for <soc@lists.linux.dev>; Thu,  9 Jan 2025 22:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736462892; cv=none; b=Hb9y763E6QwcYtiNecpTrxWtmTbCrzB37E+YxZK8biSvM2GdvsF1qWL3DvBmqGC9uMN0MEBijbQyil2mIm0+7FkfpyMHYgjjunGJhxWn2qH2JwStvPPiW8BNHtVh9DIQJyoWI3ax91Hs19M0FhFNf6DZ1gKXu+za8VoLnaJWVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736462892; c=relaxed/simple;
	bh=hzp/epZwqHQdLKQHRQ8aEtFi9PPvpMrlLjzgTmHUt+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXb/rnD4DIaVtciw0rixW0FnFtCTVK3qfo1kRVynaPpHWFCFowQHIk1vC8WD83w/2KbXSopDRJ0EM4Zly5923CINQt3DlHxl1MTrRrUysfkIsL18V0wSYhI+nx1fi02jMi/zcNoAcA5iEmLE3KsEdXN4Ik9mWr/29hAiY4TUKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ovFziUVV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ovFziUVV"
Received: by smtp.kernel.org (Postfix)
	id B75F5C4CEE1; Thu,  9 Jan 2025 22:48:11 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B036C4CED2;
	Thu,  9 Jan 2025 22:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B036C4CED2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 00F41C001A13;
	Thu,  9 Jan 2025 14:48:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 00F41C001A13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1736462882;
	bh=hzp/epZwqHQdLKQHRQ8aEtFi9PPvpMrlLjzgTmHUt+4=;
	h=From:To:Cc:Subject:Date:From;
	b=ovFziUVVOYKOtnEToSdKAWOzaqdwuL8WH5doV1uaC+iBccwBWC/eOqMtQxj6kCos6
	 4nyNQcVuH9tZFBvoVRM2QVmir0mjeVPYcDVAFUbvMMLQpdGYptTlpTW97ZUkhHEFTu
	 ZQCNGVEDQ9YdVx8qs0II3xWiIhnOVXwqVS3ZcZl4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 9827818041CAC6;
	Thu,  9 Jan 2025 14:48:01 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree changes for 6.14
Date: Thu,  9 Jan 2025 14:47:55 -0800
Message-ID: <20250109224756.3632025-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree

for you to fetch changes up to f167292c8d13d31cbe9ffaa8108edcb4e8b1c60f:

  ARM: dts: meraki-mr26: set mac address for gmac0 (2024-12-17 10:23:28 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree updates
for 6.14, please pull the following:

- Rob removes some unused and undocumented properties pertaining to the
  SPI flash controller on Broadcom boards

- Linus adds a number of BCM6846 peripherals: HWRNG, watchdog, GPIO,
  MDIO, LED controller, DMA and then proceeds with adding support for
  the GEnexsis XG6846B PON router

- Rosen sets the MAC address NVMEM reference on the Meraki MR26 platform

----------------------------------------------------------------
Linus Walleij (9):
      ARM: dts: bcm6846: Add iproc rng
      ARM: dts: bcm6846: Enable watchdog
      ARM: dts: bcm6846: Add GPIO blocks
      ARM: dts: bcm6846: Add MDIO control block
      ARM: dts: bcm6846: Add LED controller
      ARM: dts: bcm6846: Add ARM PL081 DMA block
      dt-bindings: vendor-prefixes: Add Genexis
      dt-bindings: arm: bcmbca: Add Genexis XG6846B
      ARM: dts: broadcom: Add Genexis XG6846B DTS file

Rob Herring (Arm) (1):
      arm: dts: broadcom: Remove unused and undocumented properties

Rosen Penev (1):
      ARM: dts: meraki-mr26: set mac address for gmac0

 .../devicetree/bindings/arm/bcm/brcm,bcmbca.yaml   |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/broadcom/Makefile                |   1 +
 .../arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts |  20 ++
 .../dts/broadcom/bcm53340-ubnt-unifi-switch8.dts   |   1 -
 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  | 244 +++++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            | 120 ++++++++++
 arch/arm/boot/dts/broadcom/bcm953012hr.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm953012k.dts          |   1 -
 arch/arm/boot/dts/broadcom/bcm958522er.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958525er.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958525xmc.dts        |   1 -
 arch/arm/boot/dts/broadcom/bcm958622hr.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958623hr.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958625hr.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958625k.dts          |   1 -
 arch/arm/boot/dts/broadcom/bcm988312hr.dts         |   1 -
 17 files changed, 388 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
