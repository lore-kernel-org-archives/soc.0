Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F61FC3DA41
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04317C433C7; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2530C433CC;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491917;
	bh=WDyEa1VKqlcIPPTEKBvALwcRQ1mMlzvpYbNTEbjcz0Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lfI9qotANxqIZBqpkiA4scSbjEhgsma8776N5S7l/GAY6H4jzE5osauLQSjn7dy+S
	 Q7vqZOAkxYRtu2LyE8JujtNgWI4p2AetKPBBzEv0jEYHOnKZXOI9q5As43kXaR3Hlm
	 aSQzpdD1F42COLgKXk2n84ZlJYQQ84p0ZYPQzTkUGKaoefzRvhoi9dgI8r49Hr30vB
	 NgwzLV8tRLZBYO9/Bv1nI8B8lDW+doIloXgyDCydP5uyCxb+fBPsdARF+ySVd8WFBq
	 UTAJGqzu9UZuKzKx6YZe3StM042Rg3Nk6+ATA6I67AXratseF6/bjA8L5Te0liGZmJ
	 KUeMk00TeMAfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BE404C41671;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] i.MX dt-bindings changes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191777.22284.7150829150269000272.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
References: <20231015132300.2268016-1-shawnguo@kernel.org>
In-Reply-To: <20231015132300.2268016-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 15 Oct 2023 21:22:57 +0800 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] i.MX dt-bindings changes for 6.7
    https://git.kernel.org/soc/soc/c/6a4347fd674f
  - [GIT,PULL,2/4] i.MX ARM device tree changes for 6.7
    https://git.kernel.org/soc/soc/c/2de3561113f1
  - [GIT,PULL,3/4] i.MX arm64 device tree chanages for 6.7
    https://git.kernel.org/soc/soc/c/1b42ff0c869a
  - [GIT,PULL,4/4] i.MX defconfig changes for 6.7
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


