Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850CEC4707C
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7442BC116B2; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CADCC4167D;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=fY4I8T2uYGf6FUXtqkYbHnbgQp91GXngnt879iHxAkY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oD/Nt7c+vIharvvCCj1iuHT55QYmBI+/b7nOWYxGtn/neBCck+Pb/53jcypOHe/QV
	 Vjv7TQhqzkrBmSgvmCnbf/Yeip//ELjoD/gEWlI/0rmN9QiI/t9vU1n7e572RaJw2r
	 +w6SljYGpmgD/GPssYd9YD5k8kmKzAuDNhK46j63vrGzn5Hn3jF1puPkmQmxaR6nup
	 2q6ixM04hpnKsglufou0uE2skZBUBSibG+2kpxU4Vma4wJs8uTJ6Ms+uLWrJ9PXWtB
	 ODICW1fLEBh/zlEy3XcSCA3NIlIW+3MfttfnkQ3K4xOLJ5yYmHUfU/QKTx82GaxKVN
	 jKzzeokzIzqCg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 47D07DD4EE5;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ste: minor whitespace cleanup around '='
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046629.3302.1169422038306452805.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231212-ux500-dts-v1-1-5a31b6742d85@linaro.org>
In-Reply-To: <20231212-ux500-dts-v1-1-5a31b6742d85@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Dec 2023 00:39:25 +0100 you wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> The DTS code coding style expects exactly one space before and after '='
> sign.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: ste: minor whitespace cleanup around '='
    https://git.kernel.org/soc/soc/c/487e6d8dc6ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


