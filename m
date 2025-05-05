Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065D2CA8
	for <soc@lists.linux.dev>; Mon,  5 May 2025 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464326; cv=none; b=TWYJSPy21CuOy7YcPq9x4xo/8B23Ap282VN2p7d69FxcB7i4M8QRvTtgx6DoMpyq7JrC8ewPtEGkvSbdcNWIyTsw3YfLyJDy5kNby5QSHBBVq0Ppfi0RioSTaUk852LBBXKtuKnp1U1vfgJVHHRPyvBdkP05bPiwsh41uxaE/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464326; c=relaxed/simple;
	bh=VR/e5N/N0mAjQT36mtOi1fbFG72D0Pi7WWTtR1xdj24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sK9LokMQhOPpMsvFHRZPfbKt72pomRgHlUT/LzsUO5D5xVIW5ON93d+LauXPKGC9Qms+1ozdNhSyru0NqjKWASZfU15QvXPTYwPBF5qhf3Ie94wV7eFs9u6+lxJc7zBgwO8+gdpgxtnQENhx1ecIcLm6HwVAVbm9ICPW963ypPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IfVFu6PT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IfVFu6PT"
Received: by smtp.kernel.org (Postfix)
	id 26ABFC4CEEE; Mon,  5 May 2025 16:58:45 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A503C4CEE4;
	Mon,  5 May 2025 16:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A503C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 38806C0005C3;
	Mon,  5 May 2025 09:58:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 38806C0005C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746464322;
	bh=VR/e5N/N0mAjQT36mtOi1fbFG72D0Pi7WWTtR1xdj24=;
	h=From:To:Cc:Subject:Date:From;
	b=IfVFu6PTJyocwWziFhE34742gK6Gil++QXKFqrSHNAVfnwTRkjegs30MwLXuaTQkB
	 EN12U6MsPksytF2mp6Ziyp6roOAvMaBlhKFBzlFq2q5U5jQ49bibZERSkKmC5YbZFg
	 O5KjRpEoqPyZnEMVt3wSYwFf4U5Pr3LjKAtkBZ5A=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D521B18000847;
	Mon,  5 May 2025 09:58:11 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Artur Weber <aweber.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/3] Broadcom devicetree changes for 6.16
Date: Mon,  5 May 2025 09:58:08 -0700
Message-ID: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/devicetree

for you to fetch changes up to 959886105a40a3ba94fa396aca83e1083a2056ab:

  arm64: dts: bcm: Add reference to RPi 2 (2nd rev) (2025-05-05 09:45:07 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoC Device Tree changes
for 6.16, please pull the following:

- Arthur adds a pinctrl node for BCM21664 and updates BCM23550 to use
  it, he also drops the DTS file for the BCM59056 PMU chip and leaving
  that board level DTS files

- Stefan documents and adds support for the Raspberry Pi 2 2nd revision.

----------------------------------------------------------------
Artur Weber (3):
      ARM: dts: bcm2166x-common: Add pinctrl node
      ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
      ARM: dts: Drop DTS for BCM59056 PMU

Stefan Wahren (3):
      dt-bindings: arm: bcm2835: Add Raspberry Pi 2 (2nd rev)
      ARM: dts: bcm: Add support for Raspberry Pi 2 (2nd rev)
      arm64: dts: bcm: Add reference to RPi 2 (2nd rev)

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   1 +
 arch/arm/boot/dts/broadcom/Makefile                |   2 +
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |   7 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi   | 297 +++++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |  68 +++--
 arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts     | 130 +++++++++
 arch/arm/boot/dts/broadcom/bcm59056.dtsi           |  91 -------
 arch/arm64/boot/dts/broadcom/Makefile              |   1 +
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-2-b.dts   |   2 +
 9 files changed, 472 insertions(+), 127 deletions(-)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts
 delete mode 100644 arch/arm/boot/dts/broadcom/bcm59056.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-2-b.dts
