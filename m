Return-Path: <SRS0=eZhF=MW=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DE4C432BE
	for <soc@archiver.kernel.org>; Fri, 30 Jul 2021 13:19:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A18D61059; Fri, 30 Jul 2021 13:19:09 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F826101C
	for <soc@kernel.org>; Fri, 30 Jul 2021 13:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53F826101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:69f0:c617:e432:6919])
	by baptiste.telenet-ops.be with bizsmtp
	id bRK62500D2oLRg901RK65J; Fri, 30 Jul 2021 15:19:06 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1m9SPq-002GQr-0d; Fri, 30 Jul 2021 15:19:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1m9SPp-00HJry-H9; Fri, 30 Jul 2021 15:19:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v5.15
Date: Fri, 30 Jul 2021 15:18:55 +0200
Message-Id: <cover.1627650704.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627650695.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.15-tag1

for you to fetch changes up to bfe6b5590ce6cab81b3ee51b4541bd1d0b18b3b2:

  soc: renesas: Identify R-Car H3e-2G and M3e-2G (2021-07-27 09:27:19 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.15

  - Initial support for the new R-Car H3e-2G and M3e-2G SoCs.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: Identify R-Car H3e-2G and M3e-2G

 drivers/soc/renesas/Kconfig       | 2 ++
 drivers/soc/renesas/renesas-soc.c | 4 ++++
 2 files changed, 6 insertions(+)
