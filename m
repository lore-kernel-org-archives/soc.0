Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE560C43219
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8818C36AF1; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FD37C36AEA;
	Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640010612;
	bh=hBjI2B5epJ6Lve6MthCIdVRBXeQByDI9OA15YFRjOOs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CthFs9f1LnRR0wQhvhuuUwaggUlJnKg7cKGn7r9VKZqPtTFI3kYBYwUo2F5Qsnih3
	 hC8PzxIj7Xf61vsm+FruKwoivGZBqrrxiMXThg7M15EYVsOsuponhm3PL82sZiIRDO
	 z6iMQYnrhGpavPlEc6r6KIi/FEjnz0XSrTJyEuNbHBFwDWgccmb4ZruDe5azCJZrPH
	 Ybtd1q3PZbJeVBMYRCd6pYGaivlUaSOcK6Hjn9yWGeXQP2Sy3j2Byq5DPBfP/sJwA2
	 LVdAYKb7JKmmCdBg/53gI2sayx0nIZ9UsLiy0Omatr5lRWdwFeuuM0VMSyIFXLaVEY
	 5AbJBn3EH0XoQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6798D60A36;
	Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.16, round 3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001061242.9073.10352428802894684202.git-patchwork-notify@kernel.org>
Date: Mon, 20 Dec 2021 14:30:12 +0000
References: <20211218052003.GA25102@dragon>
In-Reply-To: <20211218052003.GA25102@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 18 Dec 2021 13:20:04 +0800 you wrote:
> The following changes since commit 4ebd29f91629e69da7d57390cdc953772eee03ab:
> 
>   soc: imx: Register SoC device only on i.MX boards (2021-12-08 20:30:00 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.16-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.16, round 3
    https://git.kernel.org/soc/soc/c/7ad8b2fcb850

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


