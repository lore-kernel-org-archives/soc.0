Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D96C3DA49
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F031C4AF11; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4614DC32786;
	Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720449061;
	bh=ZHANvTH8Ay2H8r4YIYTY8/MC6I6a8idXZqcRR3FFXJM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NYdpI3MG9rDoddNf627AXysIKdt8i/ECwIHLX8CyfvDnIhx685nPXAvbo963YB6FZ
	 0LURSxOxH+E5z8iB9DaIcd6GRx+lbls6pxI1ZBHVCY7xjDcgRKzbuCDzRG71dJBILz
	 THOmU/nUrKI8jXY8ogE/kEeprgOo3upQlS9GOYMc4rHEWGrUlZJIRyw1TYHWR5AA+e
	 mqKNGOGGX+GQZrN+HWyFljeVUV+2tU/b6/m4+AzBVEKDkn6caM86RJpJaGPY0xNemD
	 CrJYqrI5k4qySNVf9P6x4VgYViblkceA9Ap7znli3ZgP5s8cES4GddOOgQESI4OKt2
	 ktECnYWIYDGeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A098DF3717;
	Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig fixes for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172044906116.22805.11965105333638848056.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 14:31:01 +0000
References: <20240702025740.339563-1-andersson@kernel.org>
In-Reply-To: <20240702025740.339563-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  1 Jul 2024 21:57:39 -0500 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig fixes for v6.10
    https://git.kernel.org/soc/soc/c/f8fee978fb2a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


