Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3990C3DA6B
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78FDDC43144; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 630DAC4347C;
	Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661765893;
	bh=5+ePfF27zupOeQQwkfg9gDEY+6g4Nb1lsH4XvB3lXS4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Y/6Oi6x7/prcWU2wGpES3zT/5bzCPvHdJR6ej8DxDaIT7bPKDnieyhZx+LPR6BLO6
	 0DmNoOysp9yO6YUEwMkUePbkPjBYygwaLKFB6z6ieueRi/VEtvr/WZigaIutaY/0T4
	 MtiuQ2BRXRynV0wGQnsmuDi1oH4kVNAyRmcMq5n+mT3q25rI0roY939ATXoi/sAcCo
	 EhrpvwaXoGgPdwtFOnR5+0kf+kjdpVNEIy3G/aTg3kVCoFYYNIifR8i0IdDO5lFNKy
	 cFwoKxOn3YnQO6JkQxBGoNg5ndq800IFXgg62IgJpDiR31SqgcqI04DD7jZh512P+I
	 PTq3GH3q8f77A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 450A9E924DC;
	Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix TEE system compiler warning fo4r v6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176589327.19402.16830635777390081845.git-patchwork-notify@kernel.org>
Date: Mon, 29 Aug 2022 09:38:13 +0000
References: <YwdHcdEUib7obbbW@jade>
In-Reply-To: <YwdHcdEUib7obbbW@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Aug 2022 11:57:05 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch which fixes a recently introduced compiler
> warning the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix TEE system compiler warning fo4r v6.0
    https://git.kernel.org/soc/soc/c/a5b06d9f2a46

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


