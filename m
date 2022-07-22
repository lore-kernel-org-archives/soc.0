Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0563CCA473
	for <soc@archiver.kernel.org>; Fri, 22 Jul 2022 20:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA335C341C7; Fri, 22 Jul 2022 20:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88CEEC341CA;
	Fri, 22 Jul 2022 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658523055;
	bh=TKIvEfXpVZyG/2gaDDlCBoOQxALP92XcvNaXtdq8OkY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rmR2qxBVmCsMtS/RahlffaQ73qrYlQVRbwFzczi0hz+QPeG2F3GSX1Pz088yhpTlb
	 Z8R8neVI9h4kFJe7zPqGIY7zv82A+C40dZs/rnOgJckx988w8d92vr6fsdCNTSRnxy
	 QzunuiS6cKYxwYnLYdeM9x8lpu1QEj2akQh04+Ys1pYDQKbuODkz4zlJ5h71cAxgSn
	 rgeHin2VSiIkyY8JUuryDxX+pRdM9uonV4Rp3an8Tohd9ym0/sTkTco2EbD9wJbtAa
	 lOSM8cw0Pqcc0+huS3+R20aBnbOGDRMIoxlDNBQrkJ7QHKyyjmRhhIyRniAzkQxI63
	 LTE2NonIHzOZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6647BE451BB;
	Fri, 22 Jul 2022 20:50:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: pxa2xx: Fix GPIO descriptor tables
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165852305541.6683.14622673836950139630.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jul 2022 20:50:55 +0000
References: <20220722114611.1517414-1-linus.walleij@linaro.org>
In-Reply-To: <20220722114611.1517414-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 22 Jul 2022 13:46:11 +0200 you wrote:
> Laurence reports:
> 
> "Kernel >5.18 on Zaurus has a bug where the power management code can't
> talk to devices, emitting the following errors:
> 
> sharpsl-pm sharpsl-pm: Error: AC check failed: voltage -22.
> sharpsl-pm sharpsl-pm: Charging Error!
> sharpsl-pm sharpsl-pm: Warning: Cannot read main battery!
> 
> [...]

Here is the summary with links:
  - ARM: pxa2xx: Fix GPIO descriptor tables
    https://git.kernel.org/soc/soc/c/c5cdb9286913

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


