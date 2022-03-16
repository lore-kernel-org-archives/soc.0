Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E014DC433EF
	for <soc@archiver.kernel.org>; Wed, 16 Mar 2022 20:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C530CC340E9; Wed, 16 Mar 2022 20:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1A98C340EE;
	Wed, 16 Mar 2022 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647462010;
	bh=9iF7/RlxqMhBO6JCs+UJrMhCzQmiF19VmopngKfnij8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=X6IogVcm+TTVI6cKJF5l5m165hJ5sJxD+NNSayBbAPG38nRS6kAlveAF2RhNs08OX
	 ZEDeoqwqz0FUBqgleRFwz1n39w5JVT+MsG3iNfCYYYk88kIa8/xZHOcTubKi9iISCm
	 75qbc5oP+D2kPVhl9WHZ66t2CYJqCG6Tp8Bw4PdgmH35I2mK6VMp2xXOM364EclpBp
	 IBGduA6NuVWtHqbyO/eAZ5ywHZq0+7A24vYglsGgZfjCTl98rDgGipVSsY8u3pqS7V
	 sFqob6Z/XWt10HfjgDxAbPVSLsRESH8VoILhnNgmW2YecOjFSSoVqgUm80+Dba0vwc
	 /DGJKbAyQcagQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8244EF0383F;
	Wed, 16 Mar 2022 20:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL][PATCH 0/2] Late patches for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164746201053.15675.624457063285919335.git-patchwork-notify@kernel.org>
Date: Wed, 16 Mar 2022 20:20:10 +0000
References: <20220316154309.436028-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220316154309.436028-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Mar 2022 16:43:07 +0100 you wrote:
> Hi Arnd and Olof,
> 
> I have two last remaining patches for next cycle:
> 1. arm64 dts patch for Tesla: to soc/tesla/dt branch
> 2. defconfig patch
> 
> Both were already in linux-next for around month.
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: fsd: Add the MCT support
    https://git.kernel.org/soc/soc/c/bfb60ede2c3e
  - [2/2] ARM: defconfig: add SMB347 charger driver for p4note
    https://git.kernel.org/soc/soc/c/160d0603a144

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


