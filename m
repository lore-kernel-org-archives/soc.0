Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F5C0729B
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98EFFC4167D; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 821B7C43142;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=+ngi720LjiOndOfxTlxZ91aO8uCO4ggvXwlLfXsXZco=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hxeVlM7rIXTQFeqPDXXFBCLsh8cQU0uiUwbmu7JV3evuaSkuSf6Ff0zrr9UKCZVOy
	 hhUG5zA20DbSHmr70OwFlOoe9xEraunjN7z7Lc/cpV5EL1AhbbOh0DAen5loE/lGcV
	 oh+XiVTnQ/55x0gtJTfBKNpMMXZyWzxpQEjatCAUrzaFabmXWPo16wpPR+D7DuOonm
	 W/uW0L4bzkoSss9aNuxUm6HrJJwVtBnU2h8H1XeoSYMQb+ZQJB6f1UYu6rCaDjMSNL
	 Ddf/QTBWRFszDYvxQC0kTUp914vUYNAHozQ3A6VyEmfKgRGmn9j33p24ZuKNsluKvc
	 79uSBhTmq6YQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 70285C595D0;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168945.30475.4119337628363519106.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <CACPK8Xc76O5kLEAXRtbFXZcP=ObrKR0Kpez_er+zV2vZffZe7A@mail.gmail.com>
In-Reply-To: <CACPK8Xc76O5kLEAXRtbFXZcP=ObrKR0Kpez_er+zV2vZffZe7A@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Aug 2023 12:27:55 +0000 you wrote:
> Hi Soc team,
> 
> Here are the aspeed device tree changes for v6.6.
> 
> The tag has a -2 as I had a typo in the first tag. I removed that tag
> from the repo.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 6.6
    https://git.kernel.org/soc/soc/c/083f10158db3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


