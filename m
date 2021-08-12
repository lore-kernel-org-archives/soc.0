Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CAFC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 08:10:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F02060EB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 08:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F02060EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urv55Wj0bjtufWxgEtjy4GTnuK/psxUPhki/2zDibQ0=; b=kf1heYrzBbZen9
	LBVyFRud8sNK0FHBS7PN20FLVghaHkUkuNFJdSxaZSnPgFnvSYERTiksANdF8DDqiqZAY6UG0nNSc
	1IF1Dajcn0pnPQ8TJZ01gDqQY7jJPYYUVcXLOxE5sXbeRro+AZZf8XT+ARjqTnoKQz3JRWFSHsyXK
	q/TyywiW0Os06LurPr2kZJEbOHCvV8XNU4/+ZyrTee/ys6Tft083RwhmQmX19RhrfpFAsCUzQzvDR
	i0rTN/io/10orDqw9ag6sObg/yHtvwtmEUBA5Vsvk/c7EPqei9i6RmAgEnpcpNK+zcreSLXW+hMsd
	DOywZ57YvAyEI7A7FjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE5kd-00936p-3C; Thu, 12 Aug 2021 08:07:43 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE5YI-00902Y-Jo
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 07:54:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 6FCF380E2;
 Thu, 12 Aug 2021 07:55:18 +0000 (UTC)
Date: Thu, 12 Aug 2021 10:54:56 +0300
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [GIT PULL 2/3] Drop pm_runtime_irq_safe() for smartreflex for
 v5.15
Message-ID: <YRTT0Oejj22qNAL+@atomide.com>
References: <pull-1628751694-126144@atomide.com>
 <pull-1628751694-126144@atomide.com-2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pull-1628751694-126144@atomide.com-2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_005458_751561_13A783C6 
X-CRM114-Status: GOOD (  14.80  )
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
Message-ID: <20210812075456.ua7Lfr60FIpw3RrHkBMzPlJLytCaNtEBTubyEhk_9EE@z>

Hi,

* Tony Lindgren <tony@atomide.com> [210812 07:04]:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit fdc07ca0724dd8ad00c22909a1464dc73ed6783e:
> 
>   Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc (2021-07-27 12:02:24 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/sr-signed
> 
> for you to fetch changes up to 74953a9136cfd650dd994daded520528f737b7b3:
> 
>   soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex (2021-08-06 09:53:59 +0300)
> 
> ----------------------------------------------------------------
> Drop pm_runtime_irq_safe() usage for smartreflex for v5.15
> 
> We now have cleard pm_runtime_irq_safe() usage for all TI SoCs
> in Linux next except for smartreflex and 8250_omap. This change
> removes pm_runtime_irq_safe() usage for smartreflex, the
> 8250_omap depends on pending serial layer PM changes.

Looks like Santosh already queued up this patch and sent a pull request,
so my pull request for this change can be just ignored.

Regrds,

Tony


> ----------------------------------------------------------------
> Tony Lindgren (1):
>       soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex
> 
>  drivers/bus/ti-sysc.c             |  6 ++---
>  drivers/soc/ti/smartreflex.c      | 52 +++++++++++++++++----------------------
>  include/linux/power/smartreflex.h |  2 ++
>  3 files changed, 26 insertions(+), 34 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
