Return-Path: <SRS0=Z9GS=VA=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFB5C4332F
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 14:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44193C385A8; Fri, 22 Apr 2022 14:55:17 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F2F3C385B5
	for <soc@kernel.org>; Fri, 22 Apr 2022 14:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F2F3C385B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4KlHWX4TF2z50Lcn
	for <soc@kernel.org>; Fri, 22 Apr 2022 16:55:04 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
	by andre.telenet-ops.be with bizsmtp
	id Mquw2701Y2Ah9RF01quwAr; Fri, 22 Apr 2022 16:54:56 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nhugS-001cQ8-9I; Fri, 22 Apr 2022 16:54:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nhugR-00COlB-Nq; Fri, 22 Apr 2022 16:54:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.19
Date: Fri, 22 Apr 2022 16:54:50 +0200
Message-Id: <cover.1650638503.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650638502.git.geert+renesas@glider.be>
References: <cover.1650638502.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.19-tag1

for you to fetch changes up to dcc1449554ba8e49880507c7b761559022363bdd:

  ARM: shmobile: defconfig: Refresh for v5.18-rc1 (2022-04-19 10:36:23 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.19

  - Enable support for the Renesas RZ/V2L SoC and the Maxim MAX96712
    Quad GMSL2 Deserializer in the arm64 defconfig,
  - Refresh shmobile_defconfig for v5.18-rc1.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      arm64: defconfig: Enable Maxim MAX96712 Quad GMSL2 Deserializer support
      ARM: shmobile: defconfig: Refresh for v5.18-rc1

Lad Prabhakar (1):
      arm64: defconfig: Enable ARCH_R9A07G054

 arch/arm/configs/shmobile_defconfig | 4 ++--
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)
