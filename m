Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB1AC41513
	for <soc@archiver.kernel.org>; Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35F79C433CB; Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 200BDC433C8;
	Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690576824;
	bh=dGdEzn0es26va9vP3EbafPHWdLoOCMH8R/Yd/oXoEKY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tXV8PXgRD1Z5SX4QN1bHToFSgIukVZUi1W8yMo3p7DWh0wqPx51npRUXkZeO5Ap+g
	 oQDEiGe+7WJttVlDae+XKJ5R7uNn/i6OdUEq5+vyvvyH12OTfeqPp+yf7ArRfOKxpy
	 sS5CUqHI1OXPliK7O4fkJ0Id5ECv6GzVDdaMGy6OtKbGS1USDq7oSaJyOjt+8B/nuL
	 530M+xzDsnHyHHN297B59XsRu3ehzpYb2ByZMlbqS4npImO3gRe4sxGU/zYIzv91nn
	 SP9lu1DCRldQn09puGoQ1l0wfPFqFXSEAXzTo23WZN2Xb3H+5Ep4KtR9DttFEO5Avr
	 TKaYufvb5BipA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F3BD6C4166F;
	Fri, 28 Jul 2023 20:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169057682399.20429.14427579840333776305.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jul 2023 20:40:23 +0000
References: <20230725075837.GR151430@dragon>
In-Reply-To: <20230725075837.GR151430@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 25 Jul 2023 15:58:37 +0800 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.5
    https://git.kernel.org/soc/soc/c/c05cfd71df7c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


