Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818FDC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 22:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4773F60F36
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 22:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4773F60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bh5ySvOvs3WBcNF4Ls5+EC5k0LU893x1CrJ6K5y7tgw=; b=v51Ki8a5RutiEV
	piy4IJ3697hJKHAeY1undOhAoG3kBxKNbuBixGFKo5xoflmZ9Yqr2+i8KmFhi4KJ2x8O3qhTEDqal
	hdw7kZbCg9WIievLjC1TbHoXskWQ4N9nAezEEhniBEbLjL0iCxCcSebZ1TmnXU1K1ui8nNjxmqd8L
	pC/OLOqpIV4PnO+yyFYofS8UJTPrhJOoO6PsXd1bGN/s/1q+7cl4PDPfQzqmDIPW/b8KQG0PptJw8
	5wKmpD9xYIe2YvSM3nzofI+h6bxWPkHJXOB/chkH7VI06/vT1GSmhyOJHtm75icofam4e+MEJLP31
	wN1Y/qM3yoa1ifnm1ImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEfa8-00DeI8-7o; Fri, 13 Aug 2021 22:23:16 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEfa4-00DeHA-S8
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 22:23:14 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0B4242002CD;
 Sat, 14 Aug 2021 00:23:07 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C8B4320005D;
 Sat, 14 Aug 2021 00:23:06 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 0BD8F40A55; Fri, 13 Aug 2021 15:23:06 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl drivers changes for fix(v5.14)
Date: Fri, 13 Aug 2021 17:23:05 -0500
Message-ID: <20210813222305.13663-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_152313_091773_00C39710 
X-CRM114-Status: UNSURE (   6.56  )
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
Message-ID: <20210813222305.ZOC5IBg2qSBFnvdud7eOuVMfZSZyelBIwI5u78KtYxU@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
