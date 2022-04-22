Return-Path: <SRS0=Z9GS=VA=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3533BC433F5
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 14:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C7A7C385AC; Fri, 22 Apr 2022 14:55:16 +0000 (UTC)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 951DCC385B8
	for <soc@kernel.org>; Fri, 22 Apr 2022 14:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 951DCC385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4KlHWX4zMyz50Lvq
	for <soc@kernel.org>; Fri, 22 Apr 2022 16:55:04 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
	by baptiste.telenet-ops.be with bizsmtp
	id Mquw2700f2Ah9RF01quxTE; Fri, 22 Apr 2022 16:54:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nhugS-001cQB-HJ; Fri, 22 Apr 2022 16:54:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nhugR-00COlW-Qu; Fri, 22 Apr 2022 16:54:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.19
Date: Fri, 22 Apr 2022 16:54:53 +0200
Message-Id: <cover.1650638516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650638502.git.geert+renesas@glider.be>
References: <cover.1650638502.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.19-tag1

for you to fetch changes up to 05d39fc06cee5b11b195d0d5fec55d01da2781cb:

  dt-bindings: arm: renesas: Document Renesas RZ/G2UL SMARC EVK (2022-04-13 12:19:31 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.19

  - Document support for the new RZ/G2UL SoC and the RZ/G2UL SMARC EVK
    development board.

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: power: renesas,rzg2l-sysc: Document RZ/G2UL SoC
      dt-bindings: arm: renesas: Document Renesas RZ/G2UL SMARC EVK

 Documentation/devicetree/bindings/arm/renesas.yaml              | 2 ++
 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
