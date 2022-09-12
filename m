Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3019FC6FA8B
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16E8CC433D6; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 014C3C4347C;
	Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996625;
	bh=wrLDa2gyC3/xRowpQE2cz6G9xZAMLUTzNp1sENveEhs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u3UvWqVf1esZUKfTgU6pWr46b08xTu4AX53N8Z55RhjnK55e7aTTc0Xxr+Pb2nqzu
	 LgcR/9jZldbQb7NyAuyYBuFpjbt7F8tTlugp9vxEEYsgwgvVkGnaGJYO1fnLUT9Z9E
	 IEfaXc6RvwImdoAi+VwE8kxSJ27DhpuDrzdF8mjWg7kmm6Pmp5GvbUVGeDAMzJurdh
	 V2IH9+17I/aoRCT/Uo5qYnV+JEP0yGO5btf5phX5k2jQP91rZbSsszkmjDo/1rQmUT
	 E2qAHFE9hvtXjoPINQorNgUJfxQeXQI+X/5YS5XWLLWNe3aojEMx2V2nYLEPtxgGm8
	 7iQhNP+42coew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D61A7C73FF7;
	Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 6.1 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299662486.5098.11098520940584274511.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:24 +0000
References: <2252399.ElGaqSPkdT@phil>
In-Reply-To: <2252399.ElGaqSPkdT@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Sep 2022 03:22:41 +0200 you wrote:
> The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:
> 
>   Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-drivers1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 6.1 #1
    https://git.kernel.org/soc/soc/c/c3fe295c2ee5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


