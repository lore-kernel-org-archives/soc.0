Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447E0C04A94
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C955C433B6; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05A08C43391;
	Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692033027;
	bh=Gs4SBbnsKRvG0jvuhQz7zOBUQtxwX85gI8rRD4s9lTI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ExOuFVz+MGv8o9NJXrGNmwyfLQAtwiJ7ZcCRlnmeqwcknD+07mWJsu66gOg9DUhyv
	 ygydBE/cIyFSjoz8zv82q7EUAusjliLRQixJ6kvzvTGKlS6DptRd7GJbfo7Zc+vVjP
	 Pv5dywWb7Fd8vW+wsDm/98MKEyJ9DkJXyQR181win3YeLxKaoC9/s3XV1tbf0fQKRF
	 G46xWloXzj309IqF3JyVDY+phZM6i9xNSTmBTdReOXpmZ5DdduzeaptaSDvvQ/q7BC
	 x4IXIrrMmhPjCKDt5ZqR/hvYAqXqkTX6opVM2Mrv2GHXpPt/b7XRMycEojukNUeSF3
	 fxbwb4t7pL+Cg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7658E93B32;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] soc: ti: Driver updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169203302694.15030.9675015006615372489.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 17:10:26 +0000
References: <20230814160633.my3xbk5k2pxkvjyi@degrease>
In-Reply-To: <20230814160633.my3xbk5k2pxkvjyi@degrease>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Aug 2023 11:06:33 -0500 you wrote:
> Hi,
> 
> Please pull:
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] soc: ti: Driver updates for v6.6
    https://git.kernel.org/soc/soc/c/93e0acaec320
  - [GIT,PULL,2/4] arm64: defconfig: TI K3 updates for v6.6
    https://git.kernel.org/soc/soc/c/0aea47fa0e68
  - [GIT,PULL,3/4] arm64: dts: ti: Updates for v6.6
    (no matching commit)
  - [GIT,PULL,4/4] ARM: keystone: Updates for v6.6
    https://git.kernel.org/soc/soc/c/446f0a4b3341

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


