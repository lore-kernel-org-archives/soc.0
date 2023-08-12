Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623AAC001DB
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 476D3C433A9; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 321F1C433D9;
	Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691844622;
	bh=HzvlOVYjikq4OoQo+5hCrfM56UH7gF4BMYtpqgG0D8w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pW0jyOcvpy6hNx+CetsT21FRaIokSes0c0EHKo2gHO5hn1W7zFCoLlp/vsKV3/pjZ
	 NAIFSmsk9PJU7szDcLIRTTbjGYKn4tJoigE+IDDxdJbPa87VC6/YXKlWPlB+yuAxC6
	 6Q5vsg3QNN8CRoo/iRgbCsmgQd/IJpK5p2Uh+PGtQYBw/nrJnP7FaHV3qfsIaCDi7s
	 iwcBjGeydQ0J6z3u+MDgM6rkS74CrGbLPg+qrdRfezhJfrooMZdivZd1oNjUxvqDbi
	 v1zxR5+gADdCI1XX7fMj5ttadO0uYZfynKsZl9FBRP4smkKTmgX6Px/dVoHyNc5Zfh
	 1o0L1E+eejq+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 14B0DE3308E;
	Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/3] MAINTAINERS: soc: reference maintainer profile
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169184462207.4542.10181992496084173864.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 12:50:22 +0000
References: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 23 Jul 2023 15:19:22 +0200 you wrote:
> Mention the SoC maintainer profile in P: entry.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> ---
> 
> [...]

Here is the summary with links:
  - [v3,1/3] MAINTAINERS: soc: reference maintainer profile
    https://git.kernel.org/soc/soc/c/a34d8a4b803f
  - [v3,2/3] Documentation/process: maintainer-soc: add clean platforms profile
    https://git.kernel.org/soc/soc/c/f1b518b45d39
  - [v3,3/3] MAINTAINER: samsung: document dtbs_check requirement for Samsung
    https://git.kernel.org/soc/soc/c/c25223cba5aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


