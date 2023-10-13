Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC1ECDB483
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26315C43391; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EB40C433C9;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=EJ0jKgdPKmUp0aFoEUhb80PVttsXyWWUsCARW8mXOjc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CSWux/6x0rcRi2yJ609n2jPl7Ylsm/El5H9oZza1gS5iLq7dklgXcgwlX5uOJccKY
	 5BC13ljeQ0wKS/Sf4/K7qnxMTmRv+pHTsYEqkdq2X0vtLAv2qaamEKu3fTUtOzhwO8
	 XzcAhh7bl/z9XrqRVmgfsFVLRchgiErMen2irPxN8StIYvgT4NSaJ1mILyADcXgCBw
	 9/WDGCpz0OKFOFpbiK3D6fATozrFYLPt4H1zzKN4u1YaeST4F01w+LLV0BNMpVU7lK
	 svN/HPdwkIb8xPcu7M/dYsyU5YY3Z8X6Wg6eXAZNhm/ybkbcqKENEqZMdUnLW2J7SF
	 oG+XnRrEQL2MQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DFD51C691EF;
	Fri, 13 Oct 2023 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: samsung: DTS for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083791.14185.12171172311534372828.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:37 +0000
References: <20231006093943.106002-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231006093943.106002-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Oct 2023 11:39:42 +0200 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: samsung: DTS for v6.7
    https://git.kernel.org/soc/soc/c/89ca0ec59f11
  - [GIT,PULL,2/2] ARM: dts: samsung: DTS for v6.7
    https://git.kernel.org/soc/soc/c/f358d6a5e6ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


