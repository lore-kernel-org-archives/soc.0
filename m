Return-Path: <SRS0=UpL1=E7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74714C56202
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 17:09:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F5D2063A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 17:09:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f4WY1F6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F5D2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r3zCanEhoNYWhg4La2CNyX6+QcMBB2KgcECfk2Ivkf4=; b=f4WY1F6kqDKHROTDDUMOLP7L/F
	G0H0j4A4ts/F+Rox+4s2ppZnlVqzVg+xS+FGk98mvlzU/RjH9RVYYQ7+pYjhPh1HzQ65e1M3RXTA1
	CfcsJwtKZmtLE/S15k2TXHNqOyHgmGv4V6RNAyU5oM+vcymZ2ZsD5VGHiguYIVF+CGUUM0mOa5hza
	gC5CJpuwRBONnLlp2DSeFlawnQM4avQkY9GVmNemj+bxujyZkUE2OjipF/UYpREcrHbmReQDmmzDN
	oGAjrrrUklC7k0hOJhChadd0/jrxceTRd2JfWImt+zhRrAlGlIlML24s4qt5g9OY6HDPjNb5Ir0If
	O5YZ5s2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khyGy-0000gT-Vu; Wed, 25 Nov 2020 17:08:05 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khy8V-0004Ye-5m
 for linux-arm-kernel@lists.infradead.org; Wed, 25 Nov 2020 16:59:24 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EC05A200A53;
 Wed, 25 Nov 2020 17:59:14 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B461D2009E6;
 Wed, 25 Nov 2020 17:59:14 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 EA5BC40011; Wed, 25 Nov 2020 09:59:13 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] soc/fsl driver changes for next (v5.11)
Date: Wed, 25 Nov 2020 10:59:13 -0600
Message-ID: <20201125165913.15441-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_115919_360856_CA8C9117 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201125165913.-xRbkLDTXpYJGGCkcyuYnIOvWj_PziMclFfxlYkC9j4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
