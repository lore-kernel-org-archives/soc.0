Return-Path: <SRS0=KCga=3S=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25CAC47088
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 16:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A0D9C433C1; Fri, 18 Nov 2022 16:45:24 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4D3CC4347C
	for <soc@kernel.org>; Fri, 18 Nov 2022 16:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4D3CC4347C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
	by baptiste.telenet-ops.be with bizsmtp
	id lslE2800229fmst01slEPe; Fri, 18 Nov 2022 17:45:14 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UK-000pAE-OJ; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UK-00Frgr-0M; Fri, 18 Nov 2022 17:45:12 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 6/7] Renesas RISC-V DT updates for v6.2
Date: Fri, 18 Nov 2022 17:45:03 +0100
Message-Id: <cover.1668788930.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
References: <cover.1668788918.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b9a0be2054964026aa58966ce9724b672f210835:

  arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts (2022-10-28 14:23:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-riscv-dt-for-v6.2-tag1

for you to fetch changes up to 40005cb6093e92d24a1bdbc444311c25e4b28878:

  riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C (2022-11-17 20:27:02 +0100)

----------------------------------------------------------------
Renesas RISC-V DT updates for v6.2

  - Add initial support for the Renesas RZ/Five SoC and the Renesas
    RZ/Five SMARC EVK development board.

----------------------------------------------------------------
Lad Prabhakar (5):
      riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
      riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
      MAINTAINERS: Add entry for Renesas RISC-V
      riscv: dts: renesas: r9a07g043f/rzfive-smarc-som: Enable ADC/OPP/Thermal Zones/TSU
      riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C

 MAINTAINERS                                        |  3 +-
 arch/riscv/boot/dts/Makefile                       |  1 +
 arch/riscv/boot/dts/renesas/Makefile               |  2 +
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi        | 59 ++++++++++++++++++++
 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts | 27 +++++++++
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi  | 47 ++++++++++++++++
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi      | 64 ++++++++++++++++++++++
 7 files changed, 202 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/renesas/Makefile
 create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
 create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
 create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
 create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
