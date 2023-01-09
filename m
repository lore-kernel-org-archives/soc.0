Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C17C67871
	for <soc@archiver.kernel.org>; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEACAC433A0; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95896C433F2;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673304083;
	bh=1OLHvqY0kvUr+Y2whZFS27jfFSSBMJ0YOrTotg5CF4A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TJ4rR5ZC7CuZ3m4teiYriLMBTWJxSsmbuHf/NWGpNG6D9KKZjZzwj4/FHb1k538ef
	 tApZAoWGluczy0ePX+UWHHae/3X5oU7FM0NbUYMRMJAZ4BKq1N6s15DjvpsqjD8Pjy
	 bsQueVk07poxwIpfa4A0TB3grS96GZHB+jn8tZ7G7l43fJfySbcxQseLl3Ztn3quSo
	 rrLpsAGyJkf3kPW0FQwgMe0G5RwwKwZQJfZp/+N7jDYNtKGXv23WfcS1xfRvA2Dz3l
	 J21jrH+8Ff7z9FvKwe/8qv6FPdBqqEb3ij8WXsbSebyq78g6S3xNoMILQv3c6VrHuJ
	 XId6hxJqwEcxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6FA48E4D005;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167330408345.13717.7633965782308960746.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jan 2023 22:41:23 +0000
References: <20230102132016.GA10699@T480>
In-Reply-To: <20230102132016.GA10699@T480>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 2 Jan 2023 21:20:17 +0800 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.2
    https://git.kernel.org/soc/soc/c/33abcaef9888

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


