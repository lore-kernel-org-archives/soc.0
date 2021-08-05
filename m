Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEBBC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 08:48:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 664F361078
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 08:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 664F361078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjHJslD9NCnrIG8v3LmRv7CSx2SQfylHnNEbUFGkYYA=; b=MNWUs9ovCbfMRj
	SmBgBvYvHXQscCy7jSwKZLLJ8AncRWDSWynYxXOu4PLMK3GD/nmE/npUM7X5QxAbwPLkbecStr4VK
	oxin5/Fzop9YS4S8uSMTyaVcczf3CoPML49hpKPGTXnA8MwicRRY2V/mPK2rIXkgAVJEZmqSEw+NA
	W0+HwLVZRA/quDmUbjbYuzDVuObSZNJ1ROxPl3A4UEh+46w3/ab3vUVyLv/HWYHx7sezBRz09fBR/
	ZO05aVAgrcQeGSTgXw3fz0nhXVCoJyhoZY8H/7O65aff2xBtHvlAjlOmNN4lUb6F8Owgr1mzGz/rn
	yc/C4zcQL/LY9tGwPy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBZ1v-008hcQ-EU; Thu, 05 Aug 2021 08:47:07 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBZ1i-008hZF-Nc
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 08:46:55 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 3C2E38131;
 Thu,  5 Aug 2021 08:47:11 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Driver changes for ti-sysc for v5.15
Date: Thu,  5 Aug 2021 11:46:43 +0300
Message-ID: <pull-1628153040-834155@atomide.com-2>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <pull-1628153040-834155@atomide.com>
References: <pull-1628153040-834155@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_014654_852395_95266443 
X-CRM114-Status: UNSURE (   7.92  )
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
Message-ID: <20210805084643.Zxp9vhMe3Ac_fKZWrr8z8LGG-TmQHgWPmoNFEbyDk6M@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/ti-sysc-signed

for you to fetch changes up to fdc07ca0724dd8ad00c22909a1464dc73ed6783e:

  Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc (2021-07-27 12:02:24 +0300)

----------------------------------------------------------------
Driver changes for ti-sysc for v5.15

Few ti-sysc changes to handle quirk for McASP SIDLE mode, correct
documentation for sysc_ioremap(), and start using
pm_runtime_resume_and_get().

----------------------------------------------------------------
Lee Jones (1):
      bus: ti-sysc: Correct misdocumentation of 'sysc_ioremap()'

Peter Ujfalusi (1):
      bus: ti-sysc: Add quirk for OMAP4 McASP to disable SIDLE mode

Tony Lindgren (1):
      Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc

Zhang Qilong (1):
      bus: ti-sysc: using pm_runtime_resume_and_get instead of pm_runtime_get_sync

 drivers/bus/ti-sysc.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
