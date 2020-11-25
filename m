Return-Path: <SRS0=ooR/=E7=nxp.com=leoyang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB9AC56202
	for <soc@archiver.kernel.org>; Wed, 25 Nov 2020 16:59:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9B10F21527; Wed, 25 Nov 2020 16:59:25 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AC0206D8;
	Wed, 25 Nov 2020 16:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35AC0206D8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=leoyang.li@nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C6C851A1897;
	Wed, 25 Nov 2020 17:59:23 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com [134.27.49.11])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8E9121A189F;
	Wed, 25 Nov 2020 17:59:23 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
	by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id C4C6640011;
	Wed, 25 Nov 2020 09:59:22 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl driver fix for 5.10
Date: Wed, 25 Nov 2020 10:59:22 -0600
Message-Id: <20201125165922.15487-1-leoyang.li@nxp.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git tags/soc-fsl-fix-v5.10

for you to fetch changes up to 2663b3388551230cbc4606a40fabf3331ceb59e4:

  soc: fsl: dpio: Get the cpumask through cpumask_of(cpu) (2020-11-23 19:27:45 -0600)

----------------------------------------------------------------
NXP/FSL SoC driver fix for 5.10

DPAA2 DPIO driver
- Fix non-static cpumask for irq affinity setting

----------------------------------------------------------------
Hao Si (1):
      soc: fsl: dpio: Get the cpumask through cpumask_of(cpu)

 drivers/soc/fsl/dpio/dpio-driver.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
