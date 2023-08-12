Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ED9C07E8F
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC459C00443; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B741CC4163D;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=Vpo6MmjcaiiUjTUK0RpsmMjhIf3Y3GVtseTswlPaKB4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MXBYW9jbOqXc12tDVu4BEJrA2MUoOTa5sfJFXc9D3kg3STdKb31PevSI6LU0w6PcJ
	 Rz2ze+4tsB271NE4jvEfu+2aAqhTg2hZVZHF63ycU3vcZ2Vpd4YPeYXTePnQnpDrTH
	 C1K2FPlKwViNsePog6y0KNunhNpzU0jUcOqkXECcAoJZTTcDi6wADrJ4BK8070sSIY
	 IsjL4Itx5efu+DMNS7DMbUcYUYYHRegfc9vZ3CTnwBrG+VaSP3ktuW42z68Vnt1+n5
	 HgPcU1wIsXAyvlg3ydY60XGw5werOAlgX6wsdghfJdyaIGMNQ2uGoB4qkkdGwdFKwc
	 3m92zi5hsrHKg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5FC4C595D0;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 DT updates for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168967.30475.17995332838397133612.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230804044102.231448-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20230804044102.231448-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Aug 2023 07:41:02 +0300 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 DT updates for 6.6
    https://git.kernel.org/soc/soc/c/9f8f26424e8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


