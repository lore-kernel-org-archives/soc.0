Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9995FC64EC5
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81F61C433AE; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65E8DC433A7;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269022;
	bh=oz/KGSbC5hMqQtBmvt7BA4YLZPuSQycXMPayb3J+YAY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LX2AEw9GkvDFEbAMBB7jMGKaBOVtRTyrlQKIBExHNq2t4/NlHZVObJxCw+WiXdRBa
	 PEEZ5vuWtrIzZmAdyRpUoN93v6U2B9473jCzh3Vj/XTJDRmunmDtCfU+b2sSKE1Aj/
	 PrpQIAyafMgrw4DuO2p1r2PAv/6o8aIdt4GTOddjVbvYGj1h5oJZEM2nlyOb/lamQd
	 z1z9XOZ3CoeudgfxgfvJUuuvkJbf7GaS7GR8b/6Y6UiQsL6OViU4r5v3j2n3XfYMra
	 BkeM9TeKYL27r04bZnjboCo1NaDGVbLGhCMPpVMryG8FCQNuvdqwn3UQRJld9q4TUw
	 rWl6ZrEei1CjQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 51582E270D0;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner config changes for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526902232.23236.15798188049510070270.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:22 +0000
References: <Y9Ra7dxkfMI9Xp3F@jernej-laptop>
In-Reply-To: <Y9Ra7dxkfMI9Xp3F@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 28 Jan 2023 00:14:53 +0100 you wrote:
> Hi!
> 
> Please pull following riscv config changes for 6.3.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner config changes for 6.3
    https://git.kernel.org/soc/soc/c/7ba26a7201cb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


