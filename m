Return-Path: <SRS0=M/nb=5V=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1C3C54E94
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 13:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88176C4339E; Tue, 24 Jan 2023 13:22:07 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 73381C433EF;
	Tue, 24 Jan 2023 13:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73381C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 56D95809F;
	Tue, 24 Jan 2023 13:21:59 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] Devicetree changes for omaps for v6.3
Date: Tue, 24 Jan 2023 15:21:55 +0200
Message-Id: <pull-1674566471-434733@atomide.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.3/dt-signed

for you to fetch changes up to 9dd320f0075fc765c6f35eb52f2a0cc73bf38a3f:

  ARM: dts: omap: gta04a5: cleanup i2c node names (2023-01-19 10:34:39 +0200)

----------------------------------------------------------------
Devicetree related changes for omaps for v6.3

Updates for am335x-nano, n900, and gta04 for the connected peripherals.
Also few corrections for node names.

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: omap: gta04: add BNO055 IMU chip
      ARM: dts: omap: gta04a5: cleanup i2c node names

Geert Uytterhoeven (1):
      ARM: dts: ti: Fix pca954x i2c-mux node names

Laurent Pinchart (1):
      ARM: dts: omap: Use new media bus type macros

Mark Jackson (5):
      ARM: dts: am335x-nano: Fix GPIO settings for RTS/CTS pins on UART3 & 4
      ARM: dts: am335x-nano: Enable RS485 mode for UART3 & 4
      ARM: dts: am335x-nano: Enable I2C temperature sensor
      ARM: dts: am335x-nano: Fix GPIO settings for MMC pins
      ARM: dts: am335x-nano: Enable USB host

Sicelo A. Mhlongo (2):
      ARM: dts: n900: rename accelerometer node
      ARM: dts: n900: use iio driver for accelerometer

 arch/arm/boot/dts/am335x-nano.dts     | 32 +++++++++++++++----
 arch/arm/boot/dts/am3874-iceboard.dts |  4 +--
 arch/arm/boot/dts/omap3-gta04a5.dts   | 19 +++++++++--
 arch/arm/boot/dts/omap3-n900.dts      | 59 +++++++----------------------------
 4 files changed, 56 insertions(+), 58 deletions(-)
