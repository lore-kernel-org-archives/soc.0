Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5722C6FA92
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89D15C43148; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73D16C43146;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=O0RxVQtVe+HjCSewh5jfqE/WP9iZe7m+Zpn+b2DZH/Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Mx+6sxrmHDKcnEjOeYS8/DpSIS18RlX3IbcKMvuZ908/gBrYMk9Ug3oGA1rD2BLcW
	 cVbhwyHXFkaYYKuUANM2BV91f14qNdfPAn/ZCO2mr/9owEEmV4zr3GccXn1zghRzBo
	 ORwkNQ2x8yg9wjgntf2i3oXwEfec6uqmiOlUjgjy4wYwaiEw5E4rqGhfzTLrGegrR1
	 TB0z4FB4T2DXpTPjWCWOnU0h7FwNjD1diKgDv65Ilqq/oly6t62jc9CNppWBm4XyYW
	 29GL8iRfOG5bV2kx1Wf0PU+3wM5xq+hy87d813BVQG22Wp/V8FerA85/4HGpewtRUW
	 pFDhOxM/bwfag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B65BC395DA;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH v2] firmware/psci: Add debugfs support to ease
 debugging
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882930.18494.12789681126434828562.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <20220926110758.666922-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220926110758.666922-1-dmitry.baryshkov@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Sep 2022 14:07:58 +0300 you wrote:
> To ease debugging of PSCI supported features, add debugfs file called
> 'psci' describing PSCI and SMC CC versions, enabled features and
> options.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [...]

Here is the summary with links:
  - [RESEND,v2] firmware/psci: Add debugfs support to ease debugging
    https://git.kernel.org/soc/soc/c/3137f2e60098

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


