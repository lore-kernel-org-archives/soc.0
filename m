Return-Path: <SRS0=kxyi=FN=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395E9E7F156
	for <soc@archiver.kernel.org>; Fri, 29 Sep 2023 11:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10BEFC433C9; Fri, 29 Sep 2023 11:10:29 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9388FC433C8
	for <soc@kernel.org>; Fri, 29 Sep 2023 11:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9388FC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c2e7:1eb0:4c87:ebc6])
	by michel.telenet-ops.be with bizsmtp
	id rnAN2A00A1EgHdD06nAN0r; Fri, 29 Sep 2023 13:10:23 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qmBNd-004qNc-4N;
	Fri, 29 Sep 2023 13:10:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qmBO2-001fr6-40;
	Fri, 29 Sep 2023 13:10:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/5] Renesas ARM SoC updates for v6.7
Date: Fri, 29 Sep 2023 13:10:12 +0200
Message-Id: <cover.1695985421.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695985418.git.geert+renesas@glider.be>
References: <cover.1695985418.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.7-tag1

for you to fetch changes up to 435d422624b74085e2c0be650dc3a1d3a4a6bfa5:

  ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled (2023-09-27 11:00:27 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.7

  - Reserve boot area when SMP is enabled to prevent conflicts with
    FLASH,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (4):
      ARM: shmobile: rcar-gen2: Remove unneeded once handling
      ARM: shmobile: rcar-gen2: Reserve boot area when SMP is enabled
      ARM: shmobile: r8a7779: Reserve boot area when SMP is enabled
      ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled

 arch/arm/mach-shmobile/pm-rcar-gen2.c |  5 +++--
 arch/arm/mach-shmobile/smp-r8a7779.c  |  9 ++++++++-
 arch/arm/mach-shmobile/smp-sh73a0.c   | 10 ++++++++--
 3 files changed, 19 insertions(+), 5 deletions(-)
