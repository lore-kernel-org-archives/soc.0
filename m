Return-Path: <SRS0=ooR/=E7=nxp.com=leoyang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47950C56201
	for <soc@archiver.kernel.org>; Wed, 25 Nov 2020 16:59:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0E6002158C; Wed, 25 Nov 2020 16:59:17 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91D40206D8;
	Wed, 25 Nov 2020 16:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91D40206D8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=leoyang.li@nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EC05A200A53;
	Wed, 25 Nov 2020 17:59:14 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com [134.27.49.11])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B461D2009E6;
	Wed, 25 Nov 2020 17:59:14 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
	by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id EA5BC40011;
	Wed, 25 Nov 2020 09:59:13 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl driver changes for next (v5.11)
Date: Wed, 25 Nov 2020 10:59:13 -0600
Message-Id: <20201125165913.15441-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi arm-soc maintainers,

Please find the pull request for NXP/FSL SoC drivers.

Regards,
Leo

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git tags/soc-fsl-next-v5.11

for you to fetch changes up to e95f287deed2454b8cad5b27859271db30130b2b:

  soc: fsl: handle RCPM errata A-008646 on SoC LS1021A (2020-11-23 19:16:02 -0600)

----------------------------------------------------------------
NXP/FSL SoC driver updates for v5.11

- Add RCPM errata workaround for A-008646 on LS1021A
- Various W=1 warning fixes for fsl/soc drivers

----------------------------------------------------------------
Biwen Li (1):
      soc: fsl: handle RCPM errata A-008646 on SoC LS1021A

Lee Jones (3):
      soc: fsl: dpio: qbman-portal: Fix a bunch of kernel-doc misdemeanours
      soc: fsl: qe: qe_common: Fix misnamed function attribute 'addr'
      soc: fsl: qbman: qman: Remove unused variable 'dequeue_wq'

 drivers/soc/fsl/dpio/qbman-portal.c | 18 +++++++++++++-----
 drivers/soc/fsl/qbman/qman.c        |  8 ++------
 drivers/soc/fsl/qe/qe_common.c      |  2 +-
 drivers/soc/fsl/rcpm.c              | 35 ++++++++++++++++++++++++++++++++++-
 4 files changed, 50 insertions(+), 13 deletions(-)
