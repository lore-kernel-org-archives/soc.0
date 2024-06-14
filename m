Return-Path: <SRS0=9b4z=NQ=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CB0C27C6E
	for <soc@archiver.kernel.org>; Fri, 14 Jun 2024 09:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3F1BC4AF49; Fri, 14 Jun 2024 09:07:07 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E222EC32786
	for <soc@kernel.org>; Fri, 14 Jun 2024 09:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E222EC32786
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by baptiste.telenet-ops.be with bizsmtp
	id bM732C00L3w30qz01M73x4; Fri, 14 Jun 2024 11:07:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2se-00BqO6-Sb;
	Fri, 14 Jun 2024 11:07:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2tj-00FbJe-E0;
	Fri, 14 Jun 2024 11:07:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v6.11
Date: Fri, 14 Jun 2024 11:06:58 +0200
Message-Id: <cover.1718355311.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718355309.git.geert+renesas@glider.be>
References: <cover.1718355309.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.11-tag1

for you to fetch changes up to 4b45a978b25da1d4de051ed8e91e669e3701d780:

  arm64: defconfig: Enable Marvell 88Q2XXX PHY support (2024-06-03 09:35:27 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.11

  - Enable support for Renesas R-Car Gen4 PCIe controllers and Marvell
    88Q2XXX 100/1000BASE-T1 Automotive Ethernet PHYs in the ARM64
    defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: defconfig: Enable Marvell 88Q2XXX PHY support

Wolfram Sang (1):
      arm64: defconfig: Enable Renesas R-Car Gen4 PCIe controller

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)
