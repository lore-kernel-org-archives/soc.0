Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32803C47DA6
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25F7FC433A9; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09A5CC433B6;
	Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190301;
	bh=xKpCMVD2UdedpdQFLPuu39ogtQjDpqPyZUUCPMEf828=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ejwmnDj7DPPWV7iBmE32WZYjFFjxBSZwwkoDFxuEdU3ZEKMJn4j3lZWtmJa/uREu1
	 Cx3tgzRft6WYwIniOA7cI44lK9v0jCoAnTrstku5QNYo0CM26q7gxCO1JwyFaxb/aY
	 lymAspPyWfBI2pWDqIfsIm0FVTQKV+QIqfrfaTuFyZOOQTbdLVyYOtYrkw1golwmst
	 viimp4IqCJPrLK61nZ84KBGP0xyAEFZpugBl79jt2dlfcR3kfr3UOFgb3iWOq50OM0
	 E8W0R75EkskmN0ZMyK2zebLrTOczUc4j3HHwaXXRywLP3v4Ew1uHJS5eNZ2y7h+t4G
	 y8PhJIqrHlEEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA573C395F8;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree changes for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030095.6407.11794780360754233590.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
References: <20231228085822.3656546-1-florian.fainelli@broadcom.com>
In-Reply-To: <20231228085822.3656546-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 Dec 2023 00:58:22 -0800 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.8/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree changes for 6.8
    https://git.kernel.org/soc/soc/c/1e672c2585ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


