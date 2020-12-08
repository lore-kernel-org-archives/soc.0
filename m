Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DF4C19437
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 17:10:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EE96323B21; Tue,  8 Dec 2020 17:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607447432;
	bh=4JWqQEYD3B6hc9UMtFF7hwPFXZ7D0jrhqB8Su5tADq8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rGXDUxzhFBMuUVUQ3iz4TH1Xbc6IuM+LNBORvOaW1oKjLQGyvbljzuPs9/22K9Q5u
	 Zg66SwxgM2MmIkpy6dp3mWQtTKqaZrTH4P7PxNUoPZ7atujMtnUnABQk7O1QuO8dhk
	 WgQIWpG+6nOIr7RaO/P/tHUfbxuAbUHLPaOLed3UuzB9UjJkwKszoTDyEWdWNh9ZYI
	 C2n+P60T+nfEK4F9qIoueMYOB8xW/MNpQQDBaT6wSr2IS0OqUvRUAq1I/2IkM8EaNk
	 fFIxnBaOVDo4CLxC49ZQZKIb0plo5KJzbkCbzP4R2xsvCnpjap5Kn3vij6bZ7X7b6X
	 cPaer+T1M2hGg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: Drivers for 5.11 (bis)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160744743285.1206.15785712970555180184.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 17:10:32 +0000
References: <20201127214140.GA1688544@piout.net>
In-Reply-To: <20201127214140.GA1688544@piout.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 27 Nov 2020 22:41:40 +0100 you wrote:
> Arnd, Olof,
> 
> As discussed with Arnd, here are two cleanup patches for at91_cf. My end
> goal is to get rid of include/linux/platform_data/atmel.h.
> Also a very small patch adding SoC IDs for the sam9x60 SiPs.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: Drivers for 5.11 (bis)
    https://git.kernel.org/soc/soc/c/c6241fd5de13

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


