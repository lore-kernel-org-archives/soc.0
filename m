Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14D6C25B6E
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7F08C43391; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DC5BC433C9;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698268828;
	bh=kExqErPzDU/M0RwYTzs10D8rDKKcx0tFMMvmjWtRL8k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LFnKJDrPCYz+3vBB4bE1gKrhqJAlX3R8YJM5rG6TvBZS9ssjUk0GhwKJaTpj221wd
	 XiPXjOq8ABI7+nVsFmyfKvrA5OcGc4kluhE5mrgA7UldQV4ohDt5MAcOlKclWtRSyV
	 yu8759j2yMVRfDG4DltCFHG6uDLfm4fMLqPEl4Hl/IecavLYTA46r6H4q9XR0BHBwb
	 Ubl+LVxRP249bCCWWk98MCFu3gJhvc+DfXMAC7Q6pt0qRrYHvICxV0+MRTWwwKThtE
	 CndDvU2wRRMKpim63kBI/h+Qp4I/8RkgYqCmR7vHWqJ0PbdwUlAn/96z1bzz/JA2qt
	 s5rANlpKn8pjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6A3F7C00446;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: samsung: Second round for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169826882843.12441.13085682262479734905.git-patchwork-notify@kernel.org>
Date: Wed, 25 Oct 2023 21:20:28 +0000
References: <20231024132615.65609-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231024132615.65609-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Oct 2023 15:26:15 +0200 you wrote:
> Hi,
> 
> On top of previous pull request, last minute improvements for v6.7.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: samsung: Second round for v6.7
    https://git.kernel.org/soc/soc/c/e209b029c7d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


