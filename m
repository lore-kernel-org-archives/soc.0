Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD522CCA480
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 973F3C341D6; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E1B4C341D0;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108818;
	bh=1QU1rhppFGZsECx3WQS1Uv6e9LYxSaMWRq80YtHDuKk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VLVML2fLZ9eCuSouimf5/7lhMPOzxUnY1T7gs8ZExttwJqm8WNVxQnqubUh5sofrV
	 9ctnTxLFV5fI2pylTcdBMD+UtGD75F69AsNjaPPzRf+dCJErXkb/0H5RjLQU7NMua5
	 2wgPlyd9OcpzBAkth4G+lkkmllllGE5Vu2Fn3qECGhs0l9ASWpOpLyY1cohZgcDLxs
	 XuVBWcqf9ek0tEw7QDVCiucnnPKJjlWQie/nKTCpuu/32u/lLV3xMfQ6p4unAD4ss9
	 IPYauL/eh8LR0/KQAmPkBa4KPfukwRdr4mvEhWWWy/97NnfYf43wMJZCtatBJbNpxt
	 fhrIQBM8mjxRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57465E45BE0;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.20 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881835.23384.12446619059395334473.git-patchwork-notify@kernel.org>
Date: Wed, 06 Jul 2022 12:00:18 +0000
References: <14795241.VsHLxoZxqI@phil>
In-Reply-To: <14795241.VsHLxoZxqI@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 05 Jul 2022 13:11:23 +0200 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.20-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.20 #1
    https://git.kernel.org/soc/soc/c/2630a9127c7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


