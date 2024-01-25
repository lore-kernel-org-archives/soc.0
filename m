Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CACEC47422
	for <soc@archiver.kernel.org>; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BBDCC433B1; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35DEFC43390;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706205098;
	bh=mRVYlz/RY5W5L64x3TPvM9gHyuO7/tBlpzFI2T3R/nU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tTfMudF+VY1G2RCM2GSK5S4ac/j1V6nklnUFLbQ5tdeCaiUqPEee+GIGO9gDuBjtT
	 YVBcNenVKu1FGCo/+vgVnPnLxmcpGDuHmxQ9u3kj4fbj1eXTEG8JZBDWsZP1cCpgUP
	 I/HioTe86n12GBv0Ek+oy7wRkV073XT1+p4yRyofepApYIPDbxKgnPORimiQuFYYos
	 aYf/dQHXFUCGhyZYS09Tqv2j/d9N0CFVJ7NYff/gB0yAkG07UVZXFqbSjuk0KJB3y5
	 T1PTb5yJZ8D6268C3Ah4uuraAQO20NONV2O9N5qZsOW/txC8SKVb9XJH4JV+4z4xG6
	 1X4jOUdeeQwVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1B2A1DFF765;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: Fix TPM schema violations
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170620509810.10279.6468838386548651555.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 17:51:38 +0000
References: <e6d7768e2a257e0bd5948bcf168909b6c670851b.1705168605.git.lukas@wunner.de>
In-Reply-To: <e6d7768e2a257e0bd5948bcf168909b6c670851b.1705168605.git.lukas@wunner.de>
To: Lukas Wunner <lukas@wunner.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 13 Jan 2024 19:06:56 +0100 you wrote:
> Since commit 26c9d152ebf3 ("dt-bindings: tpm: Consolidate TCG TIS
> bindings"), several issues are reported by "make dtbs_check" for arm64
> devicetrees:
> 
> The compatible property needs to contain the chip's name in addition to
> the generic "tcg,tpm_tis-spi" and the nodename needs to be "tpm@0"
> rather than "cr50@0":
> 
> [...]

Here is the summary with links:
  - arm64: dts: Fix TPM schema violations
    https://git.kernel.org/soc/soc/c/5e2400f11d4d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


