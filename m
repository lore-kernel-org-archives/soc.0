Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DDDC43461
	for <soc@archiver.kernel.org>; Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4E41B61285; Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 371B36113C;
	Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618845009;
	bh=U+dmQKaVt6gW5o9n9ZccLtMGcY0LnL6gSe6/4P2IXIQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IxXinTbloLjKQN67qOZnnPm8QdIESd3TA+ulCzdhzoTMT49DPH7YBCRyWpQOfsSG+
	 satTdCvsJeZiZcG8bfyO4s8L4LxxiHZ+eP/1ItrmMXg/cj0icirB33Sws4mVg6ol7f
	 fBagkZ++tnrUMfbx2+K9cQvH8xTD7h7pckrd4Dl6+LI3gx0CbXg+DwifQIIIxX3Rav
	 vZ747x6JhaRMpw6SSflyTsL+iUf7XKUCVdbt7Ed5tUVdOTJEhrbtQ0q0hjSfZ1lhfx
	 mj1djNKqofpKqLJBbprQty7bpudWG3TbtaCur17Ixy3LgGA8JcLUxg23dAubmF6G6c
	 6d0Pxt+iLcNvA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 26AEC60A2A;
	Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] dts: mediatek: fixes for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161884500915.21313.9808310838677277503.git-patchwork-notify@kernel.org>
Date: Mon, 19 Apr 2021 15:10:09 +0000
References: <20210416143923.23406-1-matthias.bgg@kernel.org>
In-Reply-To: <20210416143923.23406-1-matthias.bgg@kernel.org>
To: Matthias Brugger <matthias.bgg@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Fri, 16 Apr 2021 16:39:21 +0200 you wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Hi Olof and Arnd,
> 
> Here come two smaller fixes for dtbs_check. I realized that we have tons
> of warnings, so I'll try to get rid of them over time, but it will be a
> longer run :)
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: mt8183-pumpkin: fix dtbs_check warning
    https://git.kernel.org/soc/soc/c/f9929b452ac1
  - [2/2] arm64: dts: mt8183: fix dtbs_check warning
    https://git.kernel.org/soc/soc/c/f538437b315c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


