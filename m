Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39D2C3527B
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EBE3C34110; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68EE5C3410D;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=j2shnpKKf15FHVcEvPoXXyKlVkoSqSnO7ZcRlzoAYsQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OD4Bs7bcLSYI7GyFH4kRy3BSSxplc3AfAwODESdsP6F7HWncxE/b6v9niCzZGqK34
	 fsDkywPx5+pFdisnm9iKJnvE7QTp6uIrpT9N0T9BHQqWrog6hCPaAKkUc/46r3uzfa
	 rwG95Ggl0qilMRK7DR7sFRo8sb2d1EHdC/MwhyxhmDiSWGrYmtKY7UDBcL8tj0hS8r
	 /zqjfV2S7ybJUMBsq5NneL95Df5+0L/lF1ubIrCn2mMxPqgIWaejalUZUhb96dz7hv
	 qem7AVZwvDVXqsE7pIXFXPPInppJXkXrMnXWPz1UEcwySaQ4bXZTplE5YCnQvMHzC5
	 yhORNncNbGGfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 530DBEAC09F;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas ARM DT updates for v5.18 (take three)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966333.15608.13528710170406186680.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <cover.1645795643.git.geert+renesas@glider.be>
In-Reply-To: <cover.1645795643.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 14:29:37 +0100 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 6a3b10e5c312cae4c1fc7a27bf9a030360999351:
> 
>   ARM: dts: renesas: Align GPIO hog names with dtschema (2022-02-24 13:51:48 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas ARM DT updates for v5.18 (take three)
    https://git.kernel.org/soc/soc/c/eda2a6830f05

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


