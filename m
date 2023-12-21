Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02C0C47DA7
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2651C116CA; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CD74C4AF5C;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=pxa1NypPVuUpx2X71ZJ9lbOW21GNiD1Zk5tfvFbdoRk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oHbPfXxOGfI+FcrdLE7PgeWr5HNBBfpUndsVddaR/hnSnf6lghcO0nDdK9fHEnE8j
	 DTMl9V5PWxlXKsj+d3XAPn/PXNOcyi8cNDMhnr1VVRlNOeYfzkbUjmgJq68+UbL6fw
	 OuP6cd+4HIH0DosYZljna9SoDajlx6LW5vsVDhWMSZtDbnlQjasj9mHnJRC7P8eaG2
	 3uaK9/MEUOnMGdN9aOGfs28FxR9haVLcAcOaIquWHuDWLFJoYO9CroZOlf9q9DFW2h
	 MXCkvc6UQxAyA02+VTmhifxqoDI0HGNQoKQcvpJgkse8XWNiDd81lVMy/ojmmzM6N4
	 85d7yqHNHlOfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7BB56D8C98B;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: ti: keystone: Updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046650.3302.4760723817066254782.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231218153039.dok52xazqshbr6ie@playroom>
In-Reply-To: <20231218153039.dok52xazqshbr6ie@playroom>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Dec 2023 09:30:39 -0600 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-keystone-dt-for-v6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: ti: keystone: Updates for v6.8
    https://git.kernel.org/soc/soc/c/c3426ae68030

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


