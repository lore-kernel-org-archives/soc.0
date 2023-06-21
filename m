Return-Path: <SRS0=I3vw=CJ=nxp.com=leoyang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F600EB64D7
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 22:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FE7FC433C9; Wed, 21 Jun 2023 22:25:17 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B08B1C433C0;
	Wed, 21 Jun 2023 22:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B08B1C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3D89F2009E4;
	Thu, 22 Jun 2023 00:25:05 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com [134.27.49.11])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0194F200359;
	Thu, 22 Jun 2023 00:25:05 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.134])
	by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id D4B304058C;
	Wed, 21 Jun 2023 15:25:03 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl drivers changes for next(v6.5)
Date: Wed, 21 Jun 2023 17:25:03 -0500
Message-Id: <20230621222503.12402-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi soc maintainers,

Please merge the following new changes for soc/fsl drivers.

Regards,
Leo

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git tags/soc-fsl-next-v6.5

for you to fetch changes up to fb9c384625dd604e8a5be1f42b35e83104b90670:

  bus: fsl-mc: fsl-mc-allocator: Drop a write-only variable (2023-06-08 17:56:26 -0500)

----------------------------------------------------------------
NXP/FSL SoC driver updates for v6.5

- fsl-mc: Make remove function return void
- QE USB: fix build issue caused by missing dependency

----------------------------------------------------------------
Randy Dunlap (1):
      soc/fsl/qe: fix usb.c build errors

Uwe Kleine-König (8):
      bus: fsl-mc: Only warn once about errors on device unbind
      bus: fsl-mc: dprc: Push down error message from fsl_mc_driver_remove()
      bus: fsl-mc: fsl-mc-allocator: Drop if block with always wrong condition
      bus: fsl-mc: fsl-mc-allocator: Improve error reporting
      soc: fsl: dpio: Suppress duplicated error reporting on device remove
      bus: fsl-mc: Make remove function return void
      bus: fsl-mc: fsl-mc-allocator: Initialize mc_bus_dev before use
      bus: fsl-mc: fsl-mc-allocator: Drop a write-only variable

 drivers/bus/fsl-mc/dprc-driver.c                   | 12 ++++----
 drivers/bus/fsl-mc/fsl-mc-allocator.c              | 35 +++++++++++-----------
 drivers/bus/fsl-mc/fsl-mc-bus.c                    |  7 +----
 drivers/crypto/caam/caamalg_qi2.c                  |  4 +--
 drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c            |  4 +--
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c   |  4 +--
 drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c   |  4 +--
 .../net/ethernet/freescale/dpaa2/dpaa2-switch.c    |  4 +--
 drivers/soc/fsl/dpio/dpio-driver.c                 |  8 +----
 drivers/soc/fsl/qe/Kconfig                         |  1 +
 drivers/vfio/fsl-mc/vfio_fsl_mc.c                  |  3 +-
 include/linux/fsl/mc.h                             |  2 +-
 12 files changed, 32 insertions(+), 56 deletions(-)
