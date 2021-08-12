Return-Path: <SRS0=MhSX=ND=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCF3C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 07:53:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 73B5761038; Thu, 12 Aug 2021 07:53:28 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id 115BF60FC4;
	Thu, 12 Aug 2021 07:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 115BF60FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id DC1B880E2;
	Thu, 12 Aug 2021 07:53:47 +0000 (UTC)
Date: Thu, 12 Aug 2021 10:53:25 +0300
From: Tony Lindgren <tony@atomide.com>
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
List-Id: <soc.lore.kernel.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>,
	"soc@kernel.org" <soc@kernel.org>,
	"arm@kernel.org" <arm@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] soc: Keystone driver update for v5.15
Message-ID: <YRTTdcg+lj1/vH0L@atomide.com>
References: <0A637A41-2353-4900-962C-DBE50BBDE75A@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0A637A41-2353-4900-962C-DBE50BBDE75A@oracle.com>

* Santosh Shilimkar <santosh.shilimkar@oracle.com> [210810 23:47]:
> Tony Lindgren (1):
>       soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex

Thanks for picking this one up, I also just sent a pull request for it,
my pull request can now be just ignored as that's a single commit
in it.

Regards,

Tony
