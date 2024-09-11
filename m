Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1125EE49BC
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 15:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BBBF0C4CEC7; Wed, 11 Sep 2024 15:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BF8C4CEC0;
	Wed, 11 Sep 2024 15:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726066833;
	bh=BV83YipXxBevKxVa3+xN9Ts324iZKo7puMbjrhZCfmY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YZx9fB3Y30CjyY9oI2H7dg4qCfsBLenJAqZqP7sFB15fs4tvbzgtMgjYsYfexZW5M
	 f/LjRYiGjzvoGeEdAJ9GqJ67bR9dxIS0mSLjUbF//cvb+5G1Zi1uUuJmSxkycJKhUK
	 yV26JWhMvnRjrwIck87NpucRzKqo4FkTgRhmALVWRzM3JiB067+9pks+2S2elztI6M
	 F/pB8xQ+4ZKAxVdafIExkf++cFN/+ZuB4XwAocWpcyvXVrz8CFz7muU4GJ4l0aQ0Ky
	 fsUZwfIlyyE36UjRGsqPkx9FavQo0PuHtCw3sh4KE0WwRBnOethN/OKUyIjxRBCKSl
	 lZ1xoNokZeL+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFE43806656;
	Wed, 11 Sep 2024 15:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.12, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172606683478.947400.16403227065584024006.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 15:00:34 +0000
References: <20240906140859.71712-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240906140859.71712-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Sep 2024 16:08:58 +0200 you wrote:
> Hi,
> 
> Second pull request, on top of previous one.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.12, part two
    https://git.kernel.org/soc/soc/c/b62800736f61

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


