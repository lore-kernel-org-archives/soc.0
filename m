Return-Path: <SRS0=8Gze=LR=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E72CC00A94
	for <soc@archiver.kernel.org>; Fri, 12 Apr 2024 10:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A99DC3277B; Fri, 12 Apr 2024 10:49:08 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 615BCC4AF09
	for <soc@kernel.org>; Fri, 12 Apr 2024 10:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 615BCC4AF09
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id AAox2C00C0SSLxL01AoxX7; Fri, 12 Apr 2024 12:48:59 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESF-00GpBW-Eu;
	Fri, 12 Apr 2024 12:48:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDj5-004eQG-QR;
	Fri, 12 Apr 2024 12:01:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.10
Date: Fri, 12 Apr 2024 12:01:37 +0200
Message-Id: <cover.1712915530.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712915528.git.geert+renesas@glider.be>
References: <cover.1712915528.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.10-tag1

for you to fetch changes up to ec78ed2e157ea6d4b66869c8a3dbe4dbac0593c6:

  ARM: shmobile: defconfig: Refresh for v6.9-rc1 (2024-04-08 11:14:11 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.10

  - Enable support for the Renesas RZ/G2L display unit, DA9062 PMIC, and
    RZ/V2H (R9A09G057) SoC in the ARM64 defconfig,
  - Refresh shmobile_defconfig for v6.9-rc1.

----------------------------------------------------------------
Biju Das (2):
      arm64: defconfig: Enable Renesas RZ/G2L display unit DRM driver
      arm64: defconfig: Enable Renesas DA9062 PMIC

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.9-rc1

Lad Prabhakar (1):
      arm64: defconfig: Enable R9A09G057 SoC

 arch/arm/configs/shmobile_defconfig | 3 ++-
 arch/arm64/configs/defconfig        | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)
