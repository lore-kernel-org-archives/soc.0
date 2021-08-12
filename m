Return-Path: <SRS0=MhSX=ND=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA7EC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 07:54:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 13E916101E; Thu, 12 Aug 2021 07:54:59 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id 9DEA460FC4;
	Thu, 12 Aug 2021 07:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DEA460FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=atomide.com
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1628751694-126144@atomide.com-2>

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
