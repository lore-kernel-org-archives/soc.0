Return-Path: <SRS0=soWq=NK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5898EC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 06:36:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE98610E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 06:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EE98610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KkqCns/KbEwKCkx2skR2MmngXcNez+EY0HO8JEN6AhE=; b=WOfhwWMIuvPDRQ
	hLUgoaO1GNmXHTNqrEG4HbyTJyhgTIeFOU5BM+zueixSUNd02wdET5XOKPbZ+FZbIFlR/lkDr5mIA
	Pedmta7mkmtveLtOyz4pS/4dgif6itR2IQPWtfJ7ENkltMxCJtSxqRfGT3cVAG2coqqjMMAoG7NEc
	aCO/jkER3mGwolpCIVQAjZqe4gJj8TMLa+Oc7sfI4RKyio51GbhS13PxI6z6oVMuVqScU1kfHffAU
	7cSUhrXz33d9VGuv94W2Q0zKBoFzdOK6+fqP47ial9j7kj8+klfveqWATG+wMy4Ah4edS9mChFgZQ
	p1MfrnGD+hYpNV15F6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGbdZ-007LeN-NB; Thu, 19 Aug 2021 06:34:49 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGbdW-007Le6-BZ
 for linux-arm-kernel@lists.infradead.org; Thu, 19 Aug 2021 06:34:48 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 2A3E480C7;
 Thu, 19 Aug 2021 06:35:03 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [GIT PULL] Fix for omap gpt12 timer error handling
Date: Thu, 19 Aug 2021 09:34:36 +0300
Message-ID: <pull-1629354796-830948@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_233446_480010_52FC0D62 
X-CRM114-Status: UNSURE (   9.62  )
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
Message-ID: <20210819063436.Y0H_CuIPlBAwcB4Avl5gsIjQAsMt5U01NBRoBz9UIVw@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 353b7a55dcaf5fb8758e09ebe2ddf5f3adbac7c5:

  Merge branch 'fixes-v5.14' into fixes (2021-07-27 11:25:08 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/gpt12-fix-signed

for you to fetch changes up to 06a089ef644934372a3062528244fca3417d3430:

  bus: ti-sysc: Fix error handling for sysc_check_active_timer() (2021-08-11 08:34:46 +0300)

----------------------------------------------------------------
Fix for omap gpt12 timer error handling

Two of the recent fixes for ti-sysc driver had bad interaction for a
function return value that caused one of the fixes to not work so we
need to change the return value handling. Otherwise early beagleboard
variants still have a boot issue.

----------------------------------------------------------------
Tony Lindgren (1):
      bus: ti-sysc: Fix error handling for sysc_check_active_timer()

 drivers/bus/ti-sysc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
