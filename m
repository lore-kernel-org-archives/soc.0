Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C71C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 07:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BAB06103E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 07:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BAB06103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHUnuk8ZPk1Fa22s7wbfWLOMiZSAsVKRMDDMdwT0c/M=; b=5Fr+zHz8dAwpeD
	rUaOnCt7WzHuhT9NB0J/oKCiY19RQy51Sz5lHftauLj1ETYdgE6K3oYtZsSf3xhfleJai89ZMrQUo
	Oq9bcJj4I64c6B0IFNPTZLyFQt+EBgsV+h2qkKpi7xeCJU+naWAYDHxvFVpdCJl/y1Dljd4wUl6tp
	TyhKU+2OLAvSvLSVPIdTeXHGSb0iJSuSHZx8A0zVGMgQwJ6iNTO2yD2mOFO4xaXQR1aafn9dfdriG
	4KXoSaW/pBfdg5pinXUWKREIkAjPywHxPYsC4STJHLXeAJ96KvshF1tj/Cnraa+F/KBWdMfwixkNn
	QYXAT8C+BdGR2KuLd9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE54u-008tO9-0A; Thu, 12 Aug 2021 07:24:37 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4kr-008phU-Dg
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 07:03:54 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id A10D380EE;
 Thu, 12 Aug 2021 07:04:12 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Drop pm_runtime_irq_safe() for smartreflex for v5.15
Date: Thu, 12 Aug 2021 10:03:43 +0300
Message-ID: <pull-1628751694-126144@atomide.com-2>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <pull-1628751694-126144@atomide.com>
References: <pull-1628751694-126144@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000353_563560_EBA5FFF1 
X-CRM114-Status: UNSURE (   8.20  )
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
Message-ID: <20210812070343.mExU6blSs22Fci3HPfF0yM0bbm6O8aMTAlODfl06xyM@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fdc07ca0724dd8ad00c22909a1464dc73ed6783e:

  Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc (2021-07-27 12:02:24 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/sr-signed

for you to fetch changes up to 74953a9136cfd650dd994daded520528f737b7b3:

  soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex (2021-08-06 09:53:59 +0300)

----------------------------------------------------------------
Drop pm_runtime_irq_safe() usage for smartreflex for v5.15

We now have cleard pm_runtime_irq_safe() usage for all TI SoCs
in Linux next except for smartreflex and 8250_omap. This change
removes pm_runtime_irq_safe() usage for smartreflex, the
8250_omap depends on pending serial layer PM changes.

----------------------------------------------------------------
Tony Lindgren (1):
      soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex

 drivers/bus/ti-sysc.c             |  6 ++---
 drivers/soc/ti/smartreflex.c      | 52 +++++++++++++++++----------------------
 include/linux/power/smartreflex.h |  2 ++
 3 files changed, 26 insertions(+), 34 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
