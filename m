Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11459CD5BCB
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F08E8C4CEC5; Thu,  5 Sep 2024 15:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA434C4CEC3;
	Thu,  5 Sep 2024 15:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550843;
	bh=z/yJgCmyTs6i6WXdm5o/VJ3W5oy/MWA56O4rN2L+4kY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LnwJF1lYHDwguvgZAp/ci59LnCWqnahRirlWg0iJTuv2td7u0vQrL9hA5FztYiCuM
	 opensYp8Vvs4GNP5Q8PGM1xPdoEWRAcIeLLDdeJjHz5ePgLCRnbO9kLDmBFMUH5mR6
	 woU6tVck/L5o9791VLk9ys1X5TrmbF1tg95jMhSG78LJq34xUbWcX9lSMT4xTmnBCR
	 IyY26nJb87dGhWtLfEmoWlOEuOR9ivDVB1xi+S/ahAM7Immcu1DdUy1xeU9/30fNcX
	 5D2GhwT2S14v0uPTwkL5AjZOqzUI9wd14m4KSkiHuJzD53kz+p7XK8FKC2KidUIuQs
	 ky84kEFimYJRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC9D83806651;
	Thu,  5 Sep 2024 15:40:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555084474.1737985.2386860818528806482.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 15:40:44 +0000
References: <20240904103921.1479579-1-p.zabel@pengutronix.de>
In-Reply-To: <20240904103921.1479579-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 Sep 2024 12:39:21 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208399:
> 
>   Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.12
    https://git.kernel.org/soc/soc/c/311ef8837ff2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


