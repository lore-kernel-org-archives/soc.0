Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EBBC83F1A
	for <soc@archiver.kernel.org>; Tue, 29 Aug 2023 20:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE317C433CB; Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D75EDC433C7;
	Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693340423;
	bh=IzSISvdjoeftFN+OtxGl9xhy3cX9kkBKh9NHNeiPj3k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Yh2Ebb+DRD4cP/NJZ9H9/rmZYKS/dZqCP+9dR1YleVBZyPMw3cGvd/cGxcBvGahT9
	 91ToieVWp3mDz22Kzhk+8wk1WEBUg9yNsvGaIdzuBFg/0VAK20qnOKRj4Ca7i66+Kl
	 2bgISAd7ZGolXvVfkxnaBONi8XHEL2nlfwo4Vmw6s/fvk5Lz3qN/66tvMmDG98ytZv
	 7hFwUQE+HnHwJ5VriWBEDh5NZUsqYy8AWY/O65wDxuf9BSTcTnuBgi7f6gKgy82qyi
	 0zzDINVWNa7LgjfFT1ALHXO09ZMq7j4fNPL0c+rFTrS4RIW1JMTs7AcJo08X+24tLB
	 PVyvXVq1lRauQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B9CD0E29F3F;
	Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] bus: fsl-mc: Use common ranges functions
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169334042375.18037.5613740241591669488.git-patchwork-notify@kernel.org>
Date: Tue, 29 Aug 2023 20:20:23 +0000
References: <20230823190958.2717267-1-robh@kernel.org>
In-Reply-To: <20230823190958.2717267-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Aug 2023 14:09:42 -0500 you wrote:
> Since commit 3d5089c4263d ("of/address: Add support for 3 address cell
> bus"), the DT address functions can handle translating buses with 3
> address cells. Replace the custom code with the for_each_of_range()
> iterator.
> 
> The original code had fallbacks to get "#address-cells"/"#size-cells"
> from the bus parent node if they are missing. This is non-standard
> behavior, and AFAICT the upstream .dts files never relied on that.
> 
> [...]

Here is the summary with links:
  - [v2] bus: fsl-mc: Use common ranges functions
    https://git.kernel.org/soc/soc/c/09959520d2b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


