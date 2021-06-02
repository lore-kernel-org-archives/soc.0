Return-Path: <SRS0=XAKR=K4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1C5C4708F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 08:05:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B440613D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 08:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B440613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUooebyB0z4IoiziKTNKVx2OSq2viNdIES3jxdC6X0k=; b=ydqjSqIfJxGkN6
	y909m8bOLdNSN1VSFPeC4JyCGKPkIRP//HxiOJNvQExRZ+Xt8CUUn+I4hDUsCfV0UqAsDDVDwOpRt
	fDzGH5deJMyME+R2ujbdnZHZmt32QcsZP6hrrg7V2dspx4UNjo7F3F1aH7fC7uzVWqmDedDk2nqBX
	Hih8rgK/z0qK/VEnAiQ6b/mlhGF4Nn2CEfXXpsrvys7JjKwig2Q/YMKCrtxViNHik5a2fTbWkezG1
	4QB6p2fABnNxlIr0d9K2fDeG3SAVK8u5YaH9/pr8SkhKScRz4cuFabcgDBVVr+n//Pfcgufo7okQf
	cZgBzAdijv/M/GZj2f4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLr6-002TkK-IJ; Wed, 02 Jun 2021 08:04:01 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loLA3-002GMG-LV
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Jun 2021 07:19:33 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id CA9498027;
 Wed,  2 Jun 2021 07:19:37 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Defconfig changes for omaps for v5.14
Date: Wed,  2 Jun 2021 10:19:10 +0300
Message-ID: <pull-1622618286-677305@atomide.com-2>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1622618286-677305@atomide.com>
References: <pull-1622618286-677305@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_001931_802724_FE6878F8 
X-CRM114-Status: UNSURE (   7.73  )
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
Message-ID: <20210602071910.826rdTKsg3Ytdzs1SgbrGuZGnDyiUe-85eEBHy4zco4@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/defconfig-signed

for you to fetch changes up to e7d7b033091afaee937cd92d71903fbe774d5ff0:

  ARM: omap2plus_defconfig: Add LP5523 LED driver (2021-05-21 12:31:57 +0300)

----------------------------------------------------------------
Defconfig changes for omaps for v5.14 merge window

Defconfig changes for omap2plus_defconfig to add WL1251
and LP5523 as loadable modules for n900.

----------------------------------------------------------------
Sicelo A. Mhlongo (2):
      ARM: omap2plus_defconfig: Add WL1251 and WEXT modules
      ARM: omap2plus_defconfig: Add LP5523 LED driver

 arch/arm/configs/omap2plus_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
