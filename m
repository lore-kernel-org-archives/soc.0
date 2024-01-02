Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEDDC47258
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 146FAC433B7; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F14CFC4339A;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190301;
	bh=r7+wBUyXPxc9qbXxRXe+I/FbKnzwkPxILZd2SUBZJ88=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rhACFw4gbiQOxQZMpvCuLjMBOwweNbv7NMiK7tuGzShsq8+CYG/qTJGMcUr1dNgtq
	 KrtMDxQ1fVj43TKdvNJV1SWkfP50mLuFwK1BdpP8EOyL3trxa2+tuAzH0djP4jmFcD
	 s9MZQXjHnlmJ9LdGt/PIytoMro5SDeqM8cdLn2TmAxQ6eb8z+V2jMXo6AUpgZn5edp
	 4QIhV/wR+8yTLQtS1QsH7wfAXwM+hYEdeGkApUCbRmgozhBwLfJ3Z8qFCgM2nP5wTD
	 Gz3Rmza6QCHlePHULweLBiP2nHAW2Ab3o23OnZaOfjJJI5vKcKvgc6N/N74SLd7DUV
	 aReNBMokiT4ww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D05A4DCB6DA;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm Arm64 defconfig updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030084.6407.14343740085808757422.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
References: <20231231034648.3262882-1-andersson@kernel.org>
In-Reply-To: <20231231034648.3262882-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 30 Dec 2023 19:46:47 -0800 you wrote:
> The following changes since commit 48a9ba5eb4d720c6e21c6e4d2a6fb6e1a97f5f2a:
> 
>   arm64: defconfig: enable Qualcomm WSA884x driver (2023-12-17 15:03:06 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.8-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm Arm64 defconfig updates for v6.8
    https://git.kernel.org/soc/soc/c/ea15d0c571de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


