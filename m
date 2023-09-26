Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A028E7F138
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E3EDC433BA; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78CFDC4936D;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=AYYCJjU9+LDzhMNXh1DxzNi0Oh7Qflxaib71NlmonY0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KojeuW9QGCG7qIBbq7qK7/bjokUxGTP2GCOrm6nnxd0eCcv4aHCWX/nwgFzv4yOwD
	 JhlaWdtfcW5KEQaMqLQNfW0CQukI5c3i8kGWujzT425dX33IgV/HR/l9lSG0+vp3Hq
	 Mt1oVSJj2TQGIRit9Flb+traslQnV2CoR+tPwwNuJkA2wqv8ih75qy0wYLnbIDudWO
	 0l3TL+mS3wDgZbGyWhLU3DOaPPEPvyNbge350pS4f4JL2Z+5YPNDV2qeiuVeyWcMR+
	 ldj+/k3IWG+F2dxZM+c4McS2KYiDQ5eoTfWj2ZkBdBxb4FiNdTiY+NtkuDzl5EXg4a
	 zp/Q90AhGhFrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68DAEC73FE2;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=y
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223342.24546.9350536317117997510.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:53 +0000
References: <20230921145723.2167927-1-mikko.rapeli@linaro.org>
In-Reply-To: <20230921145723.2167927-1-mikko.rapeli@linaro.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Sep 2023 17:57:22 +0300 you wrote:
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> There is no code for this config option and enabling it in defconfig
> causes warnings from tools which are detecting unused and obsolete
> kernel config flags since the flag will be completely missing from
> effective build config after "make olddefconfig".
> 
> [...]

Here is the summary with links:
  - [v2] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=y
    https://git.kernel.org/soc/soc/c/82bc4a73e712

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


