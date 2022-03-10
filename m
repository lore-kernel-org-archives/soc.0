Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C272C433F5
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2321CC340F3; Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DA1FC340EB;
	Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646919011;
	bh=vi00Nqf2SN61nteu990lRJ+BQOGTM5+CdWRubAmGUCw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=i5CsewD3HOe3DLeN6THSi1Pnmw1GOYN3+gwaNci8QzEgUgh6G+/plYVfQe1C3upIK
	 lVzOKXVlgvgRkfa+cM8szwJ0pnSEST17nU0YzmoOO4jpT7M6fSnV53BjGgQijzykl7
	 qF94FLb8+CVf6GTpsoFJpXyaDHUr+icGocSV9roEaRv0ZMj4FrV1UX67Rkef+lTTr0
	 lMmqt3G1CRtSaFfM/3AJvsYHY+AZWdUYdBgrUykTO2VpZWIfFVvG9iJslGpynnntGN
	 IvKlN585tAv2WrWUEvOhC99IRvwxiiqLuUOgZRhikmjolQ5vz1JCgBKaFU6Vkki+AQ
	 kEkiR1Q04B9fQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E078CF0383D;
	Thu, 10 Mar 2022 13:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164691901091.15792.6370802357865427713.git-patchwork-notify@kernel.org>
Date: Thu, 10 Mar 2022 13:30:10 +0000
References: <3788968.RB9BLzCXGK@phil>
In-Reply-To: <3788968.RB9BLzCXGK@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Mar 2022 02:38:50 +0100 you wrote:
> The following changes since commit 5a68ce0a7b89a7005a71d406435a45a24c7e86da:
> 
>   ARM: dts: rockchip: remove status from rk3288 crypto node (2022-02-15 08:59:53 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-dts32-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.18 #1
    https://git.kernel.org/soc/soc/c/634f0f26cb9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


