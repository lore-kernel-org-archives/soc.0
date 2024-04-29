Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F150C25B10
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43152C4AF63; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D825C4AF54;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=p07FSVLNpuoGKhDAYPK8IrkVEe1JKV7IVGWvxpP+Pqk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AnlXT/VkyMNcl7q07GBw0zxYdU3vCIh9gTLn0LPCDlxo3IEnl8fzfqJ/ZmKblDp8D
	 i5Uie/Chtt7fXT6Y/IAMngW1I75lsvGvEN7ky1dX6xOyFUP7/YRLXgoHcrnO34QpVN
	 MKEQ2LoigiBPpnbegMNpR9s1qquqn5GhazQxBd9iBf+TtZCu19IBEAZN2SIoHYbX2h
	 AZ7fLheFU4LwjHmydo2/tNuwl+MwAATTMxFT69TIjX21IHBc9ynLTK8LqccKpieTBq
	 3ftimleHP5aaIWGzf5/fi13YMGAbPUkmN0+o+SdV68LOR2qX6uxSS2ENwgnua9G8ZG
	 LXKd8G9z1MqNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F9AEC54BA4;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888812.20509.13926316881973652384.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <20240427163625.1432458-1-andersson@kernel.org>
In-Reply-To: <20240427163625.1432458-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 27 Apr 2024 11:36:23 -0500 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.10
    https://git.kernel.org/soc/soc/c/80a02b176310

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


