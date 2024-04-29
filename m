Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D612C25B79
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FC39C4DDE5; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69ED6C4DDE1;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=LFXis33Vi6SQxeO8lkAaW2oKiSNigXIHiXPZZQcqyAM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=q5+2pyRCioZPJ8SKUqiaUlzQGpWcxqRT1TrdwjLCRFLOCcCZjGEuLsRY3pTSlF0cw
	 VKdCSTMhpAwZuvWxg3L07EfwJc3xsb9vUUBQU17GmnJiV25dMBYe/Jx7H24ljBx8Uk
	 39cpTPMcJdtWjbKuFhYXInwhWc8xTvHtrdG8LIDVCXsaHxVhZ3LN6qu1pwll7xixak
	 YSvZ8JYWugCBalBtuzvjQ+C4TO314hoNfdIiVBd8z5jKM7eoLKPdUfAYE/HVPeKLZM
	 sIRgeiyQbFXk9autJCFJW5lY+XzYpPb/272Wd2QX8aY6rm9aBdYPdA6qNVSonYcXqm
	 qL0tfFz/ZUPwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6028EC54BAA;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] hisilicon: driver updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444739.17402.4608908110220955088.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <662A3EDE.5070708@hisilicon.com>
In-Reply-To: <662A3EDE.5070708@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 19:30:38 +0800 you wrote:
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
  - [GIT,PULL] hisilicon: driver updates for v6.10
    https://git.kernel.org/soc/soc/c/29a7020067d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


