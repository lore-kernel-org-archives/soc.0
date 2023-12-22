Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB707C47077
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E13AC116B6; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78BF2C4167D;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=IVmJHww4+gPWU2ezwsAVBy3MLNfDBkeruLO9CmGD5Sw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=I/Gdt+IVIIBVlu/eWjY3U/iveyL1s4lHFUG4m6mhOW8Oi971/NlcJ4R4LyQYbz/JN
	 BzZv0+HqZOeE1iDYylBcWU3iuKSQ2H/X1va089KJgRonfbpRw3f9WNWJP7Fa0bz3GR
	 jIz30OhoBNcNn1mfLqdIH0ScxsiVias2ScV56f/o3Q2kvPYX8XZPf6zarH5fLBO43Y
	 PEkCn4o8tMSQmjraj7+kSeQbx+CWVuk9LbOyAbVt1fCNxAQAC1zphrEbssHyVjWmUT
	 NJY+rTYBSl+AQudjx/D/HmLFOvsAKBP730jwN0KRveKpHCcKYU1dDWNKFtYo4Op7Rf
	 1f07nBXztq5KA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C12DDD4EE5;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] drivers/firmware updates for v6.8 for TI K3 platforms
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646730.10550.6283367272195172495.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231218153043.r5psxbjjpccusjg4@september>
In-Reply-To: <20231218153043.r5psxbjjpccusjg4@september>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Dec 2023 09:30:43 -0600 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver-soc-for-v6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] drivers/firmware updates for v6.8 for TI K3 platforms
    https://git.kernel.org/soc/soc/c/1b3171929107
  - [GIT,PULL,2/3] arm64: defconfig: Updates for v6.8 for TI K3 platforms
    https://git.kernel.org/soc/soc/c/6863c7c6357c
  - [GIT,PULL,3/3] arm64: dts: ti: Updates for v6.8 for TI K3 platforms
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


