Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8869DC3DA66
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21AB8C43391; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 034BAC433CB;
	Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=mHoHrdTK7mDo8i3DshCd6Vs+ELCH8Te0On6y5UvVam4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pQoisx/ZQfBkU04clzfozPMXzol7VGS7VwZvkae7thbip7BAksK8dEK6PqPvWkA/r
	 kAMLYmp1EyBTGenEMMVdMjuWCMSR8NT0hE3vJfRLbLwR1/QHXJy3nWgF3WwKNrIF0+
	 NP1B+z6FxQ6ylm7zZ5ZFZy+BS6ptAVeBAfFKowwwJEhlnWCA+TNPDjBCuj8vc2HkeO
	 +bUI5cK+XI0VczsDtYpd9v2UqsRABibtgETonz2m/yrs5qZ3t9lba1iUZVmNz9LpWB
	 nQzmLagf0/EniOboISrA9/cwEVTNBtvUEq3fRJq0fk7SG6KDtBECJP/QKdWUjH60pw
	 uVR9v0D7A0nPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D16A3E21EE9;
	Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip arm64 defconfig changes for 6.6 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147585.32531.6724103593674665215.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:15 +0000
References: <5353918.Isy0gbHreE@phil>
In-Reply-To: <5353918.Isy0gbHreE@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Aug 2023 00:04:47 +0200 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.6-rockchip-defconfig64-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip arm64 defconfig changes for 6.6 #1
    https://git.kernel.org/soc/soc/c/da6212d0ae27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


