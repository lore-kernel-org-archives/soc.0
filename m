Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A3FC5478A
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08420C43142; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7219C43390;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463561;
	bh=UC/Rq2/Nqxtnhfv1Ey+m9dH/9wP8PI3QFT8weqtJ1Q8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=l+4sUAH5RrsNqIsFLmuaklCT3/Me5yETLoPH15cZHO3N7s3JHNYTCddIiqi5dyJLs
	 5fBKanjcJ1QXfIxIpq+C/ig9yYtQEBwJrZTDf1Np1SDbWjBsu+wglN7p04qfH4r1/R
	 NdKNbB6cMkOiacmwDzfEZHPU6AlwCquFex75sQp4kCiLd9RNkSLnJv0VyYhRXj4PZ3
	 WzMdzbNHQ/q2d588aXip26pF1j/kNHZCoZa3zULEGxdTnaCXy5LuBLeDNvoYv8VNDv
	 2JlMUELZWOqoap5i8WVh6qSnDZkXPDo+goiCOjEA1JXfaoMQjpS85DqByyLqFDinBL
	 olkY+Ead8TONQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2B61D84BC0;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846356185.4365.4493258422808077322.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:12:41 +0000
References: <20240218183046.32721-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240218183046.32721-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Feb 2024 19:30:46 +0100 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.9
    https://git.kernel.org/soc/soc/c/d22ee157fb25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


