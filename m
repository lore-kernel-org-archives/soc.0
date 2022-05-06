Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214ABC43217
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 21:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0029DC385A9; Fri,  6 May 2022 21:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA2F5C385B2;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651871422;
	bh=Yd65e1BL2px9izL7BxwzeEhGaC/yO2y29Sr/qwdPcqY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=T0S3LWw2VoV5xbTPzotEoIPdKMT9XyEEYpgBVNUXtO9IMVBP9k9gjYBDfKyscV5iJ
	 64SNGAuHGx6XkVIEqk85LU2kSSL2YeXYC0TexBEv7KPvISlulyuSnFjcpn7HW7EppR
	 yyFRjmMdakaffm2AAWQWEWMvdJMI9+irTlyQ0m2vm3glQ0Hvqm4/rmBbC4R72NdahL
	 ZpiUcwomiMtpRBKikzdv1qOcCX2dCfrd6+I/a7b2eccVTqe9RabMZhO+U9lpN0U04V
	 qy0eaar2ay5tTrofujV73dxKrUqa5eDErQSOa8t3ToOO0iqE1YjqSIggGzLYIGdsoq
	 jGGmouLSt0u3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0876F03926;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] Broadcom defconfig changes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165187142278.4183.13296594997420096692.git-patchwork-notify@kernel.org>
Date: Fri, 06 May 2022 21:10:22 +0000
References: <20220504210942.1838248-1-f.fainelli@gmail.com>
In-Reply-To: <20220504210942.1838248-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 May 2022 14:09:37 -0700 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/defconfig
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] Broadcom defconfig changes for 5.19
    (no matching commit)
  - [GIT,PULL,2/6] Broadcom devicetree changes for 5.19
    (no matching commit)
  - [GIT,PULL,3/6] Broadcom devicetree-arm64 changes for 5.19
    (no matching commit)
  - [GIT,PULL,4/6] Broadcom drivers changes for 5.19
    (no matching commit)
  - [GIT,PULL,5/6] Broadcom maintainers changes for 5.19
    https://git.kernel.org/soc/soc/c/10b1964630fd
  - [GIT,PULL,6/6] Broadcom soc changes for 5.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


