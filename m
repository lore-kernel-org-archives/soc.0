Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00866ECAAA1
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B352BC433B5; Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98211C43141;
	Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666889073;
	bh=No/sRC3Dstr9F1GZAIQWo/0QX5IJJFGsGVWMjkBBlJ8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GUi2+jzA53vq8SaWcM8Y8bQNpGRMjfk83LxfLvKBM5UOSimrjnJJyIQXIYV5xTKlK
	 +58ADZ2H0aumWUqR5LTBfP78/lsNLzhnpDyih49WipH0NhbV/8eW4lDBuf8Uk6DPEB
	 bJN3ZAf4ojyIfoPqnhtm1tGtVDsZhE9NIXB31Emk8bKTYQh99UCxg6txADR88jntAY
	 MdvpFwa6IbLKAyQklDk1fZieNjt5q6jJb2ncxYt8O5dz+LRVqPNQrlI11SpuGCVU4B
	 a4GSIhUmknTDAPE/peubKbqzrokbH0QJq9pSsmReRXJ4otmZye7+RFxfFcyDqDnlkI
	 +DTrVSZZLKBtA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76479C73FFC;
	Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166688907347.25139.3706909423275565142.git-patchwork-notify@kernel.org>
Date: Thu, 27 Oct 2022 16:44:33 +0000
References: <dea10860-2870-3a9e-fa51-21e493b1573a@marcan.st>
In-Reply-To: <dea10860-2870-3a9e-fa51-21e493b1573a@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 24 Oct 2022 15:21:02 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these DT changes for 6.2.
> 
> These are the t6000 device tree changes that got punted last cycle, and
> some audio stuff.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 6.2
    https://git.kernel.org/soc/soc/c/40cdf7e00923

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


