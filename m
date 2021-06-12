Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20172C49360
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9DF53613BC; Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 82AB561376;
	Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514207;
	bh=NS/g7cgYloOB0XX+CsgaFjF2sWqueGo7Uy2ggAq3XCg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WEjJy3EQON7xaeJ13M2fSl5a1yS7KAaIH5ROHkrfDrs1zquvoOzw/1IM1bMNtdDaW
	 Ro84CvX8kia7GjWAdrllkM2kNr6YJEHKKmVKR09ibWKtJevhu94MtLTW6pDDs0HA+u
	 p0Dj/l6BdTXjKvdEbmNwMy9pEz/5TEMRE4fevwvQzEKnOv44FZ9qcnuBuzVC32R3/g
	 EO0cxL1av/H/gp3BUhBSOmW0QZcavs2Pq7QE0jlOgUl5f+LLh1TJVebg00gfXMCbnR
	 RniCynjIWu09LtG3zMwqjy8sHi2tgdH1ajK7Fd7VDJynxrZEtsY+GFj+PUDytCiOIf
	 LxNPllLkEYirw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 70B9560CE4;
	Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Fixes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351420745.27448.1729910084686078871.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:07 +0000
References: <ad7ba352-315c-4201-b922-4bf914a00d98.lettre@localhost>
In-Reply-To: <ad7ba352-315c-4201-b922-4bf914a00d98.lettre@localhost>
To: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri, 11 Jun 2021 16:54:29 +0200 you wrote:
> Hi,
> 
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Fixes for 5.13
    https://git.kernel.org/soc/soc/c/37c2a42930e1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


