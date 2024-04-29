Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F6AC25B5C
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A8EAC4AF1D; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04842C4AF1B;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=8twC1K/xHTR4Em+3cCOjsiPvHMDbT1XbXn+sWSA3dco=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ctVSkgluJrkUE08ktw6mkiCChZ9YvoPqicDL826Vzk3mVtHustMfI8MxwrVCI4pNc
	 +3ISFAk5GYcwMLABJ/ww0kBWzjevqHL5vi7zah2G9cBoM6Ga3nwaXmLr8rFDLq9/XL
	 wR8pW+Q2tYC7snHt1r13tCKkouvEEEVNWujkeHNYeHP5a6e4r9eb8qcOKmTw0kYgPI
	 Gjn3nFldXszq7tIXRVNSH1MKwb0tzaDOLABH9I/sw7VYcaFIgpqEskSf0xT4hw8gFp
	 5Tm1UE55ZAWJgAANL5fuhl4UfB62vC6uMgm4h9X0pG9X8hulJ3knYFU0u2MNnXui/x
	 zpeC20yQetTkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E813CC54BAE;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888794.20509.6654528778520265999.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:27 +0000
References: <cover.1712915528.git.geert+renesas@glider.be>
In-Reply-To: <cover.1712915528.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Apr 2024 12:01:36 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.10.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.10
    (no matching commit)
  - [GIT,PULL,2/4] Renesas driver updates for v6.10
    (no matching commit)
  - [GIT,PULL,3/4] Renesas DT binding updates for v6.10
    https://git.kernel.org/soc/soc/c/43719640b89c
  - [GIT,PULL,4/4] Renesas DTS updates for v6.10
    https://git.kernel.org/soc/soc/c/f45083c3435e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


