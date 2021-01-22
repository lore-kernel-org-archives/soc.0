Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B695C43333
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 567E123B40; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3547F23B2A;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356413;
	bh=p9hPMRn9LKCmU+4fYMkcbz5tuk3dBOqSi4Uhnx1d6iA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NGp1IyP94pxi/aDlRaG3XWVnHOagoapCNfWOB+XS7McDfMKYrf/2+qg89ptrmZwbp
	 G4KzjwThKXTnjxDgsYYhuffIKcAVO2QOPkdUsLf0tivX6lOQUDpat/abLFwgKg6gHt
	 w8PbOTpVraGzRbJO3QKTkZ6tW9uo6dVsFQ7JQuTQaKRR7LVgTTWnCHiZ7tUki6wG2L
	 P4JrCjosShO+DYyJ4iaAsAOoa9tC4mD4x+pwLHIbZyQrM/EI2S5n9ZhwCbguTl+jPQ
	 9LoHjE5o29hKlZEUHws4xZfOqfRSdTzsAAa3r0Z2vveSOp9sM+bw146I5UpqRjYkQR
	 9rEB6cLRQA74w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 30CA0652D1;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641319.29035.6447259511390614088.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:13 +0000
References: <20210122144638.170565-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210122144638.170565-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 22 Jan 2021 15:46:38 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the defconfig changes for 5.12 which contains the removal of old
> wrapper code that we called tclib. No such config option to be used anymore in
> next kernel.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: defconfig for 5.12
    https://git.kernel.org/soc/soc/c/2cb2b2c9d9f0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


