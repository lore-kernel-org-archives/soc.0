Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6ECC47DB7
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0205C4AF6C; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA232C4AF5C;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=+Xz6aFBfr3UsaI1oB4b8IawZesIMYrER/tNiX/jWO4o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a0mVQeo1p/q2Q3PtwsiXZJ6LkT7PRVI13DtZQuZK2DAvWYFKJ7IbDnYEdfzH6o3B0
	 uvARM0sBeG3yu2Tk45+QNzuhvxR2VF7TUayfuaTMoNKg/JzKvoMU3rGcSbtPlv4ZxO
	 kqVKhkFkMNfUEmmCHoypGwT1s/M2/w1/FfH4egQmU97KTZ0+HMCpOiYFor6a+djSdV
	 RaIex4wLbGnQE6zA+TvmJ3eQVWvaj/K8o1vGL+BZ0MdcQFq/aZFyZQf0/VzucsuSFa
	 K9YYNn5vGBFiOYtl0fwGX5nVU0CvXHoD4MtXA+FFwu2vP1Nj/BOP5mBv0JgByJAvi7
	 izHYtRJWClGUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92953DD4EE0;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: Delete ARM11MPCore (ARM11 ARMv6K SMP) support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646759.10550.12351950026776060968.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231207-drop-11mpcore-v2-1-560b396f3bf5@linaro.org>
In-Reply-To: <20231207-drop-11mpcore-v2-1-560b396f3bf5@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 07 Dec 2023 14:33:35 +0100 you wrote:
> This ARM11 SMP configuration was one of the first SMP configurations
> the ARM kernel supported, but it has the downside of odd DMA handling,
> odd cache tagging, and often (as of recent) completely broken cache
> handling on the ARM RealView PB11MPCore test chips. To boot the
> platform it was necessary to completely disable the cache.
> When it comes to the EB 11MPCore it is unclear if this ever worked.
> 
> [...]

Here is the summary with links:
  - [v2] ARM: Delete ARM11MPCore (ARM11 ARMv6K SMP) support
    https://git.kernel.org/soc/soc/c/2560cffd2134

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


