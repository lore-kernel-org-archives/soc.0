Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F65643151
	for <soc@lists.linux.dev>; Mon, 30 Jun 2025 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310152; cv=none; b=h44DX+creIRo0iEiZUN7b7yoVVw8VvSuJ6AQqZBIKBhhgd8BWK+r5I4AON6dlJcbpMgs4jVMNShDEoX+SgGvSVVxDpbBU3CA5qSa2Z+EKVtVH73UyJYesCymcOqT49h9pjhl4XFp2d+TWq4qMR2fTz9Z+So4AyYrxWlHGZt3wG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310152; c=relaxed/simple;
	bh=AbK9hehWKP1ojh2cXx15qNWNQKke9TeRZzgIfQP3KYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIbI4+oXywVYyFiVjWDS6qelS+vA6Po0Jx8+6ZEkkLvPy5H2f/G94pkWGNbW82whdnwQA2mM9BC9iNoX5lYtfdUQmtByVvZRR6BVZgATX65Rj9EI51zj92x94eh633lz/oAu8WO+qXL6SCqejO7bqLju1I2lFW/nfPLDUP/GRv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CxPRDHXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CxPRDHXu"
Received: by smtp.kernel.org (Postfix)
	id 38718C4CEE3; Mon, 30 Jun 2025 19:02:31 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72646C4CEEB;
	Mon, 30 Jun 2025 19:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72646C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4577AC0008F3;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4577AC0008F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=AbK9hehWKP1ojh2cXx15qNWNQKke9TeRZzgIfQP3KYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CxPRDHXuMUeCsceZi/W8AOWEWBa0qtCsl14WFNXHmF/YwOKM9ovWZ9MCFOrZScKmU
	 DkO+2bmuVZPR7v9fZNQj0dfP+DkTB+mP5WZc+0H9P38+YjGFPelJt1evNsvTREPoYS
	 2De249x5hUyOTtrcXqfkNHxiWWgBB9cM4RgxhPPw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 1C88418000853;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/5] Broadcom devicetree-arm64 changes for 6.17
Date: Mon, 30 Jun 2025 12:02:14 -0700
Message-ID: <20250630190216.1518354-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/devicetree-arm64

for you to fetch changes up to 657e413c277898f0ff91922475c67d82faaeeef7:

  arm64: dts: broadcom: northstar2: Drop GIC V2M "interrupt-parent" (2025-06-10 10:49:57 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 6.17, please pull the following:

- Linus updates the 64-bit BCMBCA SoCs Device Tree with the common
  peripherals that exit as well as correct IRQ assignments

- Andrea adds support for the RP1 companion chip on the Raspberry Pi 5
  systems with clocks, gpios, pinctrl, all of that using an overlay to
  describe those peripherals

- Rob drops the interrupt-parent property from the GICv2M node on
  Northstar2 SoCs

----------------------------------------------------------------
Andrea della Porta (7):
      dt-bindings: clock: Add RaspberryPi RP1 clock bindings
      dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
      dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
      arm64: dts: rp1: Add support for RaspberryPi's RP1 device
      arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
      arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
      arm64: dts: broadcom: Add overlay for RP1 device

Linus Walleij (4):
      ARM64: dts: bcm4908: Add BCMBCA peripherals
      ARM64: dts: bcm6856: Add BCMBCA peripherals
      ARM64: dts: bcm6858: Add BCMBCA peripherals
      ARM64: dts: bcm63158: Add BCMBCA peripherals

Rob Herring (Arm) (1):
      arm64: dts: broadcom: northstar2: Drop GIC V2M "interrupt-parent"

 .../bindings/clock/raspberrypi,rp1-clocks.yaml     |  58 ++++++
 .../devicetree/bindings/misc/pci1de4,1.yaml        | 137 ++++++++++++++
 .../bindings/pinctrl/raspberrypi,rp1-gpio.yaml     | 198 +++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/Makefile              |   4 +-
 .../boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 121 +++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   | 111 ++----------
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi   | 116 +++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi  | 129 ++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi   | 130 +++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi   | 119 ++++++++++++-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |   8 -
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       |  42 +++++
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi        |  14 ++
 arch/arm64/boot/dts/broadcom/rp1.dtso              |  11 ++
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h |  61 +++++++
 15 files changed, 1145 insertions(+), 114 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h
