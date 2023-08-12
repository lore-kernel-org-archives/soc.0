Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623DAC04E69
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 463FEC43395; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29523C433CD;
	Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691844622;
	bh=hQftWQUqVhE0dKFvqFmmM3yX7JI4VtH8AYdkMRQLSWM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bHYqF6N5x7upsW7vot9kcraFLK6Q2Hbh4NXEnvkM3LxISpWJ3ClWM+GgwKYr+obaN
	 Y/4IAdphvG0HyEXRxkJZeiiM3p6S+JH8TKpSlibOPHlYgE7aY+Pd1bQLzuPWCTA2rj
	 jrsloMxNEF2d/biB9GUFf3kfL8rD23nDbE+fIOI8XBxQ9zguVRTtQpXRZ701YlyPVc
	 2X2MGwHRr8tFgkr9A9FL4yHKNGg+CJxg0WEpO7FuKdLYl4YuoTfvHlgym09gt6Yw7W
	 vIFJ1w9lAzoYjO8HQpPahT5BA06G2q3rLHXZBJTxXTh9kdKBEV1xTteVeo8RfBezQL
	 RunUhvf+vQigA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06D0EE270C1;
	Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm: soc: hisilicon updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169184462202.4542.17134378792891926056.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 12:50:22 +0000
References: <64CC9D9F.6040108@hisilicon.com>
In-Reply-To: <64CC9D9F.6040108@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Aug 2023 14:41:35 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: soc: hisilicon updates for v6.6
    https://git.kernel.org/soc/soc/c/d4ffdc193217

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


