Return-Path: <SRS0=XAKR=K4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92981C4708F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 06:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54AC161360
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 06:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54AC161360
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DDVbRw7f8ZqUMja93wHtSRgHeySZlm2Mb9e+WlqtJhY=; b=OlCgU2Mo/PTrO+
	dILlv6F2al6T3c3Zzz49tHPfhUA632vTV8uqsYG5Jnb5DvudtKd6u+r1k1M4sEQciIydL8SUTnFeG
	qQr+fqsDdaZ4JvrAWBfWN9RZ8RYaE+XQzoN9bdJ0tBwBSC88fdHkNZ3ShGLTx59ABiqL760CdwUhW
	4P3tuckl72N1hgY8H4VYAJHEEDatETtx3WvnTjC7AM0CeWIS7iyW+thc9pIkDaovzOtRl4WWPvEOv
	RFuPxa6DnoTa5gxwxnq1U/BJP8jJVA9fAnyjDfxTwtVnCFV8HhrcIMNT+1wDbwgvoKr4mtjOUyh8V
	t9uA1h18OxbKUMlAiT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loJvN-001y9D-GB; Wed, 02 Jun 2021 06:00:17 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loJvJ-001y8E-EQ
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Jun 2021 06:00:15 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 93D1B80E0;
 Wed,  2 Jun 2021 06:00:17 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] SATA regresion fix for TI dra7 for v5.13
Date: Wed,  2 Jun 2021 09:00:05 +0300
Message-ID: <pull-1622613578-121536@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_230013_544824_086EE45B 
X-CRM114-Status: UNSURE (   8.10  )
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
Message-ID: <20210602060005.54r3X4S4ZZzJYuUU6PMwlgSAk_1gB0QFS_4x6LvMNYM@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit d995d3d025bbd2d89abf12418f20d19bc0cb0130:

  bus: ti-sysc: Use kzalloc for allocating only one thing (2021-03-24 13:44:04 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/fixes-sata

for you to fetch changes up to db8e712e06874e37a1fdb9bb011618811fc96dbd:

  bus: ti-sysc: Fix missing quirk flags for sata (2021-05-07 14:21:32 +0300)

----------------------------------------------------------------
Regression fix for TI dra7 SATA not detecting drives

The SATA quirk flags are no missing With recent removal of legacy
platform data and we need to add the quirk flags to detect drives.

----------------------------------------------------------------
Tony Lindgren (1):
      bus: ti-sysc: Fix missing quirk flags for sata

 drivers/bus/ti-sysc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
