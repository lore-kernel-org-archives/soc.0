Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3DFC41513
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC8ECC433CC; Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EA1EC433C7;
	Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835621;
	bh=xjGkQvhWT0BPgwefjlBNy0NluUz9I5YCXW2yYzfrO3o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=loqTJcFUuchVIXB4v7RM7g96uT9Thdtcy6M4nvhMyXpZcIicOUuzpqPYBTpUnyeIY
	 SVjMAGwbFhIiCj68q6tS7BuSxZ3VVRPuV5F5Kn6JzF0uVqZo5Go7mhS/uFWIRmrKP4
	 7BYNfEYGL53epq/XxhjuzPBLti2CycufWET6/taB68rDcdMfAga5rIPJ45EIJEuTGK
	 Qaw1yk7NMvCDM+iqRLe67+NvxqRl7jT5yZDPtxUlk58fIAEX43gNdSCcAgdUE43Log
	 9DnwYhagWnIeP4/9EuoFAqlNG9bMq3bb/b9Mo9PYQZg6Lckq0agoU0mFzXSp0D32/8
	 lyqUhR2GDqBmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6EE11C595D0;
	Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: aspeed: socinfo: Add kfree for kstrdup
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562145.32343.17372484131116376881.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:21 +0000
References: <20230810123104.231167-1-joel@jms.id.au>
In-Reply-To: <20230810123104.231167-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Aug 2023 22:01:04 +0930 you wrote:
> From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> 
> Add kfree() in the later error handling in order to avoid memory leak.
> 
> Fixes: e0218dca5787 ("soc: aspeed: Add soc info driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> Link: https://lore.kernel.org/r/20230707021625.7727-1-jiasheng@iscas.ac.cn
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> [...]

Here is the summary with links:
  - soc: aspeed: socinfo: Add kfree for kstrdup
    https://git.kernel.org/soc/soc/c/6e6d847a8ce1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


