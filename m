Return-Path: <SRS0=xTtj=NE=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1FEC432BE
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 10:22:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7F09661101; Fri, 13 Aug 2021 10:22:52 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F35760F14
	for <soc@kernel.org>; Fri, 13 Aug 2021 10:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F35760F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b151:f011:b544:c545])
	by michel.telenet-ops.be with bizsmtp
	id gyNp2500R1MlFFN06yNpLG; Fri, 13 Aug 2021 12:22:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mEUKv-002Woo-GM; Fri, 13 Aug 2021 12:22:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mEUKu-007SUl-Vu; Fri, 13 Aug 2021 12:22:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM DT updates for v5.15 (take two)
Date: Fri, 13 Aug 2021 12:22:35 +0200
Message-Id: <cover.1628849623.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628849621.git.geert+renesas@glider.be>
References: <cover.1628849621.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 651f8cffade8615bb4fce1ecb3a929892c5e60d7:

  arm64: dts: renesas: r8a77961: Add iommus to ipmmu_ds[01] related nodes (2021-07-30 15:07:25 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.15-tag2

for you to fetch changes up to 13bf92e6dec0e2be1ef0c7dd483f2d8b34eaa905:

  dt-bindings: i2c: renesas,riic: Make interrupt-names required (2021-08-12 12:43:41 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.15 (take two)

  - Pin control, ADC, and CANFD support for the RZ/G2L SoC,
  - Add interrupt-names properties to the Renesas RZ/A and RZ/G2L I2C
    Bus Interface.

----------------------------------------------------------------
Geert Uytterhoeven (5):
      Merge tag 'renesas-r9a07g044-dt-binding-defs-tag2' into HEAD
      dt-bindings: i2c: renesas,riic: Add interrupt-names
      ARM: dts: rza: Add I2C interrupt-names
      arm64: dts: renesas: r9a07g044: Add I2C interrupt-names
      dt-bindings: i2c: renesas,riic: Make interrupt-names required

Lad Prabhakar (4):
      dt-bindings: clock: r9a07g044-cpg: Add entry for P0_DIV2 core clock
      arm64: dts: renesas: r9a07g044: Add pinctrl node
      arm64: dts: renesas: r9a07g044: Add ADC node
      arm64: dts: renesas: r9a07g044: Add CANFD node

 .../devicetree/bindings/i2c/renesas,riic.yaml      |  30 ++++--
 arch/arm/boot/dts/r7s72100.dtsi                    |   8 ++
 arch/arm/boot/dts/r7s9210.dtsi                     |   8 ++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         | 104 +++++++++++++++++++++
 include/dt-bindings/clock/r9a07g044-cpg.h          |   1 +
 5 files changed, 143 insertions(+), 8 deletions(-)
