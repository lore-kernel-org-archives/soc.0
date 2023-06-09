Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AAAC83005
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D96FEC433AF; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB281C433AA;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316227;
	bh=YOXSWsCVAeThakS2Z8odoOwfuS7uMPNd3fJ3cEIrIQc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VyawtBlYH9DVFG6Xwm7eRt4khGblVlozIfpmKh2cLDE9kd83HhNxctqb5tv1MSLPr
	 UAxth7IrDbLVF/lHpBvd0NjPXiASaT7GwZF1xQ0xXNNXnGtK9X5ASbKi3NWyJz1Qmd
	 aFVtH1by4012QXcTBddlkzkvHMvuQUIanlFKJ8m8BIehWFfPdt+VZ56FtNmr9nLet6
	 hlVEnP1LRB27LqYvB+DE6FaF8goUqtJNEC9ki1Dl/32qZC968H94HxkrCVRV7Jt8Oh
	 TyrIOk2391jhW3RU7IheJnOq4z8WRfheO7hiPt5aTHJR+/R3MQAsrXDletp1TvTDMB
	 n3N54fqX7thIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C21AC43157;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.5 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622763.816.10197750191500315901.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <cover.1686304609.git.geert+renesas@glider.be>
In-Reply-To: <cover.1686304609.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Jun 2023 12:06:35 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.5.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.5 (take two)
    https://git.kernel.org/soc/soc/c/0403565132a5
  - [GIT,PULL,2/3] Renesas driver updates for v6.5 (take two)
    https://git.kernel.org/soc/soc/c/c6a5181263ad
  - [GIT,PULL,3/3] Renesas DTS updates for v6.5 (take two)
    https://git.kernel.org/soc/soc/c/7b87c164e179

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


