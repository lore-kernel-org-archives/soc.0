Return-Path: <SRS0=AiQL=PK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0522C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 01:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22806135F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 01:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A22806135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f+B/8iHD2LoHb0CUOGr99Uy4XYo9txHMuUD3bRcUcq0=; b=xkMRyaaq4xNnOP
	HbEiOCIT+f5AuG+ANDpXkv2rrbEKPhqQDqe5RuQnCae0deA7e+wHr3+f8G2YXSv4iwSClucsJ3OT+
	nendJsUXAmHVGk+QGXQ6IbruNG7JWbdvp6BHNQK5NKMmiqqbw9KkeqlASC4xMMUd05z/IlcEL1z7Z
	rszrtQGs3pZA9cOkB/KelNH1uAzCqke2LOViPJdc273Mp6PXgfwQlCT0GnTAD1q5wMOcNWrR0fZ5r
	aembLM24m1MUNJCCaynBnfLw2hEKH7NkPdWBdC6yEkaifwF250yNcmyQlU3v60xzijg1ooayzucDd
	NCinkqGmd0nJUMNg68Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdivG-009P9Q-Oi; Fri, 22 Oct 2021 01:00:38 +0000
Received: from inva020.nxp.com ([92.121.34.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdivD-009P85-11
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Oct 2021 01:00:36 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 12F221A1ADF;
 Fri, 22 Oct 2021 03:00:29 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CB7941A1ADD;
 Fri, 22 Oct 2021 03:00:28 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 0E6A040007; Thu, 21 Oct 2021 18:00:28 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl drivers changes for fix(v5.15)
Date: Thu, 21 Oct 2021 20:00:26 -0500
Message-ID: <20211022010027.11866-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_180035_244804_DABFB532 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211022010026.yCJB7-Orl1vX0TBa5F8RxK2582y95KM1ggrVwRt_NF8@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
