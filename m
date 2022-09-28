Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C93C6FA9A
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D40CCC43158; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE693C43152;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=RX5j1mv++gVf62qKYEhN+S1smA8uvTqbBSiJOFcHU98=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dq74wF4+d5s7TJqHZsq6fYydLqC7N8c6OwEvQyEJ+sJDHlU3FbimQsqOKtnMPuUd8
	 m0FLjJ7XGaIiJIdz90c/MG8KDGpMNZHW8h9UUsfTNu75JVRgOBtwhZxnI4rCWFXT7e
	 y32G9HAI65ElE3kmLfq/QHioPsitOznbCKADN+rBQdWjav8/+mHlDKKmweBUPb16QX
	 j6hDzcpESQIjgRWiJ8V1rEcuw3zP/+o1Qipyb1l0Q+z3XZt2cc5f3M3982Y6D6P4s0
	 n6gU5LW6PvI/pWhNKfFssErvjA4yOwySCysjGOJK/lGxQ1dEn2szqdbrejM7+cYJ2a
	 djeN9a9WYEi7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ACE05E4D01B;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip defconfig64 changes for 6.1 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882970.18494.15181764753184629514.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <1989419.QkHrqEjB74@phil>
In-Reply-To: <1989419.QkHrqEjB74@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 24 Sep 2022 21:01:09 +0200 you wrote:
> The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:
> 
>   Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-defconfig64-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip defconfig64 changes for 6.1 #1
    https://git.kernel.org/soc/soc/c/25631f1fec2a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


