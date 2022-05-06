Return-Path: <SRS0=YIfF=VO=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34156C4332F
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 09:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01953C385AF; Fri,  6 May 2022 09:32:32 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C97A8C385B4
	for <soc@kernel.org>; Fri,  6 May 2022 09:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C97A8C385B4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
	by laurent.telenet-ops.be with bizsmtp
	id TMYM270061UVucw01MYMdR; Fri, 06 May 2022 11:32:22 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nmuJw-0038XF-JW; Fri, 06 May 2022 11:32:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nmuJv-00Aeka-Te; Fri, 06 May 2022 11:32:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/5] Renesas DT binding updates for v5.19 (take two)
Date: Fri,  6 May 2022 11:32:16 +0200
Message-Id: <cover.1651828616.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651828600.git.geert+renesas@glider.be>
References: <cover.1651828600.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 05d39fc06cee5b11b195d0d5fec55d01da2781cb:

  dt-bindings: arm: renesas: Document Renesas RZ/G2UL SMARC EVK (2022-04-13 12:19:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.19-tag2

for you to fetch changes up to 033a26dcbe10476c5203f590dce0537fac802d03:

  dt-bindings: soc: renesas: Move renesas,rzg2l-sysc from arm to soc (2022-05-05 11:59:47 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.19 (take two)

  - Document support for the R-Car V4H SoC and the White Hawk
    development board stack,
  - Document support for the RZ/V2M SoC and the RZ/V2M Evaluation Kit
    Board,
  - Document SPI Multi I/O Bus Controller (RPC-IF) support for RZ/G2UL,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: memory: renesas,rpc-if: Document RZ/G2UL SoC

Geert Uytterhoeven (1):
      dt-bindings: soc: renesas: Move renesas,rzg2l-sysc from arm to soc

Phil Edworthy (1):
      dt-bindings: arm: renesas: Document Renesas RZ/V2M SoC and EVK board

Yoshihiro Shimoda (3):
      dt-bindings: arm: renesas: Document R-Car V4H White Hawk DT bindings
      dt-bindings: reset: renesas,rst: Document r8a779g0 reset module
      dt-bindings: power: renesas,rcar-sysc: Document r8a779g0 SYSC bindings

 Documentation/devicetree/bindings/arm/renesas.yaml     | 18 ++++++++++++++++++
 .../bindings/memory-controllers/renesas,rpc-if.yaml    |  1 +
 .../devicetree/bindings/power/renesas,rcar-sysc.yaml   |  1 +
 .../devicetree/bindings/reset/renesas,rst.yaml         |  1 +
 .../{power => soc/renesas}/renesas,rzg2l-sysc.yaml     |  2 +-
 5 files changed, 22 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{power => soc/renesas}/renesas,rzg2l-sysc.yaml (96%)
