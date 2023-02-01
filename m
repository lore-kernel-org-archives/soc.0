Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C46C64ED8
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5D00C433A8; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B6AFC433B4;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269022;
	bh=0FAcjPTTC3QXc11nBTdOwU9YSFlYvRBrbsnDJ3pChkw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kj/jVl7YhGOMI+YnbpJtPJLTCPdt85+EBylEEK4N1QGbq/FFQw1gqC6faVpaAbtRD
	 1XLGU/mPTNYo16RL1sksDzXh5HyoxpH4tTcuMyCpdZaCTAVBIbxMNuzhMvBIfheB7m
	 hUPO3HNrYM8VJ5sVvTSMFyqLsgWQd5RtDuAqpqa883c8cMzWTaubHe5sanTR+pvpFl
	 y6JcfPmspHHcLhc6ubNtGMpL6CGVz1ZAwhfgVymCvQHx7wXrePI+pgXnTDvmuqdQl/
	 lth/PnVLxT4VVqtrmoKX6P7XP2D1xOdSxBEh03a+7YpBX8Kff4emGyV86LivHK0nO+
	 CBdtCyRyYbaSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63131E501F1;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] ARM: dts: samsung: exynos for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526902239.23236.10935916240995952730.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:22 +0000
References: <20230129143944.5104-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230129143944.5104-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 29 Jan 2023 15:39:42 +0100 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] ARM: dts: samsung: exynos for v6.3
    (no matching commit)
  - [GIT,PULL,2/3] arm64: dts: samsung: second for v6.3
    (no matching commit)
  - [GIT,PULL,3/3] ARM: samsung: pull for v6.3
    https://git.kernel.org/soc/soc/c/3f0f5d224c75

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


