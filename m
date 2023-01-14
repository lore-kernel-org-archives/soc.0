Return-Path: <SRS0=TcnV=5L=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19469C678D7
	for <soc@archiver.kernel.org>; Sat, 14 Jan 2023 13:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D24A4C43396; Sat, 14 Jan 2023 13:23:22 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EAFC3C433F0
	for <soc@kernel.org>; Sat, 14 Jan 2023 13:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EAFC3C433F0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by andre.telenet-ops.be with bizsmtp
	id 8dP92900U4C55Sk01dP9eh; Sat, 14 Jan 2023 14:23:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pGgUz-003z7D-W5;
	Sat, 14 Jan 2023 14:23:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pGgV3-006HuK-N6;
	Sat, 14 Jan 2023 14:23:09 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.3
Date: Sat, 14 Jan 2023 14:22:57 +0100
Message-Id: <cover.1673702289.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673702287.git.geert+renesas@glider.be>
References: <cover.1673702287.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.3-tag1

for you to fetch changes up to 3ad69c496d488cd1b6c3a20b2f7945b45a0f7f18:

  arm64: defconfig: Enable RZ/G2L MIPI CSI-2 and CRU support (2023-01-10 09:39:55 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.3

  - Enable support for the Renesas RZ/G2L MIPI DSI, CSI-2, and Camera
    Receiving Unit drivers in the arm64 defconfig,
  - Refresh shmobile_defconfig for v6.1-rc5.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable Renesas RZ/G2L MIPI DSI driver

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Refresh for v6.1-rc5
      arm64: defconfig: Enable RZ/G2L MIPI CSI-2 and CRU support

 arch/arm/configs/shmobile_defconfig | 1 +
 arch/arm64/configs/defconfig        | 3 +++
 2 files changed, 4 insertions(+)
