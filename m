Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516E7C6FA92
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 370D2C433B5; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 181C5C433D7;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944728;
	bh=xAZRAtAgoQ+UOR2rcZoG3MKgARyUuRGAh9S8ApRsuwY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZMxD0D6Y2H/p/Y4NQXyUwrdFArNrgfBTuqOuM6a5scn67hCOJQ1E36FwgMLvwyssY
	 g4Y+SzmuyVpGUaZyrbPkAN9EmN1zFew8GE1WxUqnYw8tnq1f5qX+xH3yW4ZU5nJHJB
	 mItcYjmpbYH/C2PcK0QsOrc+6nTUySU6htJWS/85x4h2cP3iNTReTgnEywwnLSvAyQ
	 a9I1hQSDtDl5eeMjU9yaN+abYjL7nb1QAh8zaeNsnObIyFppRCP8xGcTKiq80GKKEA
	 AV5NYAHr/vHRS9Bo9mw2LYuhJ0o+09TJIB3sjdSUrvP9OM86oMPABkfIbuxNUsGoO4
	 +woYKeGgmeyJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 05CCCE4D03D;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] soc/tegra: Changes for v6.1-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394472802.12526.8987701011328962228.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:52:08 +0000
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
In-Reply-To: <20220916101957.1635854-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Sep 2022 12:19:52 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] soc/tegra: Changes for v6.1-rc1
    (no matching commit)
  - [GIT,PULL,2/6] soc/tegra: cbb: Changes for v6.1-rc1
    (no matching commit)
  - [GIT,PULL,3/6] firmware: tegra: Changes for v6.1-rc1
    (no matching commit)
  - [GIT,PULL,4/6] dt-bindings: Changes for v6.1-rc1
    https://git.kernel.org/soc/soc/c/195571f342ae
  - [GIT,PULL,5/6] arm64: tegra: Device tree changes for v6.1-rc1
    https://git.kernel.org/soc/soc/c/f58ec42950d6
  - [GIT,PULL,6/6] arm64: tegra: Default configuration changes for v6.1-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


