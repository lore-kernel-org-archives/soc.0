Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FC4322DC0
	for <soc@lists.linux.dev>; Thu, 11 Sep 2025 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596029; cv=none; b=S46VcBoZrQEi0K1bgRtfvEQ3pdpGpzm746F25iGPhevH3+HS1Aa1RFFaGDy+vggS1+XFgn2zNtd1rWhKxxgnRWitDABpq5iSX2Nms+lrHdF5umR+lOrxxO8elbL8Cd3/dHh3y9WtP2waMG2LxrBcIvD2ZYoigTHAMXqJpsxJxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596029; c=relaxed/simple;
	bh=96Jo2OM+eBPpT8kKW/qCZKj26J6puMVroHTCm7h9Q+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVftYHhVCS2hS9amKY1bHcFVdktjVADR83DaDvXR8YAVog1dRR9rnmdHnVQhTgjUoaPEro2SXWehBuFrxCn3uu6Fi8Yzi5hw5H3Yzyciy+PKAkdMzpKD9fd4QaJnYUe9U2wxIVVvUqFnOkQqr8GIKOcFGITzkRqINGOF33CFy3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Qloo6V9E; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Qloo6V9E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Qloo6V9E";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Qloo6V9E"
Received: by smtp.kernel.org (Postfix)
	id 845C3C4CEF7; Thu, 11 Sep 2025 13:07:08 +0000 (UTC)
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4B5EC4CEF0;
	Thu, 11 Sep 2025 13:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4B5EC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757596018; bh=96Jo2OM+eBPpT8kKW/qCZKj26J6puMVroHTCm7h9Q+0=;
	h=From:To:Cc:Subject:Date:From;
	b=Qloo6V9Eb/VNX5GTPe7EOoPtScJ4UkOLfW41AhspcpIXxuLCisJXA1LH3hufZUbLr
	 V4lnNOWtP4RfeyiRyFynhbeDXIAMx/z84RSGvV6mGfeR8a6clL3FtTwcBRXjhTo/n3
	 zcJVUI2f+ROCVzwnggMwj7ytWJzMq4EV3xZjKhMdklnpthOyO9HW+pCbvx2DnFBL6x
	 vNMQgm5r1M1+axqfdz+oFKtYlJdiNJHHwsuUQ8BZtKIlgS7bblYeoB5rxAn76O/urS
	 QY4NH0+CvArrCbvXWaVy8UcCxp8YhrjbgFcCdt9Ag8//oS5cDC0lpqdTIJyFGr4S7h
	 oH43F9pXG+nrw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 270B83D3AEA;
	Thu, 11 Sep 2025 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757596018; bh=96Jo2OM+eBPpT8kKW/qCZKj26J6puMVroHTCm7h9Q+0=;
	h=From:To:Cc:Subject:Date:From;
	b=Qloo6V9Eb/VNX5GTPe7EOoPtScJ4UkOLfW41AhspcpIXxuLCisJXA1LH3hufZUbLr
	 V4lnNOWtP4RfeyiRyFynhbeDXIAMx/z84RSGvV6mGfeR8a6clL3FtTwcBRXjhTo/n3
	 zcJVUI2f+ROCVzwnggMwj7ytWJzMq4EV3xZjKhMdklnpthOyO9HW+pCbvx2DnFBL6x
	 vNMQgm5r1M1+axqfdz+oFKtYlJdiNJHHwsuUQ8BZtKIlgS7bblYeoB5rxAn76O/urS
	 QY4NH0+CvArrCbvXWaVy8UcCxp8YhrjbgFcCdt9Ag8//oS5cDC0lpqdTIJyFGr4S7h
	 oH43F9pXG+nrw==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 9F3EF380DFB;
	Thu, 11 Sep 2025 13:06:57 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [GIT PULL] NXP LPC device tree changes for v6.18
Date: Thu, 11 Sep 2025 16:06:42 +0300
Message-ID: <20250911130642.41958-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250911_130658_177922_0EC065BB 
X-CRM114-Status: GOOD (  11.71  )

Hi Arnd,

I kindly ask you to pull the next changes.

It's been awhile since the last NXP LPC32xx and NPX LPC18xx/LPC43xx pull
request, fortunately today's Linux runs on the platforms with no issues.

Best wishes,
Vladimir


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/vzapolskiy/linux-lpc32xx tags/lpc32xx-dt-for-6.18

for you to fetch changes up to d2dab63098bde9a6373eeb4672df806ad62a12da:

  ARM: dts: lpc32xx: Correct PL080 DMA controller device node name (2025-09-11 03:30:27 +0300)

----------------------------------------------------------------
ARM: nxp: lpc: device tree updates for v6.18

This pull request contains device tree changes for ARM NXP LPC32xx and
ARM NXP LPC18xx/LPC43xx for v6.18, please pull the following:

- Frank fixes a multitude of device tree checker warnings reported for
  NXP LPC18xx/LPC43xx powered boards,
- Vladimir fixes a number of compile time warnings issued by a dt checker
  for NXP LPC32xx powered boards,
- Vladimir replaces Roland as a maintainer of NXP LPC32xx platform
  device trees, Roland is inactive for more than 10 years.

----------------------------------------------------------------
Frank Li (11):
      ARM: dts: lpc18xx: rename node name flash-controller to spi
      ARM: dts: lpc18xx: rename node name mmcsd to mmc
      ARM: dts: lpc4350-hitex-eval: change node name flash to flash@0
      ARM: dts: lpc18xx: swap clock-names bic and cui
      ARM: dts: lpc: add #address-cells and #size-cells for sram node
      ARM: dts: lpc: add cfg surfix in pinctrl child node
      ARM: dts: lpc4357-myd-lpc4357: add power-supply for innolux,at070tn92
      ARM: dts: lpc: change node name 'button[0-9]' to button-[0-9]'
      ARM: dts: lpc4357-myd-lpc4357: change node name mdio0 to mdio
      ARM: dts: lpc18xx: add #address-cell and #szie-cell for spi flash controller
      ARM: dts: lpc18xx: add missed arm,num-irq-priority-bits

Vladimir Zapolskiy (7):
      dt-bindings: arm: nxp: lpc: Assign myself as maintainer of NXP LPC32xx platforms
      ARM: dts: lpc32xx: Set motor PWM #pwm-cells property value to 3 cells
      ARM: dts: lpc32xx: Correct motor PWM device tree node name
      ARM: dts: lpc32xx: Correct SD/MMC controller device node name
      ARM: dts: lpc32xx: Specify a precise version of the SD/MMC controller IP
      ARM: dts: lpc32xx: Specify #dma-cells property of PL080 DMA controller
      ARM: dts: lpc32xx: Correct PL080 DMA controller device node name

 .../devicetree/bindings/arm/nxp/lpc32xx.yaml       |  2 +-
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi             | 14 ++++++++++----
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             | 11 ++++++-----
 arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts         |  6 +++---
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts   | 22 +++++++++++++---------
 arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi             |  9 +++++++++
 .../arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts | 21 +++++++++++----------
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  6 ++++--
 arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi             |  9 +++++++++
 9 files changed, 66 insertions(+), 34 deletions(-)
