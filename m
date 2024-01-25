Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AE4C4828A
	for <soc@archiver.kernel.org>; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 617AFC43601; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C440C433B2;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706205098;
	bh=9N6hHev/buRjZrMZaG4K9mah07hxET4w7FOfHwY7kO8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=G16ZKCWKT97XRUyQZiYy2dhRkJSKf8QEmDc37pYwrRHMKPdWweeY/I+uobixQEC1l
	 6uK11LzA36aobWemE8jWuzrOk73PhgTPA5RjWASI9kwzz34kI2CPeOFj/5JwUYXZ7A
	 L3+OIxrSPEdEybKXZnZM5n62kVZkB1LarOGiEsrifPIuCxc0TCkKaLVOkM97Xz3YJZ
	 bYLEKiD38h++rjk3Rn1PHd1iIkQPAT8L44kCUxniVxwaSaDG4ayJlR7sf+N8JRtWQf
	 47nq9phTh4KFG9AKdG3bpBbLwloZr5wOIC2TAiQe3tIu1gJjbWmOO2tB5wLMwa1XLd
	 NRtVprcsYZtFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23757DC99E0;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: Fix TPM schema violations
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170620509814.10279.10613949480137477820.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 17:51:38 +0000
References: <8b49a64d5946792f01e75fab74076557ef4f7d60.1705135956.git.lukas@wunner.de>
In-Reply-To: <8b49a64d5946792f01e75fab74076557ef4f7d60.1705135956.git.lukas@wunner.de>
To: Lukas Wunner <lukas@wunner.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 13 Jan 2024 10:03:51 +0100 you wrote:
> Since commit 26c9d152ebf3 ("dt-bindings: tpm: Consolidate TCG TIS
> bindings"), several issues are reported by "make dtbs_check" for ARM
> devicetrees:
> 
> The nodename needs to be "tpm@0" rather than "tpmdev@0" and the
> compatible property needs to contain the chip's name in addition to the
> generic "tcg,tpm_tis-spi" or "tcg,tpm-tis-i2c":
> 
> [...]

Here is the summary with links:
  - ARM: dts: Fix TPM schema violations
    https://git.kernel.org/soc/soc/c/8412c47d6843

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


