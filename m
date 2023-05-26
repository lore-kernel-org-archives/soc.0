Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A53CC7EE2E
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C985C433EF; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 176F2C433AC;
	Fri, 26 May 2023 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685101828;
	bh=ndf54B5hupBGRe7V63Pbyo4BhfRi9+WQlDPQw3ydPCo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=b4hUMzWIzskXUNuxSSUSWpLL4NMYdvRrZfu3boHa2OxJ3zvce2YYwlUnUHbojPjUC
	 WCbudFtr9ZHV72vnPvyG26tqRWnspzvQa9sfTh3sJiovsdb+sUWsD7vGhS6be3S1mH
	 ZlOKeZS4xTJTOY/o+s4L5y6yeYDQ8CWZsjQQ2hBI5pZ/ezF8Y0xVZ5Z/pJS1bw2GPY
	 QVv09IunMCMgQ8lmwAdTgrasw7pCBUZW4FQTDRHvpqYSKlpDiAwk5DTCua4vBmFkVo
	 H3EYFuZj3m6xjahmRS1xqs3GC6gaKaqd62Aqkjg8Ro51s4HgY/CJmfm2blo0JvltBI
	 V1TjwKALLdcrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EAEDCC4166F;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: cleanup and fixes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168510182794.28560.9708236829245095420.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 11:50:27 +0000
References: <20230517131255.471002-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517131255.471002-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 17 May 2023 15:12:54 +0200 you wrote:
> Hi,
> 
> Few usual cleanups from me and few other fixes/cleanups from Michael
> and Robert. To clarify - I don't want to step on someone's toes, so
> me picking up other patches is rather exception. It's just sad when
> someone's work gets lost.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: cleanup and fixes for v6.5
    https://git.kernel.org/soc/soc/c/6a023136126c
  - [GIT,PULL,2/2] ARM: dts: cleanup for v6.5
    https://git.kernel.org/soc/soc/c/c45585623710

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


