Return-Path: <SRS0=BlQ1=ZF=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C621FECAAD5
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 09:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1E57C43146; Fri,  2 Sep 2022 09:37:14 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8391AC43141
	for <soc@kernel.org>; Fri,  2 Sep 2022 09:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8391AC43141
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by michel.telenet-ops.be with bizsmtp
	id Exd32800r4C55Sk06xd3Wn; Fri, 02 Sep 2022 11:37:05 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oU36l-003hap-Br; Fri, 02 Sep 2022 11:37:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oU36k-007eRQ-Pk; Fri, 02 Sep 2022 11:37:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v6.1
Date: Fri,  2 Sep 2022 11:36:52 +0200
Message-Id: <cover.1662111137.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111124.git.geert+renesas@glider.be>
References: <cover.1662111124.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.1-tag1

for you to fetch changes up to fddccbcb4de7ae734977da1a4c6d4c04a36a8f62:

  dt-bindings: arm: renesas: Document Renesas R-Car V3H2 SoC and board (2022-08-30 09:52:32 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.1

  - Document support for the R-Car H3Ne-1.7G SoC on the Salvator-XS and
    ULCB development boards,
  - Document system controller support for the RZ/Five SoC,
  - Document support for the R-Car V3H2 SoC and the Condor-I development
    board.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: arm: renesas: Document R-Car H3Ne-1.7G SoC and boards

Kuninori Morimoto (1):
      dt-bindings: arm: renesas: Document Renesas R-Car V3H2 SoC and board

Lad Prabhakar (1):
      dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/Five SoC

 Documentation/devicetree/bindings/arm/renesas.yaml       | 16 ++++++++++++++++
 .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml         |  4 +---
 2 files changed, 17 insertions(+), 3 deletions(-)
