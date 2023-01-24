Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC102C54E94
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62A53C433A0; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C335C4339B;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674580834;
	bh=JNM0xFCbfpA319OGUUGzJtGmnIhStboIrf4z10T4URw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=D/I4+ee0926q98W6ekdbDXxOCxuyUOQTT30lxfuxcafmrPtMBqNd+PKFHw5ktkW3z
	 FrLUtk/KgGzj8PzqqQT9/hTZNFJajGo6g3w0ysTXVuj25wINI2eqyLaxCR3cuCWCg1
	 WDS47oa22DffwCQrF/9fNgz1Fq1umb1Rf7Ber3ZV2YusaW5bezLV07Fk/s77rnT4U8
	 nvm/Y8japed6UhVnbNR08OwH7S4smsHvrROf/4JD07U23P6aTlN+/Yd5IzgJbP0tYP
	 evZHKhcKJvTm0OAJz05MwOXTPLv3rs0Ol/pPp6jLUDhVgn2h0/UOsDkR3CjmvTU5cE
	 rc6rZYRsYwe/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 21CB2C04E33;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: samsung: for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167458083413.16533.9982914988750900308.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 17:20:34 +0000
References: <20230122122605.30720-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122122605.30720-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 22 Jan 2023 13:26:05 +0100 you wrote:
> Hi,
> 
> Tesla and Exynos ARM64 DTS.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: samsung: for v6.3
    https://git.kernel.org/soc/soc/c/6932b6ed4068

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


