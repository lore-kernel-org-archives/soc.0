Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38790C35274
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C653C385AA; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 064ACC385A5;
	Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970617;
	bh=bx8pA8Myz3l/C0/rd5ScPo+VS33gl4zsbFJZfUHpwqs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oOTeZuChhgLl90j9keyaJlAgxINjmLcpZ6P/06BAsDLfe9i220tCNTkawzRgL0V7/
	 RLs2ZK7U6HdTWikNbQsLruKkLv7w4+uKN7TjWvC9ZeqgP+HubQ9Rp1Yo3E6rhe+yQz
	 OrhNrMgZL/xZ7zG0SQ6AYha7AoRZJVDJv3lU3xM6dUhw0AsversEV5JF/k0D5tkOHy
	 HNXikJ/0CZm+NRECKz8e83/tNLYYfwNAS+DI1co3MXl9Gty9bZatEnJQ7w8J/YSYCl
	 cbFU/ELX61b57H4HImDQGJSktKXVPTNc2cWKaJvUr9moaUmp6wkaGEfDPTivB5kjIk
	 Pu+EmWBLAQoZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E5CE4EAC081;
	Thu, 14 Apr 2022 21:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061693.10394.11766535308908472857.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:16 +0000
References: <20220411024301.GH129381@dragon>
In-Reply-To: <20220411024301.GH129381@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Apr 2022 10:43:01 +0800 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.18
    https://git.kernel.org/soc/soc/c/803fa58dfa47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


