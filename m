Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8711AC54E58
	for <soc@archiver.kernel.org>; Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 579B4C43399; Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C339C433F1;
	Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710186632;
	bh=CEElcav/m0sxZ1Wf5Yblhz+7bzDe++uY3rhgUj2CnAQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DOQmjJ3h6gH38I3Wp0iUWCU+adeg3Xaf0wocUvE6dQ36iOpaDjSpyhQ0KRGxyeh36
	 S0DFpZa607PvihwWt4C2X7lyTnPHec52IWIssl4ReJRj2LKB3lB6sQ2RNHuLSgns93
	 GSsx/QdVtUuvq7CNJpwvcbXwC42CxQ6yd+KgPlOrfVrMFc4HDIU7Br8PPDQ9llumod
	 zmXrJs5CQw54qrn+TKo29Sbws66RnfN5aeIdP+3NscvQzab3Zjl9Z/ngU1i0yvulaX
	 OwrTKPlLWga173TyUyXuMNoIhRUd2oCbuvbnUjHm/uK1PKbfDqfgUXC3rh7r9u0rzO
	 EtmG35EvlJWkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2C127D95057;
	Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Broadcom devicetree-arm64 changes for 6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171018663217.32255.7810627858062701113.git-patchwork-notify@kernel.org>
Date: Mon, 11 Mar 2024 19:50:32 +0000
References: <20240307200441.2151734-1-florian.fainelli@broadcom.com>
In-Reply-To: <20240307200441.2151734-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Mar 2024 12:04:39 -0800 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.9/devicetree-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Broadcom devicetree-arm64 changes for 6.9
    https://git.kernel.org/soc/soc/c/de79649bf981
  - [GIT,PULL,2/3] Broadcom drivers changes for 6.9
    https://git.kernel.org/soc/soc/c/c00304acdc64
  - [GIT,PULL,3/3] Broadcom soc changes for 6.9
    https://git.kernel.org/soc/soc/c/f0379bd1c7da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


