Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA9CEB64DC
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5031AC433A9; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30E03C433C9;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=JLpIR+nPtud7z+bx4ejqtOa3zeEh1gMTaibWFXyzc84=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ps1y1maz7R761Uhq9JIlSPzKLlRU/y9zNvGf9SsFOTcY1OhZSBMqOm0uwDm6gRRLR
	 qjyrEuNxWFjoaDlM6ti+QfZsnOPcOFPGZkv0wBDqYc3NccdOgu3n33UH5isJJbEpKE
	 Sxc/CdONKLg/KCKUi9yUqsrR8jL/8xtgB0hb02G+BJa/LKtau0kS4d+MK6mgsh1e8F
	 ju2xZQehTdENvhEBiAvULsScfworrPtlu7gc+VHnxFH6G4MfSdrkx00WbZiiTTCfOV
	 AlUGl20djBVKcLsMu1+HwwqEt8eY4jREEbwzAE3zHAjiinQZZER+oLlaUtcVa0WUwd
	 5hvZ88yx/mTmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 08D85C691EF;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745023002.12309.1432980204429131078.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 16:10:30 +0000
References: <20230619134920.3384844-1-florian.fainelli@broadcom.com>
In-Reply-To: <20230619134920.3384844-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Jun 2023 06:49:18 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.5/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Broadcom devicetree changes for 6.5
    (no matching commit)
  - [GIT,PULL,2/3] Broadcom devicetree-arm64 changes for 6.5
    (no matching commit)
  - [GIT,PULL,3/3] Broadcom maintainers changes for 6.5
    https://git.kernel.org/soc/soc/c/00896810337e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


