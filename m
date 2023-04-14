Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9E0C77B78
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3A52C43442; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A89B5C433A4;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=BAkctadAcE9kSZnqiAaYaer9mAWXQilkhWgYVgdUM08=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ewrPhjmRDeMiISm6PT9t6ZhTrwcO0M90BNc/HKWHLcAtvTNiM5OuiemvJZU2pr34T
	 kZut4hWINCh3bzDDhyZUnQHUndzNDycyzUzVSJUaelZW54ZTvTx2m+8fEbjbooLvoT
	 eYB0/9LFXhBZXGHarlqlLMnC/I0r6dVa/QEpNGS8dZ5WQbJGdRPlGBfVdJStLzmnC9
	 6FSnieCNyZAwVww6YLOMqPOLiiIsMI4XNMsbc4lfs3mY162vBElX2kHGLtOOfkEO5F
	 tp7SDX25jo5OwxDvHgxH2M+HYzlrR0R47M7yBBMF5Nz+vuXCjvlbP7q5OWbJe056XS
	 9U6GSxyOlr18w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8D7F7E4F0B5;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom devicetree changes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783056.23940.12465243925313520851.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230410232606.1917803-1-f.fainelli@gmail.com>
In-Reply-To: <20230410232606.1917803-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Apr 2023 16:26:03 -0700 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.4/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom devicetree changes for 6.4
    (no matching commit)
  - [GIT,PULL,2/4] Broadcom devicetree-arm64 changes for 6.4
    (no matching commit)
  - [GIT,PULL,3/4] Broadcom drivers changes for 6.4
    https://git.kernel.org/soc/soc/c/3ac02aa53d60
  - [GIT,PULL,4/4] Broadcom soc changes for 6.4
    https://git.kernel.org/soc/soc/c/3e54e7c8c42a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


