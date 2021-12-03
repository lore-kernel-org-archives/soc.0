Return-Path: <SRS0=3L+D=QU=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFF9C4321E
	for <soc@archiver.kernel.org>; Fri,  3 Dec 2021 11:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68C0BC53FC7; Fri,  3 Dec 2021 11:31:47 +0000 (UTC)
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A5BEC56748
	for <soc@kernel.org>; Fri,  3 Dec 2021 11:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A5BEC56748
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4J59dP40TSzMqplJ
	for <soc@kernel.org>; Fri,  3 Dec 2021 12:31:37 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
	by baptiste.telenet-ops.be with bizsmtp
	id RnXV2600Y3eLghq01nXVzX; Fri, 03 Dec 2021 12:31:29 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mt6mn-002IYt-Bv; Fri, 03 Dec 2021 12:31:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mt6mm-000hRY-Pm; Fri, 03 Dec 2021 12:31:28 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.17
Date: Fri,  3 Dec 2021 12:31:21 +0100
Message-Id: <cover.1638530614.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638530605.git.geert+renesas@glider.be>
References: <cover.1638530605.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.17-tag1

for you to fetch changes up to 217c7d1840b5377543eff84fe28409d0bd4d3433:

  dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks (2021-11-26 13:53:02 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v5.17

  - Document SDHI SDnH clocks on R-Car Gen2 and later,
  - Document core support for the R-Car S4-8 (R8A779F0) SoC.

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks

Wolfram Sang (1):
      dt-bindings: mmc: renesas,sdhi: Add optional SDnH clock

Yoshihiro Shimoda (3):
      dt-bindings: arm: renesas: Document R-Car S4-8 SoC DT bindings
      dt-bindings: reset: renesas,rst: Document r8a779f0 reset module
      dt-bindings: power: renesas,rcar-sysc: Document r8a779f0 SYSC bindings

 Documentation/devicetree/bindings/arm/renesas.yaml |  4 ++
 .../devicetree/bindings/mmc/renesas,sdhi.yaml      | 48 +++++++++++++++-------
 .../bindings/power/renesas,rcar-sysc.yaml          |  1 +
 .../devicetree/bindings/reset/renesas,rst.yaml     |  1 +
 4 files changed, 40 insertions(+), 14 deletions(-)
