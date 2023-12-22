Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3F0C47DAF
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFF29C4AF6B; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9F4DC433D9;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=S1Dyz92nGxrHgtCuV6XOC+9CuWJDGbIPK8WscWSmRcs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=P4a1QkYGTkU/SAJ75Hvq/rXA0x+zo1sUvyORFFDArtsaZuW3v0+kvGEaKu3ykSa9m
	 YEaM+JkJ8S9lvPgxegIBcd2pDqf8AVzmjPh6h36ary+dpsU6dWwDYI6xgDqoBIvXCc
	 UXsMqoNlgSISSYEh304BS74IqX4zegu6eAgqPExwDde1b+Ko/eIJI7jTeZO3GoBGSG
	 gG0eG46lkjNzJkSlbITlTxsh08aT4ckU6IJU8m2lmqNlk3vyx+TEMVwc1gn80d175K
	 CxPO+YXnUD4O6vc/4LpH6Id+Sx2f3fs5b4OZpTTdCUNoBiZEEz5tTb5q+f9Z/8o+do
	 JjE4uIZCiL9QQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C6BFDD4EF5;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Devicetree changes for omaps for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646757.10550.8014460807025017166.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <pull-1702037869-295608@atomide.com>
In-Reply-To: <pull-1702037869-295608@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  8 Dec 2023 14:18:17 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Devicetree changes for omaps for v6.8
    (no matching commit)
  - [GIT,PULL,2/3] Defconfig changes for omaps for v6.8
    https://git.kernel.org/soc/soc/c/9344204bb92a
  - [GIT,PULL,3/3] Maintainer changes for v6.8
    https://git.kernel.org/soc/soc/c/7eda5fe9684f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


