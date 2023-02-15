Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5CFC64EC4
	for <soc@archiver.kernel.org>; Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62DA1C433D2; Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D8A1C4339E;
	Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676470820;
	bh=yn1cE7svMtTw29+WOOKD2LHJRGPW63o/FYb86TEADiI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KliJHldJG3p/5NMLV0shd3nTRfmJVDtGh68J8hgFfcWA/HqaKOV4Zx0XiGk6hIrK1
	 53h2tCf7WPBFkNWy/12gGYkHm+PMl+4imlg3CZt69Fte12OoSKx4eqMMn8+jhu4c5j
	 tMZQj4zHkJgNxg3whhPGJULrD8EThnYlgKhb3jwY+Jikb09co6PG28qZQ8jqYSaeVF
	 f0kUEhavuUZ3SGhRGBZp1OS6q16Ht6dRs+YMYBk+Wxk1fKyn4vEK1zxBfRQfG2MIED
	 w57NFrF8Ndc+6aBRFJmcThLepyfmwQA2ujaChvhWYg1+LxMChd/lcLuHR5cwfyYgOu
	 chm7LPAiUF3nw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26127E29F42;
	Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Few more Qualcomm ARM64 defconfig updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167647082015.22208.2822154055349582819.git-patchwork-notify@kernel.org>
Date: Wed, 15 Feb 2023 14:20:20 +0000
References: <20230215051757.1166709-1-andersson@kernel.org>
In-Reply-To: <20230215051757.1166709-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Feb 2023 21:17:57 -0800 you wrote:
> The following changes since commit 480ba14b9a95641647a6561d5b246de661589514:
> 
>   arm64: defconfig: enable Qualcomm SDAM nvmem driver (2023-02-08 19:05:49 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.3-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Few more Qualcomm ARM64 defconfig updates for v6.3
    https://git.kernel.org/soc/soc/c/af16544d4abe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


