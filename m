Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CA7C3DA50
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D3D8C4AF48; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAD2FC4AF16;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451508;
	bh=dqBZbY8bd1yVkpanzklLGni+TAA8LAS8hOo0127yQoc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CPzvIqF6wvxyHF1Eer4A1RaldtHDUFTXRI7ZjJaWpAxscORRUSk5uSj0nrjk4SJmL
	 GVqj65596ygogESaP5St/GzrGd/mixVrnFtmF6DCL0/Sa24k8umDQShxlpGT9Ab9Ra
	 bQ221iiLGFtqWiRQGWs2N4LuQmyXgPLt1wefa/BxmmIDRcjiVBVRUIylV2NINey6KO
	 np98HO4ERXE2frcA5q6lwQhae1ej2iqG+llokXxKOvAPP6gfP+R7CX5z8x1mZr2IN3
	 kRKfLFp47JcXo27JQ71RRcDoqlmdGDoGxcx7MBmqsc5AfL4EMu92iCLF0hccHefKzC
	 Ne7+VtpOyOC7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3A26DF371A;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: ARM: alphascale: add Krzysztof Kozlowski as
 maintainer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150786.17395.2897097540920505886.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240612141018.7348-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240612141018.7348-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Wed, 12 Jun 2024 16:10:18 +0200 you wrote:
> Apparently there was never a maintainers entry for the ARM Alphascale
> ASM9260 SoC, thus patches end up nowhere.  Add such entry, because even
> if platform is orphaned and on its way out of the kernel, it is nice to
> take patches if someone sends something.
> 
> I do not plan to actively support/maintain ARM Alphascale but I can take
> odd fixes now and then.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: ARM: alphascale: add Krzysztof Kozlowski as maintainer
    https://git.kernel.org/soc/soc/c/3974eeb92565

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


