Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BEFC64ED6
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91F8FC433A1; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 784A2C433D2;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676302229;
	bh=nnhfSHBKgNo3vb6CROqSqJOtgU2YpkgTKM0rdvqHIjs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hZmaaElPzVCKxfI89Lh/Gk7+L+4NK6Cnjc6W/WPK1qFBVnTN8+1Itc65BAm+u2hbY
	 rCyaMiDE0MrYNanNr6R4CLluZ3NnWIz3R1zX33Mo63u19y2crDrDmVKHh0Ak2PZJcv
	 G5dnsGLcX7xGRTo7JClaZTrQP3dqn+CIIkNRoYzJLEA2dFa/doqBg6CIwmgPskWjI1
	 etsmP5+bQcyOpJwEGHMl1WoIKX3HzqROycqLyft2PB4s5s0tWy6VPhhVJhXvx0P4tU
	 gicj6EIZt1VbTCyQqt4/1CgVDh9pXauc39GEr7Wzobnv9+gyav2bsIQ3sEYdzjUvTO
	 DPuHUNliE3+bg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E12BC41676;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm driver updates for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167630222937.5266.4559495048006452632.git-patchwork-notify@kernel.org>
Date: Mon, 13 Feb 2023 15:30:29 +0000
References: <20230210182242.2023901-1-andersson@kernel.org>
In-Reply-To: <20230210182242.2023901-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Feb 2023 10:22:42 -0800 you wrote:
> The following changes since commit c5d52d7bf241a4d06b651362446644948621c426:
> 
>   soc: qcom: dcc: Drop driver for now (2023-01-30 20:30:54 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.3-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm driver updates for 6.3
    https://git.kernel.org/soc/soc/c/01e9d2c6bea9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


