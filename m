Return-Path: <SRS0=r8/T=NE=nxp.com=leoyang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021ECC4338F
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 22:23:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 932AA610FD; Fri, 13 Aug 2021 22:23:08 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 497C960F36;
	Fri, 13 Aug 2021 22:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 497C960F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0B4242002CD;
	Sat, 14 Aug 2021 00:23:07 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com [134.27.49.11])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C8B4320005D;
	Sat, 14 Aug 2021 00:23:06 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
	by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id 0BD8F40A55;
	Fri, 13 Aug 2021 15:23:06 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl drivers changes for fix(v5.14)
Date: Fri, 13 Aug 2021 17:23:05 -0500
Message-Id: <20210813222305.13663-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi soc maintainers,

Please merge the following fixes for soc/fsl drivers.

Regards,
Leo

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git tags/soc-fsl-fix-v5.14

for you to fetch changes up to c1e64c0aec8cb0499e61af7ea086b59abba97945:

  soc: fsl: qe: fix static checker warning (2021-08-13 16:56:10 -0500)

----------------------------------------------------------------
NXP/FSL SoC driver fixes for v5.14

QE interrupt controller driver
- Convert it to platform_device driver to make it work with fw_devlink
- Fix static analysis issue

----------------------------------------------------------------
Maxim Kochetkov (2):
      soc: fsl: qe: convert QE interrupt controller to platform_device
      soc: fsl: qe: fix static checker warning

 drivers/soc/fsl/qe/qe_ic.c | 84 ++++++++++++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 36 deletions(-)
