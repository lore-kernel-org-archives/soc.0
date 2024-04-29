Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B07BC3DA40
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AA0FC4AF53; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1332EC4AF18;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=9Xjxk4ETPYCSM6Oc/yLIlM9XoC0efjm2uG66HhEJ4ps=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ONR0Gxq1x/OY8fw4fLoqeyNvbAf6+08pwzZDND/VUXAa33YQ1e7ZEYZe+REQidXD5
	 UlE3VMU0/0xCdq5snktMZjGK2NAFxizM5P3z323+/Y8q7ywUHY1kWDBuhLZ+3ew72V
	 M5P4HIUEkC4JtJsxaS41dvhXOa7bZQKvJAQphf8JU5+oNQd+l16dKWTT3dzYkcziVI
	 b82IatvcWOD1fMNAD/TbOi2JzZDVpXQxpnyqQNMK1F/YWVoCgb+KNiMeMpXg/iITA8
	 oONUD/01j9A7xqLqpFcfjBAxe5rngMENPriQOssZ95ciHyHQ22Hg3o0yKnvxB7+5xx
	 /9vZP9ruSPVbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 034F3C54BAE;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 Defconfig updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444701.17402.1150914419278011574.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240427162037.1431822-1-andersson@kernel.org>
In-Reply-To: <20240427162037.1431822-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 27 Apr 2024 11:20:36 -0500 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 Defconfig updates for v6.10
    https://git.kernel.org/soc/soc/c/948b25640fdd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


