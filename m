Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC72CC4707C
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E4D7C433BB; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D53EC433BD;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=BZiwOOS79Y/yJ1t2ttz8cnKqe5K8l0cI8fyow7DnRYA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sPk7trjakXEKBQRaCHJfuoL5EfTDrdlKfXyqbj7ooJprw8Kqoa+stDAG/WsW0kUpg
	 fKwlA5QzqnbA8x7wjOp1h1nRYW4KPXYsxbdAwDwrAetWHXQ/7fdXg+mfoHoxAbE7VD
	 6x2u4KMu3aK5xJSNm6IABXpBqGofSX+bbGpYsExSi1jzqCBIHWxfKnC+Dyf3CVyekX
	 R4ryvBxmxf5fv+cCNVYHE1phhwwoOzPgLg5T3Cc9HS5rUgLsj8FCdSVmZrKmPek/Fn
	 c4z18laIdwTvu6tykd7VmdemPWkFiG3vKwWNgUhIjou5kWnIqOnMfxQKz5eDwkPrXg
	 eb2MnrPzd6KQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3FBA6DD4EF7;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646725.10550.15936568856034335595.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231213061523.4803-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231213061523.4803-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Dec 2023 07:15:23 +0100 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.8
    https://git.kernel.org/soc/soc/c/8d446ff13a2a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


