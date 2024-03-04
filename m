Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AB5C54E5A
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 281B0C4166B; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1036DC43399;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=Ildc1K07jdLPqaqF9Ig0kUJkTBbKfIgl952JitzTlTs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=swBfMh8xPH82kJJn2R3ncAej8omeJp+9dDbGCxxjllkBB37zmdBs0xgQnViJlc13o
	 TDPsy83ZNsEvGH8W+k4kVwa4fP/oX/yda+/PPJwjWkSpdS610qRX2dFa2XaZjQ8ccK
	 e77bGq8sPuRmzHVBLUtcOvR9Yj9BlWJ9Asfz0ggQ3GdTH2hg8viCAdixKAK1UzVNPG
	 LbM0arRJubCDfrAAEjfSG7lrMrKquoY3b+fusbve0ktJjbuSY7Ch9nMXhPTUTLznms
	 nZWvtYzqWepJ3TVYjUOWvPNOP/Zh54T9xmHOONsk0HVnN9c9HA7WZ9BCjaulxGC8vS
	 Q5urn4gwwG2iA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D70F6D88F8C;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree changes for omaps for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927487.27833.2823211412579815344.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:14 +0000
References: <pull-1709102762-376748@atomide.com>
In-Reply-To: <pull-1709102762-376748@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Feb 2024 08:46:38 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree changes for omaps for v6.9
    https://git.kernel.org/soc/soc/c/58c926a81eb1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


