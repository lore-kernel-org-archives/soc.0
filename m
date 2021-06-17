Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EBEC48BE8
	for <soc@archiver.kernel.org>; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 12F3F613E4; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EF296613DD;
	Thu, 17 Jun 2021 01:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623894605;
	bh=cl1jRqFW5igs2WeDp7ssJR5yA7cDSeBdGmXiS+9qkxk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AijsuL3yzyue1LF+dI5EpHEaUxFXbRjmnJ/Oz26bZsYATDhCTaI6xPiL4T7qeVL8Z
	 uuaT+aBDRxGaY3yDMT7EGwXaUGRs12lvOmvCnH9mKlAIICmADgjGiDhYvKqosAujnQ
	 etkDjPYjWvJG+GwbnmuXWarHjEbp6fxfK3TYjLp7akSv2wyBqHUJORrMwBj+5v9bWt
	 KFdQZj1fOP7m+0UNXICH2IRsqgG7oMoxbWAHQ6hyPkP+5WmYiVqDyAXBRgEbb267Uw
	 pYbe4RaYdDy9tmSnH/6qb80ZX06qWqXfEovQf1mDyb+34eR2PpayoVYhfCkOCpJBcl
	 wkloFY6dsxfrA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E2DF060A6B;
	Thu, 17 Jun 2021 01:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.14, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162389460492.26973.15492232222731488700.git-patchwork-notify@kernel.org>
Date: Thu, 17 Jun 2021 01:50:04 +0000
References: <c953e97a-f901-a749-1fb6-b1caa75b4748@baylibre.com>
In-Reply-To: <c953e97a-f901-a749-1fb6-b1caa75b4748@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 16 Jun 2021 08:25:11 +0200 you wrote:
> Hi,
> 
> Here's some changes to enhance support for the Odroid C4 & Odroid HC4 boards.
> 
> Neil
> 
> The following changes since commit a270a2b24de5be0480136cbbd7805b9134762b97:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: amlogic updates for v5.14, part 2
    https://git.kernel.org/soc/soc/c/194eb4eab5db

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


