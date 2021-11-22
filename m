Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18481C43219
	for <soc@archiver.kernel.org>; Mon, 22 Nov 2021 11:08:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9C4A260FDA; Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8282A60F9F;
	Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637579312;
	bh=uuhlWKPIKwtvWm2nkjo3z5gPcIBt9zHZfABD0uCZd/E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kacEpQy5guAXizynT2gq5SUoc2z4l4yCq2aLnU/nFWchN22HiiULh+vhZgqXp+R/F
	 upzF3qoHKVTBYQVV4C7TA1fAv/YaBZqVVb1gFrpbTldxk/dfrgMDVc4y058aKp1VDy
	 HybhQrCHksDyHLVRkM5x/yQsPe6dvPnN+tIc2jbl+fI6cM7rPoV0+P8FTmj87O/oY7
	 QKNCBZyl/q7ewPKq19ISWaQzZgFV70tS9tAH9KXvUgCLUHEzrVVjUoJO/RyD2jJD6U
	 mMeQPEmb1xABhrDs6iLtyJhlZm7VwVeOgRhoDRrOSElnVsMJZFYdKxV6HlXCt9yqU5
	 k8YWEWTePZH/Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7A0AA60A45;
	Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree fixes for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163757931249.7615.746458307921020929.git-patchwork-notify@kernel.org>
Date: Mon, 22 Nov 2021 11:08:32 +0000
References: <20211116201429.2692786-1-f.fainelli@gmail.com>
In-Reply-To: <20211116201429.2692786-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 16 Nov 2021 12:14:29 -0800 you wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree fixes for 5.16
    https://git.kernel.org/soc/soc/c/3449d6bf4c45

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


