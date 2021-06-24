Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826E6C49EBA
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 22C36613CF; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 09AFD613CB;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=qM8m8AKCiU1eW+WacfJe0vVBjlFDsNH2srIBvhDriYU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Gvr+y58xCVy5SVZ5GOUgUEDaYrUO+pR57car59IfX8+tL6oNapy3zVDhcUoo4sm7Y
	 Qv2XIHrxy0CZMd6prm/aVJbJWhTJVZTkZ24WwES1Cz+DVDGMcKGrmDxCWkFSWfQWKn
	 8kLNXEVj10ghVFXWt9nX4zeE7Is9kNareYBNARzscPgSEdUaqTgdfVxNuQDsEUPIrI
	 3daTva5vIvKCHWeftJsggPGw5B5xHc+xcj6tF+vhfehjjUeBRenl7KXFVrM7BuuQwj
	 CMkWPGLEXALdiL17QPgXlbBkdiy0JZag934lwXhgHu4Wm20O0umUS1XRWVhiVWjhkk
	 ZT0ljEiKlxQXA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0237A609B1;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Additional Qualcomm ARM64 DT updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241100.24025.5712802370897384721.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <20210621164946.942956-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210621164946.942956-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 21 Jun 2021 11:49:46 -0500 you wrote:
> Hi soc@
> 
> Sorry for this late pull request being so big, but I hope you're open to merge
> these interesting additions that arrived after the previous pull.
> 
> Regards,
> Bjorn
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Additional Qualcomm ARM64 DT updates for v5.14
    https://git.kernel.org/soc/soc/c/c21cc3d89273

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


