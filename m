Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD195C3DA4E
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83FC8C4AF10; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D467C4AF15;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=xH2k4CvOfh8789m1IMegaA4t4/1J2Xukp27yLQ1mfdo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=O3ZEOYxOgzGhLS6UNW+k/JKxgL3Egl5etkRI5l/qD3hrb1grCg3ZKNRa3TyGpC8wR
	 WYU4JdFyCPxY/rhICfg3ySiKyrvtWwA4gg9E7Gp41YBpPCy31Azf61ewrjMSk02P7j
	 Y6b2VsH42DGGTrhcPEM0y77TjVzLjKt2OPjNwaFcYhIeRAYKcsgtd7/0a/t6M34xok
	 +1ejVBfcMHvGILxX/npgCKeyzW5JWSVy+Ym+Se4p5fJNd12dQPaINQY1XPAm6vbkrt
	 gZl+mfcRA8iGcAnpzPzkJGmxbsVBAqbUI5A4uc7adXVj/+SR/w5Vyhgo9EHwUtgBiQ
	 9ri7vLBNIubqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E666DF371B;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: samsung: DTS for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743838.12156.17129394486395968987.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
References: <20240702063514.6215-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240702063514.6215-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  2 Jul 2024 08:35:08 +0200 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: samsung: DTS for v6.11
    (no matching commit)
  - [GIT,PULL,2/2,-,drivers] soc: samsung: exynos-pmu: add support for PMU_ALIVE non atomic registers
    https://git.kernel.org/soc/soc/c/97c4264f62a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


