Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B8EEE49B5
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49869C433CD; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34112C433A9;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=5UWdv+uAH4qg9hX8agq8Jzmt/yO3LULoShk5EsK6dBE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=guoi8gycJLWBvnEbyA4o/M0maF8jpEPAJMAPpmNouHadcqC9JIN76N5wee/y5sj8O
	 d1sbHtPEcB1y/fvOuxpGEvhoHSywkbLFdZ7s48wSXgMbBrKj5YRAeEC1iF72I6Vx1R
	 9vAKl1dkouoPGcg9RGIORxQNghahpJK44xSog+v1GKcxg3IzBU8s6h5w7U3xa2bVaQ
	 VNyrPhmenpFqdygDYciK5qXya3mjrlYt21buaAJMqiK2wb+kNZZ0uv6GzZizPTJaTF
	 3S+RIghDjFpw6LC7BAIBGFXULgBp51xpSuGHZweQZ3rmbWRAdHnfTmA5xi2DvADpa8
	 xESU8PdlGxCPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 15E8EE4EAFB;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.6 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147608.32531.7825567336578003436.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:16 +0000
References: <6299163.hdfAi7Kttb@phil>
In-Reply-To: <6299163.hdfAi7Kttb@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Aug 2023 00:03:28 +0200 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.6-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.6 #1
    https://git.kernel.org/soc/soc/c/59486969f433

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


