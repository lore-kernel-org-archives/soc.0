Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4F1C43217
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1E72C385AD; Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC551C385A8;
	Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650555026;
	bh=Ry/VbqJdKVTKOVq5dhNBAv8xBQI4DOzg6VqLCE0PkRA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=m08tM/JMX9hlbx8ECF5DrB/YZwl6AmZ3ek2IPRUBj+JuAhodx5O/VOve6wg1/cuG7
	 mtvDfGK2hhDul9+4PN8rfYkL2sZmni6sl4oka+MoSRGxlfKhF0uSZuWQKh7rRZSii0
	 nPKAoJRsA28UR8zoPkm18PcfV/38JRWLCiIuS2H7wH2Z6lGl9/9+aR4a3wBl6AJoTa
	 Zhc6mEWPtpSVGXDU22qcOsIWhdCeGBsX44mitzKV0jyLdZ68koJVW05UCxzlmxPx00
	 aJdxDgmb0HQnmGjK9AE4uk/jitzOsnETEOEX9HRSCruLGjr5WBRsDZEyMflR/NMbEs
	 1wNhUL2ns8Z8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7FD4BF03853;
	Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH drivers/memory/fixes] memory: renesas-rpc-if: Fix HF/OSPI data
 transfer in Manual Mode
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165055502652.23603.13164568091641975388.git-patchwork-notify@kernel.org>
Date: Thu, 21 Apr 2022 15:30:26 +0000
References: <20220420070526.9367-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420070526.9367-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Apr 2022 09:05:26 +0200 you wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> HyperFlash devices fail to probe:
> 
>     rpc-if-hyperflash rpc-if-hyperflash: probing of hyperbus device failed
> 
> In HyperFlash or Octal-SPI Flash mode, the Transfer Data Enable bits
> (SPIDE) in the Manual Mode Enable Setting Register (SMENR) are derived
> from half of the transfer size, cfr. the rpcif_bits_set() helper
> function.  However, rpcif_reg_{read,write}() does not take the bus size
> into account, and does not double all Manual Mode Data Register access
> sizes when communicating with a HyperFlash or Octal-SPI Flash device.
> 
> [...]

Here is the summary with links:
  - [drivers/memory/fixes] memory: renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode
    https://git.kernel.org/soc/soc/c/7e842d70fe59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


