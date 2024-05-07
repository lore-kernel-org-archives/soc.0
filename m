Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5121C25B75
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97192C4DDE4; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81C83C4AF68;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=0doJUzCyKywALCkHDPKMFaOX+QuofM8qHFCa5Qx0i4U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=T8TkjZV+MXwqG0uq2HCV6HK3LYW1lRMqmKMasBTarM60ciDXyDUbNCKx1aMp8tfQv
	 OAS/2yJ7SGptMkpvr0shHj3PUagR5bVtnqlm6HpbB7z9rdEmQqQ3f289YtQYijiVex
	 xjY/gCPf706Kl9XI55NutZBSxLDDWo27qBWkCEga2yTkYJMeORTtncz//QYxhr81bf
	 mbHSnNjZCNfmBANrCCKvGyzR4RioSimCDfoP1/ZuIYtmmnsubGiAe0atYQIhtwte6E
	 NHtcQ54ct9I/Rk6kreNHZbeVKGGwYJ0q546WBws8v4myxJO7/ED4FoWDGjaKWA6mIJ
	 ep9V6yP28BdqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 748CEC43332;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.10 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483947.24942.2509872705471408121.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
References: <87jzk8ndyy.fsf@BLaptop.bootlin.com>
In-Reply-To: <87jzk8ndyy.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 05 May 2024 23:30:45 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.10.
> 
> Gregory
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.10 (#1)
    https://git.kernel.org/soc/soc/c/8db93c212e64

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


