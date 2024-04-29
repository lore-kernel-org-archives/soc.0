Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D648C25B79
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83864C4AF1C; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D6F9C4DDE3;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=AKBewQShKZHFn10VHnNztRNg1QKgOk6bAWxVtkgwPro=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QfEp2Gk5vJCa36LbmgJUl89gD/B/yZ0PqJ90M8RrPjxQhC7FmJdRXI1F7Rux2q/cd
	 jIGbWJLRk/sg2F9YinJzdAGaizBVT+8TXNbBEu1dx0uPDyX5cDASbVWH9j+MqKnfgc
	 Ne6CDKllrjRnKedwsqPCLRLuMLtJBLSrkCWNPi3rspUTUH0TMhZnli3tyFwlbijWkJ
	 SB/WZpsyHGFcQjPPvuAx330Cj/gabdBho09gfj/BGTCVm4h/X1ftRJfqxnBloU+chT
	 oxRcYbH3d+oIfVUMScIjny6JNA4XhsEGW3og73efu2Oqw2MBRjziLOUwp3YDCg6aDh
	 HHZVTV1h8qfxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 62AC3E2D48A;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888840.20509.7790329984684096971.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <20240417203853.3212103-1-robh@kernel.org>
In-Reply-To: <20240417203853.3212103-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 17 Apr 2024 15:38:47 -0500 you wrote:
> The "arm,armv8-pmuv3" compatible is intended only for s/w models. Primarily,
> it doesn't provide any detail on uarch specific events.
> 
> There's still remaining cases for CPUs without any corresponding PMU
> definition and for big.LITTLE systems which only have a single PMU node
> (there should be one per core type).
> 
> [...]

Here is the summary with links:
  - [v2] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
    https://git.kernel.org/soc/soc/c/8b40a46966d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


