Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA795C04FE2
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B24C8C433AD; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BF2EC43397;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=3cbYVrlGiARYZ2Zj85dRhDY8dZPUOqbw7L0F/2CZIug=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Xi8QpV3slEte06YZYqSVZegARjFgvii/dyx0k5TNFelsFmn8QEMBByl0UlKxP8oNL
	 smieN8/XmyfPFdBGTw+hau0F3m6YZr3JAEXv218CDWRW13TG9WDtQASEC0fyboZP16
	 SLZM6OttseF/Z7VSyeZRNaWT2sVdusZwIQ9CoLV/eS/0SFOJcdmMMlAzEHMamn+Cz9
	 GWYFWsjNgp/6qkD8W2oBCmKQaH83MVMQZhTnl20/9y2nYamayoCuPo+T1XLjqQgKcZ
	 bsVbLtiZFHXGrvPsh6W8crk/KiA5412JvYr9quDi93JsUPSIRRsIL3OGrOG72fbq3d
	 4jNk28hW2iy7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8AA1EC3274B;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] ARM: multi_v7_defconfig: Enable TLV320AIC3x
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562756.32343.5324812065118860996.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <20230731-arm-tlv320aic31xx-config-v1-1-013c8c321dad@kernel.org>
In-Reply-To: <20230731-arm-tlv320aic31xx-config-v1-1-013c8c321dad@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 31 Jul 2023 12:53:27 +0100 you wrote:
> A number of TI based platforms use TLV320AIC3x since it was their
> standard audio CODEC for quite some time, including the Beagle X15.
> Enable it multi_v7_defconfig to improve test coverage.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> [...]

Here is the summary with links:
  - [RESEND] ARM: multi_v7_defconfig: Enable TLV320AIC3x
    https://git.kernel.org/soc/soc/c/a1fdf44bfd88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


