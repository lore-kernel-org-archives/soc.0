Return-Path: <SRS0=AiQL=PK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FA0C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 01:02:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668486054F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 01:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 668486054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4I0W7R1NgEmQYjN6dx2bdbo6dWzrAMxDYKHe5jkf5A=; b=N/veUzXwl39NsX
	VYfvG55E537ztu1CSKT0Xk8H02X3ErYtFLsU0cfk0i4FA6npBzkjKKc+YAT1PKVI4bX+nNhZTeUNq
	8s7HsebZSJholskY7qkBZznf0LVLt7HfWGEQ6yE3IP5J8r/9Z0kXAikH56dL9RykAZesFJkyAdvzb
	j47kLn7RYQw4ds3b3IMqOT1JDNpWP1qq4Y3TbYmVt3zUB/ulrYWwujyQvVm2sTXtrb1cG5gV6i53/
	0D3LsbmoGVEUCHasglVNPTXD19PXIbn2O1Rti6o7av9JzOpwoAOkxoPANdpO91xEC3QrVKShQdfn2
	23x/oQooY1LHOjsQBhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdivQ-009PAo-GK; Fri, 22 Oct 2021 01:00:48 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdivE-009P86-0t
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Oct 2021 01:00:37 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1277D201B22;
 Fri, 22 Oct 2021 03:00:30 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F3C68201A98;
 Fri, 22 Oct 2021 03:00:28 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 4BA2E40BF1; Thu, 21 Oct 2021 18:00:28 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl drivers changes for next(v5.16)
Date: Thu, 21 Oct 2021 20:00:27 -0500
Message-ID: <20211022010027.11866-2-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
In-Reply-To: <20211022010027.11866-1-leoyang.li@nxp.com>
References: <20211022010027.11866-1-leoyang.li@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_180036_241666_A46840C3 
X-CRM114-Status: UNSURE (   7.68  )
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
Message-ID: <20211022010027.l4JWeO_pZV3b2q7E0uNsaHfjvOiZIs0J7wRVrj4gq9o@z>

Hi soc maintainers,

Please merge the following new changes for soc/fsl drivers.

Regards,
Leo

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git tags/soc-fsl-next-v5.16

for you to fetch changes up to 54c8b5b6f8a868b9c21a7b0efe92ed2fbcc67080:

  soc: fsl: dpio: rename the enqueue descriptor variable (2021-10-21 19:38:56 -0500)

----------------------------------------------------------------
NXP/FSL SoC driver updates for v5.16

DPIO Driver
- Code cleanup and fix compile warning

RCMP and Guts Driver
- Make use of the helper function devm_platform_ioremap_resource()

----------------------------------------------------------------
Cai Huoqing (2):
      soc: fsl: guts: Make use of the helper function devm_platform_ioremap_resource()
      soc: fsl: rcpm: Make use of the helper function devm_platform_ioremap_resource()

Ioana Ciornei (1):
      soc: fsl: dpio: use an explicit NULL instead of 0

Youri Querry (1):
      soc: fsl: dpio: rename the enqueue descriptor variable

 drivers/soc/fsl/dpio/dpio-service.c | 2 +-
 drivers/soc/fsl/dpio/qbman-portal.c | 8 ++++----
 drivers/soc/fsl/guts.c              | 4 +---
 drivers/soc/fsl/rcpm.c              | 7 +------
 4 files changed, 7 insertions(+), 14 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
