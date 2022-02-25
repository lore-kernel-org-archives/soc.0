Return-Path: <SRS0=3pCC=TI=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A43EC433FE
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 10:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67069C340F5; Fri, 25 Feb 2022 10:24:48 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28D2EC340E7
	for <soc@kernel.org>; Fri, 25 Feb 2022 10:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28D2EC340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7d31:13ed:51c6:c7cc])
	by albert.telenet-ops.be with bizsmtp
	id zNQe2600C0mlTBr06NQeiQ; Fri, 25 Feb 2022 11:24:38 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nNXmA-0020l2-18; Fri, 25 Feb 2022 11:24:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nNXm9-00DHXc-GJ; Fri, 25 Feb 2022 11:24:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM DT updates for v5.18 (take two)
Date: Fri, 25 Feb 2022 11:24:33 +0100
Message-Id: <cover.1645784466.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645784465.git.geert+renesas@glider.be>
References: <cover.1645784465.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c65ad12785205d5c57bd92e19d0296f93c19e33:

  arm64: dts: renesas: rzg2lc-smarc: Use SW_SD0_DEV_SEL macro for eMMC/SDHI device selection (2022-02-08 09:48:28 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.18-tag2

for you to fetch changes up to 6a3b10e5c312cae4c1fc7a27bf9a030360999351:

  ARM: dts: renesas: Align GPIO hog names with dtschema (2022-02-24 13:51:48 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.18 (take two)

  - Document the use of the renesas-soc IRC channel,
  - Watchdog support for the R-Car S4-8, RZ/N1D, and RZ/G2LC SoCs on the
    Spider, RZN1D-DB, and RZ/G2LC SMARC EVK development boards,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: rzg2lc-smarc-som: Enable watchdog

Geert Uytterhoeven (4):
      arm64: dts: renesas: r8a779f0: Add RWDT node
      arm64: dts: renesas: spider-cpu: Enable watchdog timer
      arm64: dts: renesas: Align GPIO hog names with dtschema
      ARM: dts: renesas: Align GPIO hog names with dtschema

Jean-Jacques Hiblot (3):
      dt-bindings: clock: r9a06g032: Add the definition of the watchdog clock
      ARM: dts: r9a06g032: Add the watchdog nodes
      ARM: dts: r9a06g032-rzn1d400-db: Enable watchdog0 with a 60s timeout

Nikita Yushchenko (1):
      arm64: dts: renesas: ulcb-kf: fix wrong comment

Sergey Shtylyov (2):
      MAINTAINERS: Specify IRC channel for Renesas ARM32 port
      MAINTAINERS: Specify IRC channel for Renesas ARM64 port

 MAINTAINERS                                              |  2 ++
 arch/arm/boot/dts/iwg20d-q7-common.dtsi                  |  2 +-
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts            |  2 +-
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts          |  4 ++--
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts                  |  4 ++--
 arch/arm/boot/dts/r8a7742-iwg21m.dtsi                    |  2 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts                |  2 +-
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts              |  5 +++++
 arch/arm/boot/dts/r9a06g032.dtsi                         | 16 ++++++++++++++++
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi      |  2 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi           |  2 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi     |  2 +-
 .../arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts |  2 +-
 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi     |  5 +++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi                | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts        |  4 ++--
 arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi |  4 ++--
 .../arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  2 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi        | 14 ++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi                 |  2 +-
 include/dt-bindings/clock/r9a06g032-sysctrl.h            |  1 +
 21 files changed, 71 insertions(+), 18 deletions(-)
