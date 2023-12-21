Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEC3C46CD8
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A394C433CC; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04466C433CA;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=bDgC3zkHMgXb93ueQGfaWBj0Tu8/YbSjpa1xztH1UKg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UBlQzfCWgarXi1mVg/KKBxMd1qFNRSGAzrtuv1QNQNKhufJKSOUMboyWCUZtu9Huf
	 /NDppYxTunYaFyzv14b05Z1EGmCzbvntBo6lMlX8l067hKrpNKEuTwxmrpiUt44b/Y
	 haUMnt4g5g4wo+gH3fAvX0tCUFhNc/x8Wiy8ULrTQVfURyEJeozOrwsiyz1pToWGNy
	 +FxWc1UrMqsYddN/kamQcZQrVFX1yh6gmshxk4DAk1vA7W/t1JBx2VTIniPm/PGrb2
	 RqLcNEhWW9DoV7Eu1hiKir8lmHYgaA3hNAAtFktg1ZJvE6UOVXzIu8Ln1H095UKMc0
	 sCgfg7ln0G7Dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E40E8DD4EE5;
	Thu, 21 Dec 2023 17:41:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] drivers/firmware updates for v6.8 for TI K3 platforms
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046593.3302.17007308104744431634.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:05 +0000
References: <20231218153043.r5psxbjjpccusjg4@september>
In-Reply-To: <20231218153043.r5psxbjjpccusjg4@september>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Dec 2023 09:30:43 -0600 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver-soc-for-v6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] drivers/firmware updates for v6.8 for TI K3 platforms
    (no matching commit)
  - [GIT,PULL,2/3] arm64: defconfig: Updates for v6.8 for TI K3 platforms
    (no matching commit)
  - [GIT,PULL,3/3] arm64: dts: ti: Updates for v6.8 for TI K3 platforms
    https://git.kernel.org/soc/soc/c/7af9a9f5e9d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


