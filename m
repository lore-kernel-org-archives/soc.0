Return-Path: <SRS0=ScXQ=PO=nxp.com=leoyang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA296C433F5
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 23:57:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 97A0F61002; Tue, 26 Oct 2021 23:57:47 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5218360F91;
	Tue, 26 Oct 2021 23:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5218360F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DC497201A2F;
	Wed, 27 Oct 2021 01:57:45 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com [134.27.49.11])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A381E201A03;
	Wed, 27 Oct 2021 01:57:45 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
	by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id D812B40007;
	Tue, 26 Oct 2021 16:57:44 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org
Subject: [GIT PULL v2] soc/fsl drivers changes for fix(v5.15)
Date: Tue, 26 Oct 2021 18:57:44 -0500
Message-Id: <20211026235744.19258-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi soc maintainers,

Please merge the following new changes for soc/fsl drivers.

Regards,
Leo

v2:
Dropped "soc: fsl: dpio: fix qbman alignment error in the virtualization context"

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git tags/soc-fsl-fix-v5.15-2

for you to fetch changes up to 8120bd469f5525da229953c1197f2b826c0109f4:

  soc: fsl: dpaa2-console: free buffer before returning from dpaa2_console_read (2021-10-21 18:19:52 -0500)

----------------------------------------------------------------
NXP/FSL SoC driver fixes for v5.15

DPAA2 DPIO driver
- replace smp_processor_id with raw_smp_processor_id to fix preempt
debug BUG
- use the combined functions to protect critical zone to fix deadlock

DPAA2 console
- free buffer before returning from dpaa2_console_read

----------------------------------------------------------------
Meng Li (2):
      soc: fsl: dpio: replace smp_processor_id with raw_smp_processor_id
      soc: fsl: dpio: use the combined functions to protect critical zone

Robert-Ionut Alexa (1):
      soc: fsl: dpaa2-console: free buffer before returning from dpaa2_console_read

 drivers/soc/fsl/dpaa2-console.c     | 1 +
 drivers/soc/fsl/dpio/dpio-service.c | 2 +-
 drivers/soc/fsl/dpio/qbman-portal.c | 9 +++------
 3 files changed, 5 insertions(+), 7 deletions(-)
