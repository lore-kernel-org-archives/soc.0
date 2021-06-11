Return-Path: <SRS0=GheF=LF=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1987CC48BE8
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 09:47:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 940CB613E9; Fri, 11 Jun 2021 09:47:16 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D44E2613E1
	for <soc@kernel.org>; Fri, 11 Jun 2021 09:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D44E2613E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
	by xavier.telenet-ops.be with bizsmtp
	id FlnD2500b25eH3q01lnEK7; Fri, 11 Jun 2021 11:47:14 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lrdkv-00FcQN-Hn; Fri, 11 Jun 2021 11:47:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lrdku-00CZqt-Pd; Fri, 11 Jun 2021 11:47:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM DT updates for v5.14 (take two)
Date: Fri, 11 Jun 2021 11:47:02 +0200
Message-Id: <cover.1623403796.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623403793.git.geert+renesas@glider.be>
References: <cover.1623403793.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b32fce42bff899dfb9b72962f46ca5542c7647c:

  ARM: dts: alt: Add SW2 as GPIO keys (2021-05-27 15:46:21 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.14-tag2

for you to fetch changes up to 42bbd003910906229cb1dc0eaa812d9cc59e4c77:

  arm64: dts: renesas: r9a07g044: Add SYSC node (2021-06-10 15:36:41 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.14 (take two)

  - External interrupt (INTC-EX) support for the R-Car M3-W+ SoC,
  - Initial support for the new RZ/G2L SoC on the RZ/G2L SMARC EVK
    board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (9):
      arm64: dts: renesas: Add missing opp-suspend properties
      arm64: dts: renesas: r8a7796[01]: Fix OPP table entry voltages
      ARM: dts: lager: Configure pull-up for SOFT_SW GPIO keys
      ARM: dts: blanche: Configure pull-up for SOFT_SW and SW25 GPIO keys
      ARM: dts: gose: Configure pull-up for SOFT_SW GPIO keys
      ARM: dts: silk: Configure pull-up for SOFT_SW GPIO keys
      arm64: dts: renesas: r8a77961: Add INTC-EX device node
      arm64: dts: renesas: r8a779a0: Drop power-domains property from GIC node
      Merge tag 'renesas-r9a07g044-dt-binding-defs-tag' into renesas-arm-dt-for-v5.14

Lad Prabhakar (4):
      dt-bindings: clock: Add r9a07g044 CPG Clock Definitions
      arm64: dts: renesas: Add initial DTSI for RZ/G2{L,LC} SoC's
      arm64: dts: renesas: Add initial device tree for RZ/G2L SMARC EVK
      arm64: dts: renesas: r9a07g044: Add SYSC node

 arch/arm/boot/dts/r8a7790-lager.dts               |   8 ++
 arch/arm/boot/dts/r8a7792-blanche.dts             |   8 ++
 arch/arm/boot/dts/r8a7793-gose.dts                |  10 +-
 arch/arm/boot/dts/r8a7794-silk.dts                |  10 +-
 arch/arm64/boot/dts/renesas/Makefile              |   2 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi         |   7 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi         |  18 ++-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi         |   1 -
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi        | 132 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi      |  25 ++++
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts |  21 ++++
 arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi      |  13 +++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi      |  27 +++++
 include/dt-bindings/clock/r9a07g044-cpg.h         |  89 +++++++++++++++
 15 files changed, 362 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
 create mode 100644 include/dt-bindings/clock/r9a07g044-cpg.h
