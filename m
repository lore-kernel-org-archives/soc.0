Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A428C7619A
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32734C433AC; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BE8CC433A0;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679068354;
	bh=9OYh3U+XSkfD23wVp4gs33jhfxRonjPxsp/jZ3SH+To=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=G1tOX42sdrznsegHEJRxHdcghG5Y0FkyRmAfqUjI4opVcnmoJDzO5Q3WOm4KdJcZS
	 DuABA1EAyT2IUmz0G/5I1J3uYsr8lALSiRiX4cPPyeFJUdJW66DXmRcccajb0yckoi
	 /zhD4dcvFUGPGscQ4mQWVZI/LRqnzcUYcBq6AJD00vAm0zeYSkUNXFzu0P8vBH+YpG
	 GCHekx2Mtm07e/HMkkb6zuTK2CvdPqZJRkfYuteoFhSY/SRtOdp0nusgZ/fLsptglZ
	 wjK1bv3Ywed//qMSDJe23CmzYDLk895MDJDPie23NY1PT/3qDU/Jg4+1itIA+985Xv
	 RbUYz23kNoTug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0F12E21EE9;
	Fri, 17 Mar 2023 15:52:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ixp4xx: use "okay" for status
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167906835398.32307.13615022764080739239.git-patchwork-notify@kernel.org>
Date: Fri, 17 Mar 2023 15:52:33 +0000
References: <20230310231420.583121-1-linus.walleij@linaro.org>
In-Reply-To: <20230310231420.583121-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 11 Mar 2023 00:14:20 +0100 you wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> "okay" over "ok" is preferred for status property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/r/20230127101832.93789-1-krzysztof.kozlowski@linaro.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: ixp4xx: use "okay" for status
    https://git.kernel.org/soc/soc/c/129469c4881d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


