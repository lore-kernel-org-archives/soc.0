Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EB0C41513
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27912C4AF12; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11B9DC4AF11;
	Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719609650;
	bh=8JbAt82przhlnBvZk7q4bTirxd4nxq19Us+M9cxQpb0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=E2QvKcBeu+8MScoDTRXtTFpuE3LLmMVDPff4n2Q83y53lpepsYb3UD/7nQcXm9/A0
	 Me79telM5aAln/qtsj08FFhAl3OygjNlWz4P52rhfpcWI/wCVvAYDRP1GUvfOLjHHp
	 3tJfepNyuyAVMGgMdboqgldJoe7Cz6FYxec10d4FfNt97jHZkBE0RWFbjoyGqupLh9
	 0XYGw48eX6Dj8JsXjModzhZOpBpFazmwDPwIW9smllIKJ3/aw6Gxdfc9jhrF/ZoheK
	 L0SrspnM8HemfNa0gP9We9MENI4bi+v0fFLR017JD2gjZELuVxbcOUU3ce5c2h2XeW
	 uSaa86PYxhp1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2D07C433A2;
	Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.11 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171960964998.14447.15761605272705533112.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jun 2024 21:20:49 +0000
References: <2187283.irdbgypaU6@diego>
In-Reply-To: <2187283.irdbgypaU6@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 28 Jun 2024 16:03:38 +0200 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.11-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.11 #1
    https://git.kernel.org/soc/soc/c/c5003718cb5a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


