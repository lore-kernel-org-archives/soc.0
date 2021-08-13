Return-Path: <SRS0=xTtj=NE=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E62C4320E
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 10:22:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B46560F14; Fri, 13 Aug 2021 10:22:53 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC6E610FC
	for <soc@kernel.org>; Fri, 13 Aug 2021 10:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DC6E610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b151:f011:b544:c545])
	by albert.telenet-ops.be with bizsmtp
	id gyNq2500K1MlFFN06yNq7W; Fri, 13 Aug 2021 12:22:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mEUKw-002Wov-FB; Fri, 13 Aug 2021 12:22:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mEUKv-007SUy-NJ; Fri, 13 Aug 2021 12:22:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas driver updates for v5.15 (take two)
Date: Fri, 13 Aug 2021 12:22:36 +0200
Message-Id: <cover.1628849625.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628849621.git.geert+renesas@glider.be>
References: <cover.1628849621.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit bfe6b5590ce6cab81b3ee51b4541bd1d0b18b3b2:

  soc: renesas: Identify R-Car H3e-2G and M3e-2G (2021-07-27 09:27:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.15-tag2

for you to fetch changes up to 148bcca9ad0488d623aa36b21ac152bb056a1ae4:

  soc: renesas: Prefer memcpy() over strcpy() (2021-08-12 12:36:57 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.15 (take two)

  - Prefer memcpy() over strcpy().

----------------------------------------------------------------
Len Baker (1):
      soc: renesas: Prefer memcpy() over strcpy()

 drivers/soc/renesas/r8a779a0-sysc.c | 6 ++++--
 drivers/soc/renesas/rcar-sysc.c     | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)
