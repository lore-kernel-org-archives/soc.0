Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CE1C3065E
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04D2AC2BD10; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E21F4C32789;
	Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719609649;
	bh=jOL7dmQ8hpICePhC+vbVsCCs6RC1UEkOMfGopN0g0tA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QdrRspeGVgOpUWDjaVQ0Az+g8Fg7YSzoqxC3G7/AvVE7sI7IeUCNoY1qixoLxZx//
	 kpP3fUQwWNQ/L5dPA4iw3YTi5DEi2wRtoyajWHs0wFJRoy9fPcfY8D2c0AWl8ZFi5v
	 OuxrohfRQVzE8p4L7vIQOUB/Xr529qVhLSbkXehqh9ZNi9hNTesMR19FLBllOUDPjK
	 +pO7x9vR20aUfXAJG/1gETn4TvIjjtnde56OQsWaIS4N1+wq9IzgLe+holsKmbFVw9
	 IE+PyMZLh0ZjpmCgi63OqjV16piXyJ9QsShP0SP8O7l+XQZH6z1iAOH2yF7dlhQio/
	 BwWuGkU31++sA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CD4C7C433E9;
	Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.11 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171960964983.14447.10298348018210429510.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jun 2024 21:20:49 +0000
References: <4901395.GXAFRqVoOG@diego>
In-Reply-To: <4901395.GXAFRqVoOG@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 28 Jun 2024 16:02:53 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> Rockchip changes for for 6.11 .
> 
> Some new boards, some new peripherals.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.11 #1
    https://git.kernel.org/soc/soc/c/aff39a02b5b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


