Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D72C77B61
	for <soc@archiver.kernel.org>; Sat,  8 Apr 2023 10:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D9DBC4339C; Sat,  8 Apr 2023 10:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588C6C433EF;
	Sat,  8 Apr 2023 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680949214;
	bh=xOQ4BTvvLPiVNzmxhzCg2KDJTE9sH3/2ELVB+Ze+ef4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiWPBx9yQntW++CSgEirKN/xFfyvMv3yErEqGu69uNmVySTnTQDjqgPKh3Ko3pwmU
	 AQ+yzqTYwSK20WJGtWnQ3WIHcDaBkrDg2SglAxYCianAJs04mwTiHJP04Pi66pLoZY
	 eWQ84zL5uQl4xm+kxbgAiynLUjdLHufUpJmBnZr1f1z491XKP82y7wN+jpua5iM/UK
	 LdzhaSnTy5lT333C9G0/5qeBzIlAQXfoUbro2zHydPKGyVxnBHBHFvC8cW8SZWIdsi
	 slvL4bPnvbEE4/P47+96SKRlBAf304Lie7uza2GgBcbx+cY1WGDeH/wF8f0L1Ysfsi
	 uAoEB49SK+J0A==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] i.MX arm32 device tree changes for 6.4
Date: Sat,  8 Apr 2023 18:19:26 +0800
Message-Id: <20230408101928.280271-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230408101928.280271-1-shawnguo@kernel.org>
References: <20230408101928.280271-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.4

for you to fetch changes up to 5e4f393ccbf0af0828ab0914695649a5b90db230:

  ARM: dts: imx6ull: Add chargebyte Tarragon support (2023-04-06 09:45:27 +0800)

----------------------------------------------------------------
i.MX arm32 device tree changes for 6.4:

- New board device trees: Tolino Vison, chargebyte Tarragon,
  new revision of the IOTA board.
- A couple of imx7d-remarkable2 update to enable cyttsp5 touch and
  BD71815 PMIC.
- A series from Oleksij Rempel to configure Ethernet reference clock
  from device tree.
- A series from Stefan Wahren to use label references for i.MX28 based
  boards.

----------------------------------------------------------------
Alistair Francis (2):
      ARM: dts: imx7d-remarkable2: Enable the cyttsp5
      ARM: dts: imx7d-remarkable2: Enable the rohm,bd71815

Andreas Kemnade (1):
      ARM: dts: imx: Add devicetree for Tolino Vison

Michael Tretter (1):
      ARM: dts: imx7d: add node for PXP

Michal Vokáč (5):
      ARM: dts: imx6dl-yapp4: Use reset-gpios property name
      ARM: dts: imx6dl-yapp4: Move phy reset into switch node
      ARM: dts: imx6dl-yapp4: Move status to the end of property list
      ARM: dts: imx6dl-yapp4: Remove unneeded status "okay"
      ARM: dts: imx6dl-yapp43: Add support for new HW revision of the IOTA board

Oleksij Rempel (12):
      ARM: dts: imx6qdl: use enet_clk_ref instead of enet_out for the FEC node
      ARM: dts: imx6dl-lanmcu: configure ethernet reference clock parent
      ARM: dts: imx6dl-alti6p: configure ethernet reference clock parent
      ARM: dts: imx6dl-plybas: configure ethernet reference clock parent
      ARM: dts: imx6dl-plym2m: configure ethernet reference clock parent
      ARM: dts: imx6dl-prtmvt: configure ethernet reference clock parent
      ARM: dts: imx6dl-victgo: configure ethernet reference clock parent
      ARM: dts: imx6q-prtwd2: configure ethernet reference clock parent
      ARM: dts: imx6qdl-skov-cpu: configure ethernet reference clock parent
      ARM: dts: imx6dl-eckelmann-ci4x10: configure ethernet reference clock parent
      ARM: dts: imx6ul: set enet_clk_ref to CLK_ENETx_REF_SEL
      ARM: dts: imx6ul-prti6g: configure ethernet reference clock parent

Stefan Wahren (10):
      ARM: dts: imx28-apf28: Convert to use label references
      ARM: dts: imx28-m28/sps1: Convert to use label references
      ARM: dts: imx28-apx4devkit: Convert to use label references
      ARM: dts: imx28-cfa10036: Convert to use label references
      ARM: dts: imx28-duckbill: Convert to use label references
      ARM: dts: imx28-duckbill-2: Include base board
      ARM: dts: imx28-evk: Convert to use label references
      ARM: dts: imx28-ts4600: Convert to use label references
      ARM: dts: imx28-tx28: add SPDX-License-Identifier
      ARM: dts: imx6ull: Add chargebyte Tarragon support

 arch/arm/boot/dts/Makefile                      |   9 +
 arch/arm/boot/dts/imx28-apf28.dts               |  96 ++-
 arch/arm/boot/dts/imx28-apf28dev.dts            | 312 +++++----
 arch/arm/boot/dts/imx28-apx4devkit.dts          | 380 ++++++-----
 arch/arm/boot/dts/imx28-cfa10036.dts            | 193 +++---
 arch/arm/boot/dts/imx28-cfa10049.dts            | 454 ++++++-------
 arch/arm/boot/dts/imx28-cfa10055.dts            | 224 +++----
 arch/arm/boot/dts/imx28-cfa10056.dts            | 146 ++--
 arch/arm/boot/dts/imx28-cfa10057.dts            | 252 ++++---
 arch/arm/boot/dts/imx28-cfa10058.dts            | 186 +++---
 arch/arm/boot/dts/imx28-duckbill-2-485.dts      | 174 +----
 arch/arm/boot/dts/imx28-duckbill-2-enocean.dts  | 198 +-----
 arch/arm/boot/dts/imx28-duckbill-2-spi.dts      | 211 ++----
 arch/arm/boot/dts/imx28-duckbill-2.dts          | 256 ++++---
 arch/arm/boot/dts/imx28-duckbill.dts            | 196 +++---
 arch/arm/boot/dts/imx28-evk.dts                 | 462 +++++++------
 arch/arm/boot/dts/imx28-m28.dtsi                |  44 +-
 arch/arm/boot/dts/imx28-m28cu3.dts              | 354 +++++-----
 arch/arm/boot/dts/imx28-m28evk.dts              | 420 ++++++------
 arch/arm/boot/dts/imx28-sps1.dts                | 201 +++---
 arch/arm/boot/dts/imx28-ts4600.dts              |  80 +--
 arch/arm/boot/dts/imx28-tx28.dts                |  38 +-
 arch/arm/boot/dts/imx6dl-alti6p.dts             |  12 +-
 arch/arm/boot/dts/imx6dl-eckelmann-ci4x10.dts   |  13 +-
 arch/arm/boot/dts/imx6dl-lanmcu.dts             |  12 +-
 arch/arm/boot/dts/imx6dl-plybas.dts             |  12 +-
 arch/arm/boot/dts/imx6dl-plym2m.dts             |  12 +-
 arch/arm/boot/dts/imx6dl-prtmvt.dts             |  11 +-
 arch/arm/boot/dts/imx6dl-victgo.dts             |  12 +-
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi      |   9 +-
 arch/arm/boot/dts/imx6dl-yapp4-lynx.dts         |  58 ++
 arch/arm/boot/dts/imx6dl-yapp4-phoenix.dts      |  42 ++
 arch/arm/boot/dts/imx6dl-yapp43-common.dtsi     | 615 +++++++++++++++++
 arch/arm/boot/dts/imx6q-prtwd2.dts              |  17 +-
 arch/arm/boot/dts/imx6q-yapp4-pegasus.dts       |  58 ++
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi         |  12 +-
 arch/arm/boot/dts/imx6qdl.dtsi                  |   4 +-
 arch/arm/boot/dts/imx6qp-yapp4-pegasus-plus.dts |  58 ++
 arch/arm/boot/dts/imx6sl-tolino-vision.dts      | 490 ++++++++++++++
 arch/arm/boot/dts/imx6ul-prti6g.dts             |  14 +-
 arch/arm/boot/dts/imx6ul.dtsi                   |  10 +-
 arch/arm/boot/dts/imx6ull-tarragon-common.dtsi  | 852 ++++++++++++++++++++++++
 arch/arm/boot/dts/imx6ull-tarragon-master.dts   |  82 +++
 arch/arm/boot/dts/imx6ull-tarragon-micro.dts    |  10 +
 arch/arm/boot/dts/imx6ull-tarragon-slave.dts    |  32 +
 arch/arm/boot/dts/imx6ull-tarragon-slavext.dts  |  64 ++
 arch/arm/boot/dts/imx7d-remarkable2.dts         | 239 +++++++
 arch/arm/boot/dts/imx7d.dtsi                    |   9 +
 48 files changed, 4852 insertions(+), 2793 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-yapp4-lynx.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-yapp4-phoenix.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-yapp43-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-yapp4-pegasus.dts
 create mode 100644 arch/arm/boot/dts/imx6qp-yapp4-pegasus-plus.dts
 create mode 100644 arch/arm/boot/dts/imx6sl-tolino-vision.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-master.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-micro.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slave.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slavext.dts
