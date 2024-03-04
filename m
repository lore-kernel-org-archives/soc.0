Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96774C54E63
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C77DC32787; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76DD0C41606;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=yoQzeu4UamWVQDOiHPtN0ShQ3PrhwPL2sWj9W29V4hI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OB0WDOjP+PfRxCTOvYxvSQFa0BHTjIby4TTjbgzgOaHccx40y/ThAW1117z1IN0fK
	 k0Uw6QlkYMFRBnd+g+BFNmqUfCnwohKZxNKIUIF6wcC4otZnA0a+A8Gv7d7gFiY+NH
	 CiDIkrH6CKiAW+FSfEOSsTgBPSNQn09uj3cbhITw/SEFSWUGpN1J09T9TojRQCgIti
	 huvV6/v4ckRP/FFKHz8RNNIfpkRalxphiTnZkAjHi321UunOoLQ8Va9HgfLqgC+NN2
	 qvJWriS6YqPyf64LuF0YOghFLhwY4Q068osbTJrJpQbIfxSaopcsoPLhVAhIZ93q0A
	 XaJrIWRznHwLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6394CD9A4B9;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers for v6.9, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872040.25915.8604926645989715568.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 27 Feb 2024 09:07:53 +0100 you wrote:
> Hi,
> 
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers for v6.9, part two
    https://git.kernel.org/soc/soc/c/63caaee9af82
  - [PULL,v6.9,2/3] ARM: defconfig: enable STMicroelectronics accelerometer and gyro for Exynos
    (no matching commit)
  - [PULL,v6.9,3/3] ARM: dts: samsung: exynos4412: decrease memory to account for unusable region
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


