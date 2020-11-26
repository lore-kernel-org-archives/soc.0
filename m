Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639D4C6379D
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:20:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 296F0221F8; Thu, 26 Nov 2020 21:20:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425639;
	bh=MBS3V4honIwsvml1k+K+pBoGli0GwR9sWhUl+QWCHow=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=xC+X76ZjmzDRNdhK3b469NDf4QhFIYzWC9eQk0R+jZJbQMfT21MJODf8SQTqRayEa
	 JJz/P1lZhe7HOixxfUAUtP+ty/uTYBsG5LcZbF/i2GNqLY80PjGKuKCgLy7gQfAzps
	 pv+tbFvN7jsCBb7dA9ypk4t3S4fAP12zH1OKq2YI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/fsl driver fix for 5.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160642563898.13931.9200164663025444391.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2020 21:20:38 +0000
References: <20201125165922.15487-1-leoyang.li@nxp.com>
In-Reply-To: <20201125165922.15487-1-leoyang.li@nxp.com>
To: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 25 Nov 2020 10:59:22 -0600 you wrote:
> Hi arm-soc maintainers,
> 
> Please find the pull request for NXP/FSL SoC drivers.
> 
> Regards,
> Leo
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/fsl driver fix for 5.10
    https://git.kernel.org/soc/soc/c/3a18293e4a0f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


