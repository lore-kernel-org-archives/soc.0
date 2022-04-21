Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED77FC4332F
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B62A1C385AC; Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FEBDC385AA;
	Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650555026;
	bh=y5IYTaOiwAvAU1CAUKiqx0DYri+gO9feUVW4QMMHN74=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Xo39mYXhwsS2SWnKGDmf3Rrkiy+jIn3o24cGEc3Bta3L8yQkSmgghm+N+4kh7JPHy
	 4rRBLe4c5ztt/sHUsyf1+ee7X+cy8eRryR7I6vbvjnt7DyXGkaTSimrClUSXAxnSxC
	 GCjwEKpT/pF18CgQOzW2ihE4NvJWnIzpfYSQpd2nKZIntIb0KYyTg9h0VcPBoW1kZ6
	 ihHqlP/LU9ULW276BQI4IPO0SCSJGNzcKfoNz9IVMQrMg4FsRuGrhriYSR81/rpAKd
	 eOTRQ72NekLseBDg4D+cmUiYLaX1m84p7/1jPkFe59NlQyE03R0cQP4nQn6VHsN6Dm
	 fd1tmlqCYU2Xg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76532E8DBD4;
	Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: add Bug entry for Samsung and memory controller
 drivers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165055502648.23603.2098480714666355342.git-patchwork-notify@kernel.org>
Date: Thu, 21 Apr 2022 15:30:26 +0000
References: <20220420104708.106738-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420104708.106738-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Apr 2022 12:47:08 +0200 you wrote:
> Add a Bug sections, indicating preferred mailing method for bug
> reports, to Samsung SoC related entries and memory controller drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)

Here is the summary with links:
  - MAINTAINERS: add Bug entry for Samsung and memory controller drivers
    https://git.kernel.org/soc/soc/c/90f21460e49a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


