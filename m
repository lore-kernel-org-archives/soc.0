Return-Path: <cmarinas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566FBC433FE
	for <soc@archiver.kernel.org>; Thu, 16 Sep 2021 16:53:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3ABDC61A8E; Thu, 16 Sep 2021 16:53:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C1F163262;
	Thu, 16 Sep 2021 16:53:14 +0000 (UTC)
Date: Thu, 16 Sep 2021 17:53:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ross Burton <ross.burton@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>, soc@kernel.org
Subject: Re: [PATCH 1/5] arm: defconfig: drop unused POWER_AVS option
Message-ID: <YUN2d9MtEbQyrVMi@arm.com>
References: <20210908113717.964049-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908113717.964049-1-ross.burton@arm.com>

Hi Ross,

On Wed, Sep 08, 2021 at 12:37:13PM +0100, Ross Burton wrote:
> Commit 785b5bb41b0a ("PM: AVS: Drop the avs directory and the
> corresponding Kconfig") moved AVS code to SOC-specific folders, and
> removed corresponding Kconfig from drivers/power, leaving original
> POWER_AVS config option enabled in some defconfigs.
> 
> Remove the options, which have no references in the tree anymore.
> 
> Fixes: 785b5bb41b0a ("PM: AVS: Drop the avs directory and the corresponding Kconfig")
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Since you added a Fixes tag, you should also cc the author of the above
commit (Ulf, added).

In general the arm64 defconfig changes are merged by the arm-soc team
(cc'ing soc@kernel.org).

For the series:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
