Return-Path: <SRS0=P2QD=FG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9967AC64E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 341AA21D42
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 341AA21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sA8g90wVz9pgym14adn1R1dLtXR8sxsvmEV7mQ1j6nI=; b=l8Yi9UpPaCRsbDGVhV35zxd6p/
	HZwnfgzTQ+Ip+T35+nK06Ltg3KCox1SFfGBTapL1c7KzXq3m3ZsRFUULhZaj3ccsNhbSnUcr8ci7b
	MiaobnEruHNZifr8rmkXz9qYli/8/a0UuXfxXJ3XeQuGuYHOTQyVYB9ZZmtvY4b1WD6HBonDDiqxD
	Cr4dwMIxnEOCeLQNEnKhPnjwDSLD20tpULR41gN9rKfeCEX2apviWaJ68VfoIcEACpqPzR8FgnN3B
	BTyI72RpDV7scbyLqV6zS++yrXHSVa3kfB5Z2ehR9qRZhCobN9/e8A0PPbWrF87DEy9zWwq1IRb3n
	335uMEjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkT6v-0005P0-D1; Wed, 02 Dec 2020 14:28:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkT6p-0005ND-PZ
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Dec 2020 14:27:58 +0000
From: Shawn Guo <shawnguo@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Subject: [GIT PULL 5/6] i.MX arm64 device tree change for 5.11
Date: Wed,  2 Dec 2020 22:27:16 +0800
Message-Id: <20201202142717.9262-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142717.9262-1-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_092756_034003_5CF19FB7 
X-CRM114-Status: GOOD (  14.59  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.11

for you to fetch changes up to 0b84862688951ad5f6ad8990dd9a44e1363c4a2b:

  arm64: dts: imx8mm-beacon-som: Assign PMIC clock (2020-12-01 09:49:49 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 5.11:

- New board support: LX2162A QDS, Kontron i.MX8M Mini SoMs and
  baseboards.
- A number of patches from Adam Ford to add various audio devices for
  i.MX8MM/MN and update imx8mm-beacon-som board on QSPI NOR and RTC.
- Correct WDOG_B pin configuration for i.MX8MM/MN/MP.
- A series from Ioana Ciornei complete the MAC/PCS/PHY representation
  on DPAA2 devices.
- Add PMU device for i.MX8MP/MN.
- Add IR and CAN support for i.MX8MP/MN/MM EVK board.
- Adjust GIC CPU mask to match number of CPUs for i.MX8MP/MN/MM.
- A series of patch from Michael Walle to update LS1028A support with
  addition of CAN and OPTEE, also ENETC PTP and FlexSPI clock input
  correction.
- Add SPDIF sound card support on imx8mq-evk board.
- Misc random updates and device additions.

----------------------------------------------------------------
Adam Ford (11):
      arm64: dts: imx8mm-beacon-som: Configure supplies on secondary cpus
      arm64: dts: imx8mm-beacon-som: Add QSPI NOR flash support
      arm64: dts: imx8mm: Add support for micfil
      arm64: dts: imx8mm: Add node for SPDIF
      arm64: dts: imx8mm-beacon-som: Fix whitespace issue
      arm64: dts: imx8mn: Enable Asynchronous Sample Rate Converter
      arm64: dts: imx8mn: Add SAI nodes
      arm64: dts: imx8mn: Add support for micfil
      arm64: dts: imx8mn: Add node for SPDIF
      arm64: dts: imx8mm-beacon-som: Configure RTC aliases
      arm64: dts: imx8mm-beacon-som: Assign PMIC clock

Anson Huang (4):
      arm64: dts: imx8mn-evk: Add cpu-supply to enable cpufreq
      arm64: dts: imx8mm: Correct WDOG_B pin configuration
      arm64: dts: imx8mn: Correct WDOG_B pin configuration
      arm64: dts: imx8mp-evk: Correct WDOG_B pin configuration

Frieder Schrempf (1):
      arm64: dts: Add the Kontron i.MX8M Mini SoMs and baseboards

Ioana Ciornei (9):
      arm64: dts: ls1088a: add external MDIO device nodes
      arm64: dts: ls1088ardb: add QSGMII PHY nodes
      arm64: dts: ls1088ardb: add necessary DTS nodes for DPMAC2
      arm64: dts: ls208xa: add the external MDIO nodes
      arm64: dts: ls2088ardb: add PHY nodes for the CS4340 PHYs
      arm64: dts: ls2088ardb: add PHY nodes for the AQR405 PHYs
      arm64: dts: ls208xa: add PCS MDIO and PCS PHY nodes
      arm64: dts: lx2160a: add PCS MDIO and PCS PHY nodes
      arm64: dts: lx2160ardb: add nodes for the AQR107 PHYs

Jacky Bai (2):
      arm64: dts: freescale: Add pmu support on imx8mp
      arm64: dts: freescale: Add pmu support on imx8mn

Joakim Zhang (4):
      arm64: dts: imx8mp-evk: add CAN support
      arm64: dts: imx8mq-evk: add linux,autosuspend-period property for IR
      arm64: dts: imx8mm-evk: add IR support
      arm64: dts: imx8mn-evk: add IR support

Krzysztof Kozlowski (5):
      arm64: dts: imx8mq-librem5: align GPIO hog names with dtschema
      arm64: dts: freescale: align watchdog node name with dtschema
      arm64: dts: imx8mm: adjust GIC CPU mask to match number of CPUs
      arm64: dts: imx8mn: adjust GIC CPU mask to match number of CPUs
      arm64: dts: imx8mp: adjust GIC CPU mask to match number of CPUs

Meenakshi Aggarwal (1):
      arm64: dts: lx2160a: add device tree for lx2162aqds board

Michael Walle (6):
      arm64: dts: ls1028a: add missing CAN nodes
      arm64: dts: freescale: sl28: add CAN node
      arm64: dts: ls1028a: fix ENETC PTP clock input
      arm64: dts: ls1028a: fix FlexSPI clock input
      arm64: dts: ls1028a: add optee node
      arm64: dts: freescale: sl28: combine SPI MTD partitions

Nathan Chancellor (1):
      arm64: dts: imx: Fix imx8mm-kontron-n801x-s.dtb target

Serge Semin (1):
      arm64: dts: layerscape: Harmonize DWC USB3 DT nodes name

Shengjiu Wang (2):
      arm64: dts: imx8mq: Configure clock rate for audio plls
      arm64: dts: imx8mq-evk: Add spdif sound card support

Vladimir Oltean (1):
      arm64: dts: ls1028a: make the eMMC and SD card controllers use fixed indices

Xiaowei Bao (1):
      arm64: dts: layerscape: Add PCIe EP node for ls1088a

Yuantian Tang (1):
      arm64: dts: freescale: update calibration table for TMU module

 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  69 +++--
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |  18 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  30 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  86 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  72 ++---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  | 119 ++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     | 136 ++++++++-
 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts  | 120 ++++++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     | 278 +++++++++++++++--
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |  32 ++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     | 288 ++++++++++++++++--
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  | 334 +++++++++++++++++++++
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      | 326 +++++++++++---------
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |  16 +-
 .../boot/dts/freescale/imx8mm-kontron-n801x-s.dts  | 322 ++++++++++++++++++++
 .../dts/freescale/imx8mm-kontron-n801x-som.dtsi    | 294 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |   2 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  53 +++-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dts       |  32 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |  16 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |   2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          | 158 +++++++++-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  64 +++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  45 ++-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |  39 +++
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  68 ++++-
 30 files changed, 2681 insertions(+), 346 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-som.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
