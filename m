Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180ECC83F18
	for <soc@archiver.kernel.org>; Tue, 29 Aug 2023 20:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D951CC433CD; Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C36C6C433C8;
	Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693340423;
	bh=tzJ2XdxPJs8El0jWcmvBr4Rp5N5699vCbZSLXhjQRwU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PqML/A7rVgkTATLh6H8dE2hsm9gtNwsk5O3PG+Uvxds52bpTtpEUkQc3y7nHVQ2Na
	 kU/2lXeRldctB/e/uOGIxhbu9fosrxoPmKJV6gG3yLXyYO0fy6A8zYKEhEZ4qNm5Pz
	 XRt3ueLjpLCkH4rPDty6d0weX0QCjLfcu4/Z42fTX2H/nmxY8qiZ7tsMV2gTC3GC7L
	 OM2lF0AuXe232OsHL1qeBADISIkyPbZeZwOrmOQO7cXmTBmfpVbKR+FHYLg5x32aRZ
	 vtAlVGRdsNvkLfLN91ET1xSZ5vTR+QuxuNQHv0UMlQ8AcT/zmgIr6YZ3exzlmSZjIe
	 z0KzPUb2FnPeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A03F9E26D49;
	Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] ARM: dts: use capital "OR" for multiple licenses in SPDX
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169334042365.18037.11722839932477703284.git-patchwork-notify@kernel.org>
Date: Tue, 29 Aug 2023 20:20:23 +0000
References: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Aug 2023 10:51:45 +0200 you wrote:
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - [1/2] ARM: dts: use capital "OR" for multiple licenses in SPDX
    https://git.kernel.org/soc/soc/c/79f74d4c83fb
  - [2/2] arm64: dts: use capital "OR" for multiple licenses in SPDX
    https://git.kernel.org/soc/soc/c/05c618f39089

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


