Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED11CDB487
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1594BC433C9; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3547C433AB;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580028;
	bh=bzd3aGLI2p37yrv7GFB7wmyHdeyY1XgbF3EHNGpaR0I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cqX2p69K1667vH1va/+MKJC5QyxIrXkRCP/U3S2DCX+sHvZgR/YxTmpUETA3V4Yla
	 yMU+bq5UK1j/LoXUijAXX3tdKOgUy8iYPfy3ND36eXoya51ZcxdbfsYNl8TK/V7Xh0
	 NyHWCsr1eBg55wUa9Kn2qVDB8VZ8T7zTxx2wKt73yvZy9RKQT0AGlqJTuy31mWYNKZ
	 xnBjzvbzr5wDpYYsnsOsSS6tyiNHloKKGjiON0Uuntl4dejGMNDkgmpJu3jjrRhwe7
	 wSh4Yfi3Gwgy7vG54MyLYrU5ZvYxVHDs+qsbq8sCzZh68R/pi5ENUY6AZaSVpP1fXz
	 nlEGVTw0DSmzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D240AC73FE4;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] ARM: defconfig: pull for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002785.24805.15301724280481240379.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 22:00:27 +0000
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
    https://git.kernel.org/soc/soc/c/0c74ef26c50a
  - [PULL,2/2] soc: samsung: exynos-chipid: Convert to platform remove callback returning void
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


