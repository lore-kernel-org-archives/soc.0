Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA175C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 23:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73256103B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 23:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B73256103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0zXPSSLxxFpuWaucxEVw96bV0HD6nqMAQY+bOmizPWA=; b=qV11BBn8mdvOIe
	koSJMEkGgXoFblEfe0/zd6BfWJTTrH/JVNWITZL3KGtNRNYytdlnYp4Wajlhf3iw3SLizKpSrDx2w
	yn3FHSMYh+0iMz6Xto9kMpF7oJvxhiCfa1NWNekMvZhP6brFrkf9ICZvMBUsD2pDt7k2CKPgiaH+h
	JjCtpFQEe6r7l2V3RoFOwGS1JpDk8p5OUdhfv3GBlQbY5pDX5JyCn377MnbtYme1J2XmVtEZ4Q1tW
	P0UkO/UtafCqk/U+T2w3DAHLocgyUA/292BY9pn40bk0a4s0dsrJWt2VHsEc+So6BfsPTJulDYEi2
	86C1w13cFe7p49jRYXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfWKI-003Jgz-Tn; Tue, 26 Oct 2021 23:57:55 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfWKD-003JfK-Nw
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 23:57:51 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DC497201A2F;
 Wed, 27 Oct 2021 01:57:45 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A381E201A03;
 Wed, 27 Oct 2021 01:57:45 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 D812B40007; Tue, 26 Oct 2021 16:57:44 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org
Subject: [GIT PULL v2] soc/fsl drivers changes for fix(v5.15)
Date: Tue, 26 Oct 2021 18:57:44 -0500
Message-ID: <20211026235744.19258-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_165749_991914_96E8E6CD 
X-CRM114-Status: UNSURE (   7.24  )
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
Message-ID: <20211026235744.VQtVqrln2vAHUPq6tC6iWMXWMcC-t_l84YLgfTeYHYY@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
