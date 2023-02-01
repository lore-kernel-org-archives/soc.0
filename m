Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A55BC6379F
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C43DC433A0; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46A97C4339B;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269022;
	bh=nCcz/LuFVrOfcQCnHV748AokK4td8gi8Rpa+feT4x30=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AiOYmkXM6nLql5xnvrK2W9FiFdJoJZcmooWxFTEXU63yg9th12UUBDBKFGL6LWjh3
	 fimxl/fjTkK5UWC1wP7nN9/+ZKXqdBWOTg0Reo+JtBH5IT2nicHUGTuTC+6XI7E33X
	 XZhSy5WmEdomDalqqcCwIgd360qOkJVNo4G4K7zeJ/tHqGYktYUQexJRr39z+dXYW7
	 FTGjHZ9RjzEzTPEZ+l2wtLmkO4yPa/7L4htvkMeQ4MmQS0Wf1ytd+ISJac0bLSUNlW
	 ziCPByjn3ilm5dCWD5aWXr0bQhDpYk2Y3vyJLW3SXEVLnkHQ71tsHdvkznY/w26q07
	 7SScfp4wSxCCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33000E501F1;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] Broadcom defconfig changes for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526902220.23236.14688798836739567944.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:22 +0000
References: <20230128193823.1628716-1-f.fainelli@gmail.com>
In-Reply-To: <20230128193823.1628716-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 28 Jan 2023 11:38:23 -0800 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.3/defconfig
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] Broadcom defconfig changes for 6.3
    https://git.kernel.org/soc/soc/c/7d576289b276
  - [GIT,PULL,2/5] Broadcom devicetree changes for 6.3
    (no matching commit)
  - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.3
    (no matching commit)
  - [GIT,PULL,4/5] Broadcom drivers changes for 6.3
    (no matching commit)
  - [GIT,PULL,5/5] Broadcom soc changes for 6.3
    https://git.kernel.org/soc/soc/c/521d844dc85a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


