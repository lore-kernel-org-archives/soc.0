Return-Path: <SRS0=kxyi=FN=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DABCE7F154
	for <soc@archiver.kernel.org>; Fri, 29 Sep 2023 11:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CB27C433D9; Fri, 29 Sep 2023 11:10:27 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 886F1C433CA
	for <soc@kernel.org>; Fri, 29 Sep 2023 11:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 886F1C433CA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c2e7:1eb0:4c87:ebc6])
	by michel.telenet-ops.be with bizsmtp
	id rnAN2A0081EgHdD06nAN0p; Fri, 29 Sep 2023 13:10:23 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qmBNd-004qNg-4w;
	Fri, 29 Sep 2023 13:10:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qmBO2-001frB-4b;
	Fri, 29 Sep 2023 13:10:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/5] Renesas driver updates for v6.7
Date: Fri, 29 Sep 2023 13:10:13 +0200
Message-Id: <cover.1695985423.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695985418.git.geert+renesas@glider.be>
References: <cover.1695985418.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.7-tag1

for you to fetch changes up to 61ad21ec519774182d23dd83d6cb44d7b80b7421:

  soc: renesas: Kconfig: Remove blank line before ARCH_R9A07G043 help text (2023-09-18 10:39:14 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.7

  - Identify the new RZ/G3S SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Claudiu Beznea (2):
      soc: renesas: Identify RZ/G3S SoC
      soc: renesas: renesas-soc: Remove blank lines

Geert Uytterhoeven (1):
      soc: renesas: Kconfig: Remove blank line before ARCH_R9A07G043 help text

 drivers/soc/renesas/Kconfig       |  7 ++++++-
 drivers/soc/renesas/renesas-soc.c | 15 +++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)
