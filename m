Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B98C636D4
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98D75C433A4; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8360CC4339B;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676302229;
	bh=duaoI2zh6UsV2EGWmmIxAYMHuEkvuV3NgRg1tOKnmos=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XR0PFrPnaBtXalvsi9D4YQRUiJSpdimIg4uCBszgzSJRdpQq29l0UngJan7H2yx+L
	 Gv9HIw6fnsm5/9xvJ9KUux33igNeio/rOUP8b19dh5OPx1yO8vFUQKd9GklgCUa7pl
	 OhsnKs4D4ZgTKsb16wzW/Q0EYJr4fYxsFphHISYyUOwvCERcbHjxa1/sjHuxWceTjw
	 YjFBRI7ACRCwtQ/eM0/gx+VfiBvG/dHgCpJdJmW9sDdtxYUktfrfNFQn9TQ5fX4tNG
	 4pYvkVqlmBDapqe76E0cNNv7Q2ldmphAhYtc1faNrN65oGvOVjUmR/9p0hL8JQKOHY
	 SBQci7dO8XL8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65554E68D39;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More ARM64 defconfig updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167630222940.5266.12960498456002084473.git-patchwork-notify@kernel.org>
Date: Mon, 13 Feb 2023 15:30:29 +0000
References: <20230210181516.2021902-1-andersson@kernel.org>
In-Reply-To: <20230210181516.2021902-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Feb 2023 10:15:16 -0800 you wrote:
> The following changes since commit 1a87f7e5fa10b23633da03aed6b7c7e716457304:
> 
>   arm64: defconfig: enable the clock driver for Qualcomm SA8775P platforms (2023-01-18 18:14:33 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.3-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More ARM64 defconfig updates for v6.3
    https://git.kernel.org/soc/soc/c/384fcb0bd15e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


