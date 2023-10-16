Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89015CDB48F
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41562C116A5; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BEC5C433AB;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=z+mTUgPLotGablre8jqSVH3MsVhgfo/dU24RB2FKThw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=grAYxqdp0r0Wdoi7QBWe4M24QKt/6niWSnmjLPtwmWfY0GdMEDQiIUWgS9R/QHxMF
	 +CO01YKyG+dGRwPKVTJOSuDALG5iq79UtwMs2cbxBUgRqajrQt7Zp8Ql9AqMg1UNJS
	 MnZT4HKeIryOorZOrpTL8Ugy3kfJ801HcxozWzJU0o6VTA+3jfVOkjwj5kuuhSpp6M
	 XJ/scbqxPmLF5Lki24YJaJmzdP21gXn2vL61TdGionYEfLKfwT0sxV9spO2VjSyUob
	 acerwf3Y78SHMGvkSiyIcNPZSjnEiH5mBkd2iIeAvbVyRziW8ZqD8/KDV07uu/jgkX
	 uSSDc3X5BJkhA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1C820C595D2;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] ARM: defconfig: pull for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191811.22284.4636174213126810975.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:58 +0000
References: <20231016072911.27148-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231016072911.27148-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 09:29:10 +0200 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] ARM: defconfig: pull for v6.7
    (no matching commit)
  - [PULL,2/2] soc: samsung: exynos-chipid: Convert to platform remove callback returning void
    https://git.kernel.org/soc/soc/c/55fa358ca89f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


