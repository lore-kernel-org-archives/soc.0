Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F1C46CCD
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F4DFC433C8; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE7D9C433C9;
	Thu, 21 Dec 2023 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=nhxuahWCQCwSzr/j272e3mQtfWD/sSj6k6r2jLirWZI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RlwyONCO1EbVeheMexBHw+iFi7b9FjUETIVxr0U7wkOcr8NC3Rrgj+gRHBqXAFhkq
	 7P/oO5ib/uLoK49qcaOpq1UPdem5eCXydfdnrU4uNN/Wyssd5S4wYhHayhxKGqSWRX
	 l9XrAJK/gVHUvY6MHDiSlTvRJGDNaooDRkvY+dM5zh1cGfYBt+nHDGjf/785jBncST
	 +oIiJwN/6fjjASMeP948MDgE9O/Sg5ib0WrsSODwIGDRk4naiFxH316RsigBKfPclL
	 vCl7gt41nuKgQLtgLOt4b3/BamynM9Zl9fARPHxGBQSOCh6caMv2s8XLt1Ft5iINxt
	 NCbl+C4QA87XA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DCFF0DD4EF2;
	Thu, 21 Dec 2023 17:41:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] samsung: drivers for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046590.3302.5955054557458272724.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:05 +0000
References: <20231220084722.22149-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231220084722.22149-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Dec 2023 09:47:21 +0100 you wrote:
> Hi,
> 
> Driver changes needed for Google GS101 SoC, plus usual Samsung SoC driver
> updates.
> 
> This includes topic branch, see explanation in pull-request/tag.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] samsung: drivers for v6.8
    (no matching commit)
  - [GIT,PULL,2/2] arm64: dts: samsung: DTS for v6.8, part two
    https://git.kernel.org/soc/soc/c/450388847b3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


