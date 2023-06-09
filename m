Return-Path: <SRS0=F+Ro=B5=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6840C7EE25
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 10:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89886C4339E; Fri,  9 Jun 2023 10:07:00 +0000 (UTC)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04FD3C4339B
	for <soc@kernel.org>; Fri,  9 Jun 2023 10:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04FD3C4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4QcxZM1cdMz4xFDN
	for <soc@kernel.org>; Fri,  9 Jun 2023 12:06:51 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
	by andre.telenet-ops.be with bizsmtp
	id 6y6i2A00A12zQ4r01y6ilF; Fri, 09 Jun 2023 12:06:42 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q7Z0d-008L2K-1q;
	Fri, 09 Jun 2023 12:06:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q7Z10-00G42q-2R;
	Fri, 09 Jun 2023 12:06:42 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.5 (take two)
Date: Fri,  9 Jun 2023 12:06:36 +0200
Message-Id: <cover.1686304611.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686304609.git.geert+renesas@glider.be>
References: <cover.1686304609.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3f1e1ad9230f8b1c415b432841db2b2850450fd4:

  ARM: shmobile: defconfig: Refresh for v6.4-rc1 (2023-05-15 10:31:22 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.5-tag2

for you to fetch changes up to cacde5cc9dbc1af46a5d35efd17365bc3324b4fb:

  arm64: defconfig: Enable Renesas MTU3a counter config (2023-06-02 11:22:50 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.5 (take two)

  - Enable support for the Renesas MTU3a counter in the arm64 defconfig.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable Renesas MTU3a counter config

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
