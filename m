Return-Path: <SRS0=XJTA=XN=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7040C43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 11:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D01F4C341C7; Fri,  8 Jul 2022 11:27:01 +0000 (UTC)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AFFFC341CB
	for <soc@kernel.org>; Fri,  8 Jul 2022 11:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4AFFFC341CB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4LfWFl4BXWz4wwch
	for <soc@kernel.org>; Fri,  8 Jul 2022 13:26:51 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.186.194])
	by laurent.telenet-ops.be with bizsmtp
	id sbSk2700H4C55Sk01bSkLt; Fri, 08 Jul 2022 13:26:44 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o9m8B-002baK-ND; Fri, 08 Jul 2022 13:26:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o9m8A-00BLWC-Pd; Fri, 08 Jul 2022 13:26:42 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas ARM SoC updates for v5.20
Date: Fri,  8 Jul 2022 13:26:35 +0200
Message-Id: <cover.1657278849.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657278843.git.geert+renesas@glider.be>
References: <cover.1657278843.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v5.20-tag1

for you to fetch changes up to 75a185fb92e58ccd3670258d8d3b826bd2fa6d29:

  ARM: shmobile: rcar-gen2: Increase refcount for new reference (2022-07-05 09:08:35 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v5.20

  - Fix of_node reference counting in the R-Car Gen2 board quirk.

----------------------------------------------------------------
Liang He (1):
      ARM: shmobile: rcar-gen2: Increase refcount for new reference

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
