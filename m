Return-Path: <SRS0=GheF=LF=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A3BC48BE5
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 09:47:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 86E87613EE; Fri, 11 Jun 2021 09:47:16 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2B2A613D3
	for <soc@kernel.org>; Fri, 11 Jun 2021 09:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2B2A613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
	by xavier.telenet-ops.be with bizsmtp
	id FlnD2500N25eH3q01lnDK4; Fri, 11 Jun 2021 11:47:14 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lrdkv-00FcQM-6D; Fri, 11 Jun 2021 11:47:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lrdku-00CZqn-OV; Fri, 11 Jun 2021 11:47:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.14 (take two)
Date: Fri, 11 Jun 2021 11:47:01 +0200
Message-Id: <cover.1623403795.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623403793.git.geert+renesas@glider.be>
References: <cover.1623403793.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9558487e7d976c1b92b2bc66fb4d901b1d35437f:

  arm64: defconfig: Enable usb2_clksel for R-Car Gen3 and RZ/G2 (2021-05-25 10:04:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.14-tag2

for you to fetch changes up to 27a79a723d48dbeccb4fe6f7ede47e67642e6a4a:

  arm64: defconfig: Enable ARCH_R9A07G044 (2021-06-10 15:30:18 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.14 (take two)

  - Enable support for the new RZ/G2L SoC variants in the arm64
    defconfig.

----------------------------------------------------------------
Lad Prabhakar (1):
      arm64: defconfig: Enable ARCH_R9A07G044

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
