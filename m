Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2C2C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 21:12:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ED5461182
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 21:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ED5461182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=px+S0BlPUDmKmGgcrJMGTPxlp3zPyDtfZ6Ga2QSRNL8=; b=NqoyIA0iUhOE0j25KZaLZdbze/
	GzFhuMkquwSGzz/PvwP+LooAMAOEsNhQzOq300tUYP2W8oW4VhY9zIShEqgUALXhFD+MZtFZMNj5D
	Pf+OAFDynpsRnJx4uCozf2Uqoi+XiSSNdySMZC5bXfz8IoaB1R6mX4vb18w7zF/YTgWH3x8v+pjCE
	Y7JuZGoEUMrABb2ERvBldNYsiJo3gmOrIqC+ibsjmEy4hrb2kP9skW/cvjLC9Ov7MrnM5Weu1FmTX
	4LyCZVi2+jc9DWO1EaqVmmHvKBb4b2jcGWMaWc1fsDrADvASssTfkBI9G4rq3x8KOOA3SihxP9dAA
	RlAY2SVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUyH0-001W9G-DG; Fri, 09 Apr 2021 21:02:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUyBz-001VuM-CH
 for linux-arm-kernel@desiato.infradead.org; Fri, 09 Apr 2021 20:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=RPVyZMymYGnHavBo8V5VTVTqrMfeRg33+kcbvNY95aE=; b=13v7vMZ83w5LvcdBo0pxFOqog+
 msOJ6TmjumQBKtzANf16X7XCiqV0MgPizmkTC2ycMkBobgBXC4c+/F9/h3CBoKTrb9S+CCT4hVEyz
 gTt9+22ZOoc3/9bPakvT8kTpaBIP/0bjrD/I9hzzD9Y9KPjjKnAeex5kOXgocSVcAKd1vspkIC6rc
 f4jQAZkVPQtd2mPZdlrTnhDuVt+mpriubOCNDb+HltPlJCSFswPciF2vnpmJ6NjWPEya2JxP+UWJ2
 AaPlsHCpz4Y9M0r1gR2/O0T4s8WKVYWY1yTBxaDEqf4rb3uAZU91uolBKcf/HhJEQfoHvZwTqVH+u
 yEf9Tduw==;
Received: from inva020.nxp.com ([92.121.34.13])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUyBw-004nhv-Fk
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 20:57:25 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6D2FC1A5347;
 Fri,  9 Apr 2021 22:57:20 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 335131A5340;
 Fri,  9 Apr 2021 22:57:20 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 73E1940A63; Fri,  9 Apr 2021 13:57:19 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org
Subject: [GIT PULL] soc/fsl drivers changes for next(v5.13)
Date: Fri,  9 Apr 2021 15:57:19 -0500
Message-ID: <20210409205719.27927-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_135724_679317_33B6BBC9 
X-CRM114-Status: UNSURE (   8.53  )
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
Message-ID: <20210409205719.VI5RhAJwMis5oXP3mrOgnzTph_HNHagbvBgHvUJ-MjU@z>

Hi soc maintainers,

Please merge the following new changes for soc/fsl drivers.

Regards,
Leo

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git tags/soc-fsl-next-v5.13

for you to fetch changes up to 242b0b398ccd34f73772120bd27a87a1bf00e30b:

  soc: fsl: enable acpi support in RCPM driver (2021-04-08 16:34:15 -0500)

----------------------------------------------------------------
NXP/FSL SoC driver updates for v5.13

- Add ACPI support for RCPM driver
- Use generic io{read,write} for QE drivers after performance optimized
  for PowerPC
- Fix QBMAN probe to cleanup HW states correctly for kexec
- Various cleanup and style fix for QBMAN/QE/GUTS drivers

----------------------------------------------------------------
Aditya Srivastava (1):
      soc: fsl: guts: fix comment syntax in file

Christophe Leroy (3):
      soc: fsl: qe: replace qe_io{read,write}* wrappers by generic io{read,write}*
      tty: serial: ucc_uart: replace qe_io{read,write}* wrappers by generic io{read,write}*
      Revert "soc: fsl: qe: introduce qe_io{read,write}* wrappers"

Peng Ma (1):
      soc: fsl: enable acpi support in RCPM driver

Roy Pledge (1):
      soc: fsl: qbman: Ensure device cleanup is run for kexec

Yang Li (1):
      soc: fsl: guts: remove unneeded semicolon

Zheng Yongjun (2):
      soc: fsl: qbman: Delete useless kfree code
      soc: fsl: qe: Use DEFINE_SPINLOCK() for spinlock

 drivers/soc/fsl/guts.c              |   2 +-
 drivers/soc/fsl/qbman/bman.c        |   1 -
 drivers/soc/fsl/qbman/bman_portal.c |   3 +-
 drivers/soc/fsl/qbman/qman_portal.c |   3 +-
 drivers/soc/fsl/qe/gpio.c           |  20 +++---
 drivers/soc/fsl/qe/qe.c             |  24 +++----
 drivers/soc/fsl/qe/qe_common.c      |   3 +-
 drivers/soc/fsl/qe/qe_ic.c          |   4 +-
 drivers/soc/fsl/qe/qe_io.c          |  36 +++++------
 drivers/soc/fsl/qe/ucc_fast.c       |  68 ++++++++++----------
 drivers/soc/fsl/qe/ucc_slow.c       |  42 ++++++------
 drivers/soc/fsl/rcpm.c              |  24 ++++++-
 drivers/tty/serial/ucc_uart.c       | 124 ++++++++++++++++++------------------
 include/linux/fsl/guts.h            |   4 +-
 include/soc/fsl/qe/qe.h             |  34 +++-------
 15 files changed, 198 insertions(+), 194 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
