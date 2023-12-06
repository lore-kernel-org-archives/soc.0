Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18A3C10F07
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF1D9C433AB; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9055C433CA;
	Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701883050;
	bh=DQitiYSu3HN82FqM8RG/4X3HIXveYPMfLjJKAfWiRSI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bPFpwajPNiOuYMhYZZor+dIRb/pjUfRt50cRVW52DqKak8CkBhGh6Nc2kCfM7GTVz
	 JxCGL+/pAQTsDmyneUCrZdi359MXQwXCHumIRXynsvD8o8tOOxTdukmiZEN2ZTfuAE
	 Spwd7o12wG7hWb+WN1d0DK6zl3bvWl9TlpbsUwbFGpHqpVY3+XiHs9J3Q21bKWS1HT
	 nDlepaCnc2Q6XrPoMxzSMoPBS0Z8y9EOSUUNkBUOnps1kkhXfl64I0bzKYi4jhcs7e
	 Wiau+zG9bs1le7r50vMv3Ey2s7np1Tz5uA3bY8LK9UJ1JUBtXlzHLevIdmXbv6Bvht
	 dcTUukjXhQAQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 956E3C04E27;
	Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC mailbox updates for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170188305060.32642.4065422728642879563.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 17:17:30 +0000
References: <6e64472e-c55d-4499-9a61-da59cfd28021@marcan.st>
In-Reply-To: <6e64472e-c55d-4499-9a61-da59cfd28021@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 23 Nov 2023 19:26:07 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these Apple mailbox changes for 6.8.
> 
> This moves the mailbox driver out of the mailbox framework and into SoC.
> This was long discussed months back and has been cooking in linux-next
> for a while, so it's time to get it merged.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC mailbox updates for 6.8
    https://git.kernel.org/soc/soc/c/cb6c44e02092

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


