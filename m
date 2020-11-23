Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33002C2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F0D7F2100A; Mon, 23 Nov 2020 16:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150206;
	bh=hZ7hvIM5eSs0OJFMYhQ7dWYBDd77E3MjG8CfhXr4WI0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YU0QJFluncNRZdNPr8vQYSdkdd/f3S+OsUg1yOeoL0F1m04miYEl25cQhmTw9B9lA
	 r5EkAWs3+iSvRWc4xuVTZhHCb+c6xyfa3Iu5D5TnK93cShJEyTVhKQ+fxjTzd8BbqF
	 MhhW8WOaZzs/b36/48QZUiHv+1zb7OoJinuWBbQY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160615020683.10952.1842524458388131037.git-patchwork-notify@kernel.org>
Date: Mon, 23 Nov 2020 16:50:06 +0000
References: <11641389.O9o76ZdvQC@phil>
In-Reply-To: <11641389.O9o76ZdvQC@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Sun, 22 Nov 2020 14:33:05 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below some Rockchip devicetree fixes for the 5.10 cycle.
> Please pull!
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.10
    https://git.kernel.org/soc/soc/c/4765df4d3a13

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


