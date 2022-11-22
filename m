Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F20FC4708A
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 694B4C43147; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 541C5C4314A;
	Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155626;
	bh=ZXIim9qAwzVgPmnUxirSPQlM/0dwR7Ke04POMilCOqQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tJ2B73dylEyFYBS+cBFRqiUBa0PAQUIH1+dS0Kgj4eJBXVqMcM4h4a6Ahb8JfMcuN
	 wxSogo2hnMFL0ipyREOHMzNhtyD0dWxGXB/vaDlIlIDCBfDkeZC0QTa8Rctd9qJf/N
	 JoxIDvYhOzBjMNGIDXGwh+4/fPHRUToXZXN6jfQil22FO+Dho/nhY4l/+nSrVBA5nA
	 ILao9zAWz9Q+baOn2GqenBDMAK8awgoF/0FuplJVIcBvNOeHz/Kli3CSKUGSja34VG
	 wammCq6/auHWuFB9wIfDmnF3aJ0QnTl2Dnx8GW5e7Bb83S7ErNObwCKjL33Em44gGW
	 ktyh1nsjDiMCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DFDBFE52505;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.2, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915562591.11152.15754546745849066331.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 22:20:25 +0000
References: <20221116093509.19657-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116093509.19657-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Nov 2022 10:35:09 +0100 you wrote:
> Hi,
> 
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.2, part two
    https://git.kernel.org/soc/soc/c/fe04716e1716

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


