Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D2DC49EC8
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E76A361411; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CD86661407;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=wrpIPVPVfp0bf4fQbVpmqiROthfSwBnqc/AQvPh3Qz8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EwyDEi7MPrG4o2fSqbF2gPx9yKwO0QgPl6HeEvmXRpzxfXYfzZ1B21pUnum370q14
	 IfYBu/JNfHAO1nmZ4U7q8KiIUzh4g4Pz48eogIDEi9SGge4czfoKbJ3pUOtnJJOws2
	 t4DdXOEDjiRdAZMShF8gKOmDtAB/gB0cBfPBLZNVC43KFqcGO9dEgRKccAhCDudV+b
	 tZaPvHy5kVHjSOLkNoY9ksVpqdHqcuWOu8PqcFyNRbhN7xMFKcDfP3hU7Gq4Umvm6i
	 NqAtIpsMOb3xQKnrtdoxUOGC02NBcXt1dC0nnGM+iLZoEyiBSoFAR7EOoxoIP6/Sc1
	 sA3U+Lw94lLAA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C4E3E60972;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: amlogic: driver updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421680.27448.11564782064088302952.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <58283600-2d9a-c259-4d80-6915e6e6c79e@baylibre.com>
In-Reply-To: <58283600-2d9a-c259-4d80-6915e6e6c79e@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 2 Jun 2021 10:41:46 +0200 you wrote:
> Hi,
> 
> Here's a single cosmetic drivers change for v5.14.
> 
> Neil
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: amlogic: driver updates for v5.14
    https://git.kernel.org/soc/soc/c/bcac3fb57a44

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


