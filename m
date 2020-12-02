Return-Path: <SRS0=P2QD=FG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F12EC71156
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E76F6221EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E76F6221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TafCFhmUvvNO82Wp5yPbfxSVgqYy4aWbBfmCpqn0Jwg=; b=1yesP3SEPtlHZCUGBG/k5R1Bld
	Fdnz0+rvcZUu8VYxixurVbH8nxuO/jAY0yC23NQe7xpQ+R8Ti1ss9kKwMPRcb+IGCfPEW9Dide/Do
	ftHYwpZdbRefs0cZhb/SDdhoxeG9uZ8wbOSBFC5OaumJcfpCQYm5+FEOLzf3K4KPtV4FN6i+VmF9r
	uxT7dkE16J1IYgYGjDrJC5H8oU1Xi9JN5p+I4+DsCYPJk1QUjx0PjWh+9Ky6haiG9wGQr6h7sNL1O
	SDbLQtjRh5k2bAPPhQpldmLoIX2YRthiVDx5qQwsBTKkofU9cWRANw5/0On9VTT/ntcphqCoag2UI
	cNLC/DOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkT6o-0005MQ-F4; Wed, 02 Dec 2020 14:27:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkT6j-0005Kr-G5
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Dec 2020 14:27:50 +0000
From: Shawn Guo <shawnguo@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Subject: [GIT PULL 3/6] i.MX DT bindings update for 5.11
Date: Wed,  2 Dec 2020 22:27:14 +0800
Message-Id: <20201202142717.9262-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142717.9262-1-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_092749_717954_984881FF 
X-CRM114-Status: GOOD (  10.29  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.11

for you to fetch changes up to 747ec53ea72a548693d0664817776d3634e9b63a:

  dt-bindings: arm: fsl: add Protonic WD3 board (2020-12-01 09:27:55 +0800)

----------------------------------------------------------------
i.MX DT bindings update for 5.11:

- Quite some patches that update vendor-prefixes.yaml and fsl.yaml to
  document missing board compatibles and add new board compatibles.
- A couple of patches from Dong Aisheng to update imx-scu firmware and
  imx-lpcg clock bindings for new SCU two cells clock support.
- A couple of net bindings update from Ioana Ciornei to complete the
  MAC/PCS/PHY representation on DPAA2 devices.
- Document watchdog compatibles for all i.MX and Layerscape devices.

----------------------------------------------------------------
Bruno Thomsen (1):
      dt-bindings: fsl: add kamstrup flex concentrator to schema

Dong Aisheng (2):
      dt-bindings: firmware: imx-scu: new binding to parse clocks from device tree
      dt-bindings: clock: imx-lpcg: add support to parse clocks from device tree

Frieder Schrempf (1):
      dt-bindings: arm: fsl: Add Kontron i.MX8M Mini SoMs and boards

Ioana Ciornei (2):
      dt-bindings: net: add the DPAA2 MAC DTS definition
      dt-bindings: net: add the 10gbase-r connection type

Krzysztof Kozlowski (21):
      dt-bindings: arm: fsl: document i.MX25 and i.MX27 boards
      dt-bindings: watchdog: fsl-imx: document NXP compatibles
      dt-bindings: vendor-prefixes: add MicroSys
      dt-bindings: vendor-prefixes: add Revotics
      dt-bindings: arm: fsl: document i.MX51 boards
      dt-bindings: arm: fsl: document i.MX53 boards
      dt-bindings: arm: fsl: document VF boards
      dt-bindings: arm: fsl: document i.MX6DL boards
      dt-bindings: vendor-prefixes: add ABB
      dt-bindings: arm: fsl: document i.MX6DL Aristainetos boards
      dt-bindings: vendor-prefixes: add Element14
      dt-bindings: arm: fsl: document i.MX6Q boards
      dt-bindings: arm: fsl: document i.MX6QP boards
      dt-bindings: arm: fsl: document i.MX6SL boards
      dt-bindings: arm: fsl: document i.MX6SX boards
      dt-bindings: arm: fsl: document i.MX6UL boards
      dt-bindings: arm: fsl: document i.MX6ULL boards
      dt-bindings: arm: fsl: document i.MX7D boards
      dt-bindings: arm: fsl: document LS1012A FRWY board
      dt-bindings: arm: fsl: document SolidRun LX2160A boards
      dt-bindings: arm: fsl: document i.MX7S boards

Matthias Schiffer (1):
      dt-bindings: arm: fsl: update TQ-Systems SoMs and boards based on i.MX7

Meenakshi Aggarwal (1):
      dt-bindings: fsl: add compatible for LX2162A QDS Board

Oleksij Rempel (6):
      dt-bindings: vendor-prefixes: Add an entry for Van der Laan b.v.
      dt-bindings: vendor-prefixes: Add an entry for Altus-Escon-Company
      dt-bindings: arm: fsl: add Altesco I6P board
      dt-bindings: arm: fsl: add Van der Laan LANMCU board
      dt-bindings: vendor-prefixes: add "virtual" prefix
      dt-bindings: arm: fsl: add Protonic WD3 board

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  12 +-
 Documentation/devicetree/bindings/arm/fsl.yaml     | 360 +++++++++++++++++++--
 .../devicetree/bindings/clock/imx8qxp-lpcg.yaml    |  79 +++--
 .../bindings/net/ethernet-controller.yaml          |   1 +
 .../bindings/net/fsl,qoriq-mc-dpmac.yaml           |  60 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  14 +
 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  |  16 +
 include/dt-bindings/clock/imx8-lpcg.h              |  14 +
 8 files changed, 502 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
