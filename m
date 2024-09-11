Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CF4EE4981
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B364C4CECC; Wed, 11 Sep 2024 09:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A10C4CEC5;
	Wed, 11 Sep 2024 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726046449;
	bh=pPs5Or+gCMRzT8TV+7tjFNIZqVh/iZrmSNENlL7fjoc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Eyxs4qZZhyhY8laTnZK9Fu5T+XOdMM/Uu8VjQyfsrAxn/wjbKDycAdqK3CrzXJDYC
	 CIoP0XI10jSMdvzb65i2g3zyxBAo4dnXmNeT5Y0XaxIZo/4praEy6nd3ZyiF+9WPp8
	 2ByGgvqP+/mWm0kUTNs+0WzZxJ5bjJHoMm+u0SKqfiKvIPbpRYKhTQJoz/2AuniOpU
	 e1WpXRENenxR5tlOgd6955m9TZF8kXra94D6y2avA6OdpBZw9oAYG5zTJJgOth/QWQ
	 uU64Hn1S3wPYCnn7Qll8nCuBPPPHfi1k32a6xpQNVZIMsFryEIK2htiGQe1sIO+Yk9
	 UN5vEkFtjMEzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D1F3822FA4;
	Wed, 11 Sep 2024 09:20:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: minor improvements for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604645074.555636.5153314130547654804.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 09:20:50 +0000
References: <20240906140513.71307-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240906140513.71307-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Sep 2024 16:05:11 +0200 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: minor improvements for v6.12
    https://git.kernel.org/soc/soc/c/765fbe81d780
  - [GIT,PULL,2/2] ARM: dts: minor improvements for v6.12
    https://git.kernel.org/soc/soc/c/79800fa98d72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


