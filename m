Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC8FC54E4A
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42729C433B2; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C9B9C43390;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=F0IH2ex2yRR88ISs2FZZ9LcM0xygxmzqseGIj9DVzvM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HI1ASuH/8s7QiwPp0WenU8JM6oVaVBgXOC/FraKrfMkty1nS6r8SWOaBx0hnQpOe2
	 LYYxrAzYmzIUdjK/ak4ETejjibcwwAYC9iXmwhszoSYJBXQbM0PIAI8nftmP9M35+3
	 GrtHFXWuDAExnNQm1JLqbVHV13p/CLHGyld/p4pWTaLEMvXCGi1UXd2p+rmJ8+Tkex
	 VFuoT+7k0dGXcX9o2Cfx0vrRaJEHSB1fNRdDoraWXUw3pfxRXNtUsvGv55yfso6YG4
	 v2tYqzK7cdHMesYoz24VsvmEgbTy4WkBMm2CSbEdj0aCc/Trd/5VO0CoKiQF/wfBoB
	 OsP4cKs5MQ+IQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18542D9A4BB;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.8, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872009.25915.14881194784307055493.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <ZdtPJzdenRybI+Bq@dragon>
In-Reply-To: <ZdtPJzdenRybI+Bq@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 25 Feb 2024 22:31:03 +0800 you wrote:
> The following changes since commit 7bca405c986075c99b9f729d3587b5c45db39d01:
> 
>   bus: imx-weim: fix valid range check (2024-02-06 14:10:47 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.8-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.8, round 2
    https://git.kernel.org/soc/soc/c/d20f2a196d28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


