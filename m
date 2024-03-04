Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683A0C54E67
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37FD6C4167E; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22278C43143;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=Dg2OqcXujkrmNs/jTT9aTwt9BXPMCnkefFjIinI+ALI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LlA/kE+o2qn0LirRALoW5ZmKV1YMbiCQWIX2ndV7cVbVzVGZqqPX8j5hzU0HODVjL
	 IfBOfgDQfTYF+K2AJ9cvTzcOli5oP1/BG+RDOhdjXutw5JUKxPVH9e3/Ld2rR3MwIX
	 JeETH6KIRH4ebwrj4xDbaov0ESPzbll7qgL8ysGo7cVl3QlPOMDDxUIxrFaz2+dcFZ
	 A5Q2cndjAd2UhN0y79jUP3mSTqah7UItQR6erzNTtBF9g49+XjDLN05YzZ1520F3mp
	 eB0pAduhl1YKK7eYbWaC8cHGp684se+U51vpuCKwB/w9KyWb4PJTo7Wvsg+7KbppF6
	 HV8EnCOtVohAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09117D88F8E;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927503.27833.14162758498046473672.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <1937f5ef-5d76-4259-931d-523c0e2f0a91@linaro.org>
In-Reply-To: <1937f5ef-5d76-4259-931d-523c0e2f0a91@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Feb 2024 09:43:43 +0100 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changes for v6.9, with:
> - DT cleanups
> - various new hardware support & set-up
> - Amlogic Bindings unstable removal
> - New board: Freebox Pop Player (IPTV Set-To-Box from Free Frnch internet provider) based on Amlogic S905X2 SoC
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.9
    https://git.kernel.org/soc/soc/c/4bf6c3b48f2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


