Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80967C54E55
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51B15C43609; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34351C43390;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=IrSULPMsxYFWUkqLt7xCanj6q8CWb9ZU+g9HBeveP5Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=j5k+iB9mWY9yzIcaCgQVWsxMNCUZMM8fZjjxrzrXkjuc6MSdAjWls+CaJ2zmj8zv6
	 KrDS8746uuyVpTXFqW6LAGcZZPfwulKeXGfpLncF3jyoKWkKFpE5fXd4mmz/2yEyGC
	 oREfwA3ov6bUT8MOl2oeFMrCNxYvZMY5O2ODFn5a5vQyXy7rKz12Rdip7f7cvCh999
	 mU46NU20DzaMs+YYcQbDHwM9DvQhXDiqP066Ej65PAn3DFMM+JYZ6VicNtwYH4SPor
	 ygtvnVBChFmhLLJgl4j8LG0j4k7WeD4XKttypX7Q8G90uG/g9uRO/i266x+cf8z5Im
	 KeK/hnaEYIlJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1296AD9A4B9;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403207.23732.16617933313445772900.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 17:40:32 +0000
References: <20240225032456.481112-1-andersson@kernel.org>
In-Reply-To: <20240225032456.481112-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 24 Feb 2024 21:24:53 -0600 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.9
    https://git.kernel.org/soc/soc/c/70881a7209f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


