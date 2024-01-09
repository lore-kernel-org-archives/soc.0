Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA72C47073
	for <soc@archiver.kernel.org>; Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDA79C433F1; Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7875C433C7;
	Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704786025;
	bh=uBE3tVVSRW+hVJznIKTMI67PQ8FKwrAtkzoCmMkFiTU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ekl+xXNqd6UPWlCzpNAxxmKs+gp9+Kj9xcPOc67JenKSVC3XLseGPeAQ9ebqBkXjA
	 O1O+3GTbFTEmo0noMTUGPPKjdcsF4Xcxw69PU6t36FlmirixC2xBBl4KOU9HKYqbpW
	 nzX6HhQEWEDOYIuKAXhOgd07N+NGN3QFXeZBDiWeIRChl2/MG92X9hVks31uuQJJAl
	 5jUx0ChrIhhfFh46EE3tIScE4tYwxfloAej2pgndrQfyZ0PgRLmNeQdVvuUqIujxTZ
	 Z8P++ZzgSW2u0q+qiruB1NrA2TnxZSdIUTlINPIWnLkH7H8wPB94I82g7RTYc111Ew
	 aQfOeT2+89qdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5C16DFC690;
	Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable STM32 IPCC mailbox driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170478602567.21956.16539836081793680581.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jan 2024 07:40:25 +0000
References: <20240107-arm-defconfig-stm32-ipcc-v1-1-924721db5661@kernel.org>
In-Reply-To: <20240107-arm-defconfig-stm32-ipcc-v1-1-924721db5661@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 07 Jan 2024 22:40:29 +0000 you wrote:
> The STM32 systems have a mailbox used for communication with non-Linux
> processors like the M4 on the STM32MP157A.  Enable the driver for the
> mailbox so it is available for testing.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: Enable STM32 IPCC mailbox driver
    https://git.kernel.org/soc/soc/c/dd1d4bd6e5cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


