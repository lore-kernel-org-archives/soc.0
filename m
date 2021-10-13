Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C682C433FE
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1714561168; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F3B7861165;
	Wed, 13 Oct 2021 19:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634154007;
	bh=FYDSS2p40yidAkqMEWkUZiQAo4I4U2TJXDklZwABToI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BhvBCGRRC84pvMicn5qaaKFogmbW/m8durw0dvHr7Ix7P9+ViYp0r4g+QiOKyIbuU
	 e1bTWZ5qyqz1XjLrf1Vf1phmeppKsPCDSfB46Kd8ob8LbaB2V6HAYMbM0xW9u8kqUp
	 NzYBR67QnNpovHaCCX97epHehIcs8XFGWTqhVbtlE1PtQUu0FmTryYF+XGt4ro8Y56
	 ULAh9vTZRr/bId96xye3OrmAoXDN6iQiBjiyT0Oeu3c7ODyDukNo6yMRSjf9YUyMID
	 zODRsEJ2YE7F6X3IatpK5N9WjyrkjlUgEQ7h5kmG+uNkvRDyvvPTXgA1YkF+B4GHsq
	 F3+MeWqjXDUYA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E35A1609EF;
	Wed, 13 Oct 2021 19:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] another OP-TEE fix for v5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163415400692.8098.12850897844937672596.git-patchwork-notify@kernel.org>
Date: Wed, 13 Oct 2021 19:40:06 +0000
References: <20211013122854.GA1542549@jade>
In-Reply-To: <20211013122854.GA1542549@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Oct 2021 14:28:54 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this OP-TEE driver fix to unregister OP-TEE client devices
> from the TEE bus when the OP-TEE driver is unloaded.
> 
> Note that this is based on the previous already merged OP-TEE driver
> fix.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] another OP-TEE fix for v5.15
    https://git.kernel.org/soc/soc/c/3536ac5d771b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


