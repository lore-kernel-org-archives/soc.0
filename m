Return-Path: <SRS0=8Gze=LR=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F311C04FFE
	for <soc@archiver.kernel.org>; Fri, 12 Apr 2024 10:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F4B5C113CD; Fri, 12 Apr 2024 10:49:09 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80D97C4AF0A
	for <soc@kernel.org>; Fri, 12 Apr 2024 10:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80D97C4AF0A
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id AAox2C00M0SSLxL06Aox06; Fri, 12 Apr 2024 12:48:59 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESG-00GpC8-47;
	Fri, 12 Apr 2024 12:48:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDj5-004eQK-RZ;
	Fri, 12 Apr 2024 12:01:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v6.10
Date: Fri, 12 Apr 2024 12:01:38 +0200
Message-Id: <cover.1712915532.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712915528.git.geert+renesas@glider.be>
References: <cover.1712915528.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.10-tag1

for you to fetch changes up to 3d2db954d2d922a8193654f2aa09c1bdee47818a:

  soc: renesas: Enable TMU support on R-Car Gen2 (2024-03-26 09:25:06 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.10

  - Identify the new RZ/V2H (R9A09G057) SoC,
  - Enable support for the TMU (Timer Unit) on R-Car Gen2 SoCs.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: Enable TMU support on R-Car Gen2

Lad Prabhakar (1):
      soc: renesas: Add identification support for RZ/V2H SoC

 drivers/soc/renesas/Kconfig       |  6 ++++++
 drivers/soc/renesas/renesas-soc.c | 20 +++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
