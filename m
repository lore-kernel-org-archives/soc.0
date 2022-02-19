Return-Path: <SRS0=A01h=TC=nxp.com=leoyang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E42C433EF
	for <soc@archiver.kernel.org>; Sat, 19 Feb 2022 01:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F143C340EC; Sat, 19 Feb 2022 01:22:18 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E3F0C340E9;
	Sat, 19 Feb 2022 01:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E3F0C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A1B551A0564;
	Sat, 19 Feb 2022 02:22:09 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com [134.27.49.11])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 65DE61A008E;
	Sat, 19 Feb 2022 02:22:09 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
	by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id 5881940050;
	Fri, 18 Feb 2022 18:22:08 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl drivers changes for fix (v5.17)
Date: Fri, 18 Feb 2022 19:22:08 -0600
Message-Id: <20220219012208.21835-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi soc maintainers,

Please merge the following changes for soc/fsl drivers.

Regards,
Leo

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git tags/soc-fsl-fix-v5.17

for you to fetch changes up to a222fd8541394b36b13c89d1698d9530afd59a9c:

  soc: fsl: qe: Check of ioremap return value (2022-02-18 17:11:23 -0600)

----------------------------------------------------------------
NXP/FSL SoC driver fixes for v5.17

- Add missing SoC compatible in existing binding
- Replace kernel.h with the necessary inclusions
- MAINTAINERS file fixes
- Fix memory allocation failure check in guts driver
- Various cleanups and minor fixes

----------------------------------------------------------------
Andy Shevchenko (3):
      soc: fsl: Replace kernel.h with the necessary inclusions
      soc: fsl: Correct MAINTAINERS database (QUICC ENGINE LIBRARY)
      soc: fsl: Correct MAINTAINERS database (SOC)

Christophe JAILLET (2):
      soc: fsl: guts: Revert commit 3c0d64e867ed
      soc: fsl: guts: Add a missing memory allocation failure check

Jason Wang (1):
      soc: fsl: qe: fix typo in a comment

Jiasheng Jiang (1):
      soc: fsl: qe: Check of ioremap return value

Li Yang (2):
      dt-bindings: qoriq-clock: add missing compatible for lx2160a
      dt-bindings: fsl,layerscape-dcfg: add missing compatible for lx2160a

 .../bindings/arm/freescale/fsl,layerscape-dcfg.txt         |  2 +-
 Documentation/devicetree/bindings/clock/qoriq-clock.txt    |  1 +
 MAINTAINERS                                                |  4 ++--
 drivers/soc/fsl/guts.c                                     | 14 +++++++++-----
 drivers/soc/fsl/qe/qe.c                                    |  4 ++--
 drivers/soc/fsl/qe/qe_io.c                                 |  2 ++
 include/soc/fsl/dpaa2-fd.h                                 |  3 ++-
 include/soc/fsl/qe/immap_qe.h                              |  3 ++-
 include/soc/fsl/qe/qe_tdm.h                                |  4 +++-
 include/soc/fsl/qe/ucc_fast.h                              |  2 +-
 include/soc/fsl/qe/ucc_slow.h                              |  2 +-
 11 files changed, 26 insertions(+), 15 deletions(-)
