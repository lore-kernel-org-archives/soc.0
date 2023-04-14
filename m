Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E40C77B7A
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C297C4339E; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85B8AC4339C;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=/s14LmNj+Oe2Kl4KD1x9EkTd+BYY128lSW39G5qKcCQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RRIzYDYke8tnidI8aCJhVdR443UHdVPxt9ena1fRHGRIJs7mHh2nqNicOUFtiCngZ
	 DqSAoMfe8u9gvVODtV9TEP7vnAq32uoAIax50n9NLCfLhKXOzIkxOIfkB2pN5QUcEO
	 BWy5In20Icc/bUr1hKWJKHWmsE0PI9TenanPfaNcx/q5PLcUm3TkUPJBWuVqVtVsYt
	 WMi7Ts3EVkAFGS8scrksvD6LktUN/ZK+FVfznBzO6XqHzpGlwWCE14/Z+ItiQLRMbR
	 aqsVoVGs32ngyGUzZ4ttUi6dXao4ozZl0lIEjGFV+c6zX8iOvJnB/J1MqD/QcDnNjF
	 VEc83in2ssLww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 675B5E4508F;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] arm64: dts: samsung: dts64 for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783041.23940.6900245097975372360.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230405080438.156805-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230405080438.156805-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  5 Apr 2023 10:04:36 +0200 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] arm64: dts: samsung: dts64 for v6.4
    (no matching commit)
  - [GIT,PULL,2/4] ARM: dts: samsung: dts for v6.4
    (no matching commit)
  - [GIT,PULL,3/3] ARM: samsung: soc for v6.4
    https://git.kernel.org/soc/soc/c/27994cb07cca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


