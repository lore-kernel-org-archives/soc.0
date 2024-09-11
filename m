Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2C1EE021F
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA706C4CECE; Wed, 11 Sep 2024 09:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A3BC4CEC6;
	Wed, 11 Sep 2024 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726045229;
	bh=UEG12TarpOSQKwbg/QGw4c3xh83d8TZmgyRH8j7pAjk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FVox1tQxLExaV9sl4vncqJW8gXqjR4nChJ0NpyjZnN1gEfSpHeqXynQ++Xx6K0LAV
	 SkRa7sT2u/ztWcuQh/zD3BIyCwwbOEXKQjSRywA5bf0uaqOnXlY6T+XD4inZ4pdBwl
	 k0VisXMow6dzZc49NtSR2QXbPaB6Pej+yupZkj//j1kumDjisJwDtrK64ndcmzSCvq
	 3BKoeDittMFy7H0v7o1uxsePIDzhFbfagqSsyYLAo/VBp1/ANS4a8qZxnjdsJKsMyD
	 rUJnHTkoc+pNfihcpRt9IGAop96nr6+6lvfRXwzEeySRklhFWC9mQiJ13xiJl56dco
	 6zwpK6R4h21qQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ED6ED3822FA4;
	Wed, 11 Sep 2024 09:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: fix HW_RANDOM dependency
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604523076.547769.5260333395127785386.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 09:00:30 +0000
References: <20240909110417.247453-1-arnd@kernel.org>
In-Reply-To: <20240909110417.247453-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  9 Sep 2024 11:04:09 +0000 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is still a build failure when the rwrng support is in a loadable
> module but the mcu driver is built-in:
> 
> arm-linux-gnueabi-ld: drivers/platform/cznic/turris-omnia-mcu-trng.o: in function `omnia_mcu_register_trng':
> turris-omnia-mcu-trng.c:(.text.omnia_mcu_register_trng+0x11c): undefined reference to `devm_hwrng_register'
> 
> [...]

Here is the summary with links:
  - platform: cznic: turris-omnia-mcu: fix HW_RANDOM dependency
    https://git.kernel.org/soc/soc/c/b97acde6f984

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


