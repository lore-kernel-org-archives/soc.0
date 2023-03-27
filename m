Return-Path: <SRS0=dswN=7T=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBE0C76195
	for <soc@archiver.kernel.org>; Mon, 27 Mar 2023 08:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA221C4339C; Mon, 27 Mar 2023 08:57:18 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DBB76C433D2
	for <soc@kernel.org>; Mon, 27 Mar 2023 08:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DBB76C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.187.55])
	by michel.telenet-ops.be with bizsmtp
	id dLx82900H1C8whw06Lx8FR; Mon, 27 Mar 2023 10:57:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pgieO-00ExYz-SK;
	Mon, 27 Mar 2023 10:57:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pgif6-002atk-DO;
	Mon, 27 Mar 2023 10:57:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v6.4
Date: Mon, 27 Mar 2023 10:57:02 +0200
Message-Id: <cover.1679907059.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679907055.git.geert+renesas@glider.be>
References: <cover.1679907055.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.4-tag1

for you to fetch changes up to 2653d5bf1c9d123c0d8b8c1634cf54dacfcfdb52:

  soc: renesas: Use "#ifdef" for single-symbol definition checks (2023-03-16 16:58:42 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.4

  - Drop support for the obsolete R-Car H3 ES1.* (R8A77950) SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      soc: renesas: rmobile-sysc: Use of_fwnode_handle() helper
      soc: renesas: Use "#ifdef" for single-symbol definition checks

Krzysztof Kozlowski (2):
      soc: renesas: mark OF related data as maybe unused
      soc: renesas: pwc-rzv2m: drop of_match_ptr for ID table

Wolfram Sang (2):
      soc: renesas: rcar-sysc: Remove R-Car H3 ES1.* handling
      soc: renesas: Remove r8a77950 arch

 drivers/soc/renesas/Kconfig              |  7 -------
 drivers/soc/renesas/pwc-rzv2m.c          |  2 +-
 drivers/soc/renesas/r8a7795-sysc.c       | 10 ----------
 drivers/soc/renesas/renesas-soc.c        | 14 ++++++--------
 drivers/soc/renesas/rmobile-sysc.c       |  2 +-
 include/dt-bindings/power/r8a7795-sysc.h |  1 -
 6 files changed, 8 insertions(+), 28 deletions(-)
