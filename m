Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6D7C61DA0
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 958EEC433D2; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A23BC433AC;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674580834;
	bh=MZI0kRZuajeECTYxo5jGoCeQApdQ+xZs3nKYkFMCmSs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aMJBoiIRqvdW85gVx9rI97GwPw3s+oDZiGORNhuiAC9USYnJZgwaWOFc7/GTyKYFY
	 LpoehcoUazuibDeMzhw+xPQuRsEjXokUehdjPXkz8ZXozMAczJ3WZvbMrJtM+9mLZt
	 dqnqd0MakBV1yx8Wj/bNotSsiF5oE8oWF5hhW2sFaz7LqQgOh27e4IpCh3foUudVPl
	 vuWF/hNd66KQerdpFmqbWiWbIykX0vnohMe8iD93DPzDnpvIiyUMmUT83wa/ROqZrC
	 9fYGBJ4s16nwc8LJR4AI5OxTZG2eWjDuKZmjWQ0NlK2TcrkMO3C+Pc1hjsQMHzGYAV
	 uPHiVic/RpE/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41FF6F83ED2;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: Cleanup for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167458083426.16533.5877213124024690075.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 17:20:34 +0000
References: <20230122121541.29312-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122121541.29312-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 22 Jan 2023 13:15:40 +0100 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: Cleanup for v6.3
    https://git.kernel.org/soc/soc/c/65edaea65d8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


