Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269BDC4167E
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 23:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E14ABC3460C; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBC6BC34609;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639438242;
	bh=7C6wCEnDKknRzrD3dBViQc7wjGSWbmbzukH1r5YUojk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=K6P+vPoIxJwue4MrGjwx29m0zPpthVu0A+9yC8s+hrTsNZp0y1/QYfeMqD6rkPHtt
	 /W/W245K6DGpsB2TLrxCpGeHJnGdV1UqEnX5d92fSaVlqmBbivgXj43nQMEnErSea4
	 EMz6ijQKdkFkyo01ljw5WFgDvJeaYar2LGwvzP5BNTUFK9c1hNTvw636EW5KN7+zQU
	 SNHgqsvpefr4JZr1VzdXYLuZWXBBRVjsUf7qqTWm5c51vzDjt5iVQb0Kx6sUA5LiUb
	 gd4h07qoHVhEeVA6rGu6FmUDT1T5Yoz9PBVpYOYz1FPq9yVm7zg5sbkRpENx9Wm0EB
	 5TX1PComJ0yaA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B22B260A39;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163943824272.22239.15799957417427005441.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 23:30:42 +0000
References: <e18b476c-7b1f-de73-53a2-0e21fb5cd283@marcan.st>
In-Reply-To: <e18b476c-7b1f-de73-53a2-0e21fb5cd283@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 7 Dec 2021 14:57:22 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these Apple SoC DT updates for 5.17.
> 
> This brings in proper separate DTs for all t8103 platforms, as well as
> the PMGR nodes and some miscellanea. The PMGR driver itself will be a
> separate pull.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 5.17
    https://git.kernel.org/soc/soc/c/7f0ef89c0fa9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


