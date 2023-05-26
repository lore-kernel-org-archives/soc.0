Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A68C7EE31
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01E7DC433A4; Fri, 26 May 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0B6AC4339B;
	Fri, 26 May 2023 20:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685134221;
	bh=y54mLWGFZZOud4bkqm3gvwEDsXEDUKT5CtL5MI2UcUI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uifz+nB7AkmNpiGHIxXxzwaenzQ63sgRQodlTGVkvwvMsBqw8Uyuyzh6R3c6laSzS
	 R2wRpWtjbUIfRqVklzGjattd3lsJuwG4s8o5qJlLe0pqV04M9v1Vg9WUHZB9MtD2LD
	 4FjPwINttdciCqAsgec5HjQ9/7XSscWE7qdQgBsa9FDDaBT+hfl6suT1ud/vvoq0VX
	 vYgKbKh923SfNJjL9Z/611tzBJ6StdOUfW8/SzuEW2gF55b7Ibyaw4gDaUoU508Uhn
	 LqaaOm3AgF2mp60RqmDOYSzH5D+mQ8CW27WHAchZ8O7C9Z2+3xJxySNbGMaRx2LYix
	 JcIIIprw3Sj9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BEA29C4166F;
	Fri, 26 May 2023 20:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable ARCH_SPARX5 and ARCH_REALTEK
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168513422177.30982.17734021626740346420.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 20:50:21 +0000
References: <20230517143011.549319-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517143011.549319-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 17 May 2023 16:30:11 +0200 you wrote:
> Enable Microchip SparX-5 (ARCH_SPARX5) with its MMC controller and
> Realtek (ARCH_REALTEK) so their DTS will get built with defconfig and
> maybe platforms could be booted from it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - arm64: defconfig: Enable ARCH_SPARX5 and ARCH_REALTEK
    https://git.kernel.org/soc/soc/c/795acd67c584

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


