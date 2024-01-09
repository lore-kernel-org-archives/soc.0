Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148E8C47079
	for <soc@archiver.kernel.org>; Tue,  9 Jan 2024 07:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6770C433C7; Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0FE1C43390;
	Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704786025;
	bh=p1pmPb2qLsUFYiZLutfVQ1sO2zjl3EjG3frmomsUOGs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RaloxHk+O6y5zV1Kd5yAGFjLEyPjZBSEy3LT+S7Mwbg59bBzuq+wXyfesEkNa/hDY
	 dvvEkeNdIOlQLCZEmA656pg76kSNFtcPfQX4a+ED2pY2uuG13DDt970Ae6NN+imayR
	 QNu1p53o8qQbrYFGkfCHJ0njMAi92qo4KqlbSbKiMW5sQkNe4Pe+hBrWhF4lDJgy9c
	 x1lwYVTEh9pFnWwMV4q+mW+Ur+OC3QMJK7iiTy8NpNGdGJdGfbveuOrsiEs9g+Lybw
	 2WjjsAK5PWvn7vk7XTbsTIq20sjF+6lUxjc3Zc4vgeQkHPhJWrXFWyGXYaqmdQATRa
	 wG4CYa9UDeTgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B0589DFC68F;
	Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] soc: pxa: ssp: fix casts
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170478602571.21956.1997835488491675389.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jan 2024 07:40:25 +0000
References: <20240106-pxa-ssp-v2-1-69ac9f028bba@skole.hr>
In-Reply-To: <20240106-pxa-ssp-v2-1-69ac9f028bba@skole.hr>
To: =?utf-8?q?Duje_Mihanovi=C4=87_=3Cduje=2Emihanovic=40skole=2Ehr=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 06 Jan 2024 15:11:33 +0100 you wrote:
> On ARM64 platforms, id->data is a 64-bit value and casting it to a
> 32-bit integer causes build errors. Cast it to uintptr_t instead.
> 
> The id->driver_data cast is unnecessary, so drop it.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> 
> [...]

Here is the summary with links:
  - [v2] soc: pxa: ssp: fix casts
    https://git.kernel.org/soc/soc/c/6db359b5eef5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


