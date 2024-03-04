Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7020C54E6E
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4D79C41613; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F0E8C32788;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=4ezhIgiRBJbQHIBSo7K9wLkbIwL9u7etNjXGxRKw8UA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HXr26PSeCbOKRK/i5XM0gJZ94Pq4+ny4LPDsuGlQfLpY1wD/gWwxkocR9LrwKUc+G
	 DDXeL03H3OyhqTM0Vk/ucUFavevSuDnJ5pdapBZbuqTdcuuUQXkAl+ZoXUdwwCUqSc
	 StAh2wpP7gOiwBkKzjhZbK66xmR/iJwGO81YrOiJms8RffVX6l4xqymly0Vkea2L4P
	 lWSzaIW6TnQ0PY5dN4CD0gOJPQ85F3HBR4GXjBrx62eG+n2W/31j7uGvwzfwHlMLaE
	 DGpRSIn0RcnOCI9hY69N7AxLKWqi1iHNZg4D5DzVMrkNCr6cBB+CD+6/J1jyf+LMDJ
	 q0mlprzY7AI6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76FB4D9A4BB;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] samsung: drivers for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872048.25915.15861478579075262666.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Feb 2024 19:21:38 +0100 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] samsung: drivers for v6.9
    (no matching commit)
  - [GIT,PULL,2/4] arm64: dts: samsung: exynos and google for v6.9
    (no matching commit)
  - [GIT,PULL,3/4] ARM: dts: samsung: for v6.9
    (no matching commit)
  - [GIT,PULL,4/4] ARM: samsung: soc for v6.9
    https://git.kernel.org/soc/soc/c/286fde5485a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


