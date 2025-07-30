Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407281DFD96
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 20:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753909080; cv=none; b=gcM10aMkB+jsBTeA0DEQsGEazlYwk/TyEeI15WXNhFN9kbXrpAkI8eohhj1JZdyv3dXf5q3oXqvUAAZjwd1Q19hlYffCzQrjegjk57mmlM2rtGBXLPIj1DkvwFYPLpgXJzmjJJ3E4G6XEZQY+NwOhaCWTMXQ3Or7avWheOlt25E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753909080; c=relaxed/simple;
	bh=echyi2c3urhSqgs7glAWZFtXGzhcRzbjLt58B4Kxebo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JDHx7PtMETF2ruGlZIDZcX42JhZ4g9GoXECH6CmWj2Sghp2VCFSv1ZW0/VyvDQYHubLU+mHstsf7KEjUuIdifBDuu7vgIfZ0Ma9LjOJJ45qLpigyR/GEhuJshicsrRiohiXxRNRWldjEKRFiiwlXQ2qmU8DHj65R8n46aRQpJ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=qLnM8crO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="qLnM8crO"
Received: by smtp.kernel.org (Postfix)
	id 308D1C4CEEB; Wed, 30 Jul 2025 20:58:00 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44121C4CEE3;
	Wed, 30 Jul 2025 20:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44121C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3C6E2C0005D3;
	Wed, 30 Jul 2025 13:57:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3C6E2C0005D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753909078;
	bh=echyi2c3urhSqgs7glAWZFtXGzhcRzbjLt58B4Kxebo=;
	h=From:To:Cc:Subject:Date:From;
	b=qLnM8crOGdPhLMTCi2MBVo/qSMtZcRXN8XoQtTZY2fCu9ymbL4taV4o7KdOkpZFzv
	 M21NyTjgeok6tiX7Fg1X6suyQ5f1xQ70ZjWWLySpXShncya+OAZudQkM3DlLEAQ15b
	 mPXS3APs+mzWtKrGhd7LGqDb/toWMIPzTpiIKQuk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id DC1B418000530;
	Wed, 30 Jul 2025 13:57:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom drivers changes for 6.17 part 2
Date: Wed, 30 Jul 2025 13:57:54 -0700
Message-ID: <20250730205754.3465896-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e3ce7b897388339b407d57969acaa26063e38209:

  pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers-part2

for you to fetch changes up to add858eff8c57e31d367399e4a4308a7b1d3485f:

  clk: rp1: Implement remaining clock tree (2025-07-30 13:56:29 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC drivers changes for 6.17, these
were applied a bit late, but would not otherwise be able to make it into
the clock tree:

- Andrea implements the remaining RP1 clocks within the RP1 clock
  driver: ADC, Audio IN/OUT, DMA, I2S, MIPI DPI/DSI, PWM, SDIO, UART and
  video encoder

----------------------------------------------------------------
Andrea della Porta (2):
      dt-bindings: clock: rp1: Add missing MIPI DSI defines
      clk: rp1: Implement remaining clock tree

 drivers/clk/clk-rp1.c                              | 1192 ++++++++++++++++++--
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h |    4 +
 2 files changed, 1080 insertions(+), 116 deletions(-)
