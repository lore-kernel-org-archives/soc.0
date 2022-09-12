Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAE2C6FA82
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AF43C4347C; Mon, 12 Sep 2022 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 055B1C433D6;
	Mon, 12 Sep 2022 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996617;
	bh=FZWlF2PZvM83EU+atZJZ2AFyVgqSk5g8gp8PllTGrPs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=U0G1RSaTnTmYOG8R/SkOHngo31mQsVe1xNkeOjNyYu3wR/+S8gqx8i37eh3CESAV1
	 XqqIl72UQbZUaSctZS2lS0g9t1esIh3IRYxN3uj5IeLvb+InHjgTGpd3CKYEYmDIiP
	 X9CrkBVfbRIIfx5ld+phnMoFLJ9UoJ/eAtTyuhJvZgSyUrrkey4SA4dNpAQidCaaSH
	 o5wDSuiZ1t1GMkVo88o4SqisCB18Z+2OPtczmXZD+iopE/JJ+P9jiqivZsofyOyULx
	 yGhTakaOR23frfCD1YGWaRazpM5K+q3p+AsPpBwUf5VvfNLkjFraQfYYjTIixZ0bw4
	 3jbk9XTT1zg9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8D53C73FE9;
	Mon, 12 Sep 2022 15:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH PULL fixes 1/4] dt-bindings: memory-controllers:
 fsl,imx8m-ddrc: drop Leonard Crestez
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299661687.5098.10246744412026566143.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:16 +0000
References: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Sep 2022 17:30:34 +0200 you wrote:
> Emails to Leonard Crestez bounce ("550 5.4.1 Recipient address rejected:
> Access denied:), so change maintainer to Peng Fan from NXP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/r/20220817065946.24303-2-krzysztof.kozlowski@linaro.org
> Acked-by: Peng Fan <peng.fan@nxp.com>
> 
> [...]

Here is the summary with links:
  - [PULL,fixes,1/4] dt-bindings: memory-controllers: fsl,imx8m-ddrc: drop Leonard Crestez
    https://git.kernel.org/soc/soc/c/96c9b511fc0f
  - [GIT,PULL,2/4] memory: drivers for v6.1
    (no matching commit)
  - [GIT,PULL,3/4] memory: brcm for v6.1
    (no matching commit)
  - [GIT,PULL,4/4] memory: mediatek for v6.1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


