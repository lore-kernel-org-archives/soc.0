Return-Path: <SRS0=yapO=HA=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D05EC433E6
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 09:50:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9C7C664E2E; Fri, 29 Jan 2021 09:50:42 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C7064E2F
	for <soc@kernel.org>; Fri, 29 Jan 2021 09:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72C7064E2F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by andre.telenet-ops.be with bizsmtp
	id NZqf240094C55Sk01ZqfVz; Fri, 29 Jan 2021 10:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1l5QQI-001YQP-MI; Fri, 29 Jan 2021 10:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1l5PlQ-00Ai11-8E; Fri, 29 Jan 2021 10:08:24 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM DT updates for v5.12 (take two)
Date: Fri, 29 Jan 2021 10:08:14 +0100
Message-Id: <20210129090815.2552425-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129090815.2552425-1-geert+renesas@glider.be>
References: <20210129090815.2552425-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1f4449e12c5c6682a6f4f8dbc7288c19c1c844f1:

  arm64: dts: renesas: r8a779a0: Add SYS-DMAC nodes (2021-01-14 12:13:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.12-tag2

for you to fetch changes up to 74477936a828a7c91a61ba7e625b7ce2299c8c98:

  arm64: dts: renesas: beacon: Fix EEPROM compatible value (2021-01-29 09:11:27 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.12 (take two)

  - Increase support (SPI, I2C, Ethernet, Serial, MMC) for the R-Car V3U
    SoC on the Renesas Falcon board,
  - Disable SD functions for plain eMMC,
  - A minor fix.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: renesas: beacon: Fix EEPROM compatible value

Koji Matsuoka (2):
      arm64: dts: renesas: r8a779a0: Add MSIOF device nodes
      arm64: dts: renesas: r8a779a0: Add I2C nodes

Linh Phung (1):
      arm64: dts: renesas: r8a779a0: Add HSCIF support

Takeshi Saito (2):
      arm64: dts: renesas: r8a779a0: Add MMC node
      arm64: dts: renesas: falcon: Enable MMC

Tho Vu (1):
      arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support

Wolfram Sang (5):
      arm64: dts: renesas: Disable SD functions for plain eMMC
      arm64: dts: renesas: falcon: Add I2C0,1,6 support
      arm64: dts: renesas: falcon: Add Ethernet-AVB0 support
      arm64: dts: renesas: r8a779a0: Add & update SCIF nodes
      arm64: dts: renesas: falcon: Complete SCIF0 nodes

 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   4 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   2 +
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   2 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |   2 +
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      | 138 +++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 620 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +
 10 files changed, 774 insertions(+), 1 deletion(-)
