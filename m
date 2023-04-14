Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BAEC77B7C
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A728C433A8; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 791BEC4339B;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=N7oWUmngeUwNX1iELfxDtIKdgDrPsjtyDJQS5fMPaYU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MAYY2pcf5/A+RKZE2lYntPn5Ft79RPVp4Kyp7AqbBt6LF8txv2yqcD1l6W2i7zOgO
	 N8WHqOmD8f85punBAHdbe5TWbajyf17PXol94sorrtWepNSVzFI1JEc3utKHG/9hPu
	 8PAlWmTMtAxBQryAj+ltiaTTPwKpm7hMkmDDSc9GRzimfEYeBvsFYsEidFu/Rsg1hr
	 SWW8LOeA0hdpda5bHdWVMzxRTDwR17QOwJoR8oiSp1R09mL/3UIIUQJMb8fzNt6YLY
	 Nb3QNMoJf8KadBPb++ciJvKEw9h14fq0+tu1oljAhONc+6O0IphXiMppKwV9WLc2NZ
	 Mp2OHYl8U5dVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5ED8DE4D003;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.4 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783038.23940.13433356986585169215.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <cover.1681113111.git.geert+renesas@glider.be>
In-Reply-To: <cover.1681113111.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Apr 2023 09:55:25 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.4.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM SoC updates for v6.4
    https://git.kernel.org/soc/soc/c/bda649b9a8bf
  - [GIT,PULL,2/3] Renesas driver updates for v6.4 (take two)
    https://git.kernel.org/soc/soc/c/9f8f0d07249b
  - [GIT,PULL,3/3] Renesas DTS updates for v6.4 (take two)
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


