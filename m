Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563FFCDB485
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49460C116A8; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33792C43140;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=nYFXU/bDw2Bi8e7T5teI0EuYhl2ryMxE6yUewvn44Ms=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HhDo44mgfAv5goANptAtt7u3jLLslnFOACP/vUVTxmnvlfd6fqsYXrCVdu0rRRpyt
	 47iC8K36PJKZIkB9oUODIyoeG18IDyO9Ur2zrVyWkTlzZZMl5FRGMo0ggAphBhKJwH
	 cV+dp5QHrFvRHQqSLNX5zoH+zm45J8uqrf0X78JChZ0LA5yAh7HWOsjYZcGOc3qZ94
	 +jBhIFUzQwqw5/zhpH/qeyWWck44M0s59EsA6cexPR5hM2Lo0oBAFSzftDC5BBPwyb
	 rxl0Sr1bZmzOZPAMPMr3EtjRqxW0kOGvYa04hti2vZYEOv3pE1ERRRPKWc+CcSySlz
	 nF9C+2NTR/2Gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 22908C595D7;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191813.22284.5511712841951634582.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:58 +0000
References: <20231016074013.28286-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231016074013.28286-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 09:40:13 +0200 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.7
    https://git.kernel.org/soc/soc/c/e855cbf28b6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


