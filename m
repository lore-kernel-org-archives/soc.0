Return-Path: <SRS0=AkBI=PK=nxp.com=leoyang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DFEC433EF
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 01:00:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A790E6137D; Fri, 22 Oct 2021 01:00:30 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 680A16136F;
	Fri, 22 Oct 2021 01:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 680A16136F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 12F221A1ADF;
	Fri, 22 Oct 2021 03:00:29 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com [134.27.49.11])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CB7941A1ADD;
	Fri, 22 Oct 2021 03:00:28 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
	by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id 0E6A040007;
	Thu, 21 Oct 2021 18:00:28 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl drivers changes for fix(v5.15)
Date: Thu, 21 Oct 2021 20:00:26 -0500
Message-Id: <20211022010027.11866-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi soc maintainers,

Please merge the following new changes for soc/fsl drivers.

Regards,
Leo

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git tags/soc-fsl-fix-v5.15

for you to fetch changes up to 7e5e744183bbb0ad02412b21b1e61380c998dd18:

  soc: fsl: dpio: fix qbman alignment error in the virtualization context (2021-10-21 18:20:21 -0500)

----------------------------------------------------------------
NXP/FSL SoC driver fixes for v5.15

DPAA2 DPIO driver
- replace smp_processor_id with raw_smp_processor_id to fix preempt
debug BUG
- use the combined functions to protect critical zone to fix deadlock
- fix qbman alignment error in the virtualization context

DPAA2 console
- free buffer before returning from dpaa2_console_read

----------------------------------------------------------------
Diana Craciun (1):
      soc: fsl: dpio: fix qbman alignment error in the virtualization context

Meng Li (2):
      soc: fsl: dpio: replace smp_processor_id with raw_smp_processor_id
      soc: fsl: dpio: use the combined functions to protect critical zone

Robert-Ionut Alexa (1):
      soc: fsl: dpaa2-console: free buffer before returning from dpaa2_console_read

 drivers/soc/fsl/dpaa2-console.c     |  1 +
 drivers/soc/fsl/dpio/dpio-service.c |  2 +-
 drivers/soc/fsl/dpio/qbman-portal.c | 33 +++++++++++++++------------------
 3 files changed, 17 insertions(+), 19 deletions(-)
