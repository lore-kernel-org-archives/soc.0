Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071EAC49EA6
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D9EEB613B7; Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C4500613B4;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502410;
	bh=svxY83mBN0puuE6IZct2OcI+ZHvsvIo/aqOY/xBb7og=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZFh0Y27yRcSwAhmX59SFYMrqDrYlI8hUj5Olg1C0pJYCW464kv6hHkNX5yVG5PMfd
	 zmOnGSg2nWXIN9OGGz5qeti0Y2Td/fetHvKScSANrSmMAW9vie0UB26FlmBwJiAO4B
	 p3d7Y0fBGS6KdIFtOPiFnqM37uDr1YG1M1WLHwUW46GL3Oe1/bEbagc/2bHSGqqx2t
	 AWiUPGNfSQ/yZnRZT24XPK5KbjQA8mHrYG0hdHe7EkvuKa0xyx4G8iUQx6uYJYqNyR
	 oDP6UFfFwlkvK0nVpcKivakP5IRNL5MI+r2BfqNNYc8vq7xlHxy82sZGkUwfw0X5vk
	 e8hxiZzoI0mIQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BE6816094F;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241077.24025.144644331093285638.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:10 +0000
References: <4647955.GXAFRqVoOG@phil>
In-Reply-To: <4647955.GXAFRqVoOG@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 21 Jun 2021 00:32:48 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below (and in the next mail) changes for
> Rockchip platforms for 5.14.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 5.14
    https://git.kernel.org/soc/soc/c/2afd1c20e754

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


