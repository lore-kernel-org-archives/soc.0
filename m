Return-Path: <SRS0=F+Ro=B5=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2172C7EE2E
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 10:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8983AC433D2; Fri,  9 Jun 2023 10:07:00 +0000 (UTC)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04998C433EF
	for <soc@kernel.org>; Fri,  9 Jun 2023 10:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04998C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4QcxZM1tdGz4xFDP
	for <soc@kernel.org>; Fri,  9 Jun 2023 12:06:51 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
	by andre.telenet-ops.be with bizsmtp
	id 6y6i2A00B12zQ4r01y6ilE; Fri, 09 Jun 2023 12:06:42 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q7Z0d-008L2M-1u;
	Fri, 09 Jun 2023 12:06:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q7Z10-00G42t-35;
	Fri, 09 Jun 2023 12:06:42 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.5 (take two)
Date: Fri,  9 Jun 2023 12:06:37 +0200
Message-Id: <cover.1686304612.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686304609.git.geert+renesas@glider.be>
References: <cover.1686304609.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cb9a39aacd3d6387b6f1f178a96eadceba90454e:

  soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U (2023-05-15 10:32:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.5-tag2

for you to fetch changes up to a00d47f7645d6e840a38a62fd961c8aa2c8fed6c:

  soc: renesas: rmobile-sysc: Convert to readl_poll_timeout_atomic() (2023-06-05 15:43:27 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.5 (take two)

  - Convert the R-Mobile SYSC driver to readl_poll_timeout_atomic().

----------------------------------------------------------------
Geert Uytterhoeven (4):
      iopoll: Call cpu_relax() in busy loops
      iopoll: Do not use timekeeping in read_poll_timeout_atomic()
      Merge tag 'iopoll-busy-loop-timeout-tag' into renesas-drivers-for-v6.5
      soc: renesas: rmobile-sysc: Convert to readl_poll_timeout_atomic()

 drivers/soc/renesas/rmobile-sysc.c | 29 +++++++++--------------------
 include/linux/iopoll.h             | 24 +++++++++++++++++++-----
 2 files changed, 28 insertions(+), 25 deletions(-)
