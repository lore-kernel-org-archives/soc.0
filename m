Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E78C25B73
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47CCFC4AF61; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32941C4AF49;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=aQfn368+wghgGPIiAwAoDtX8233QLj6w2QTYCxsjU58=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eOLYaRUH832Y5H/cHfsvMgJTVFuoe+56I2D9HW5NpxvWayNgUMGguwEN8iRa9BoAb
	 8o0cx38iPVaOlDuR/WPOnRAysotzlAy3/jX7Wm1Jk+PRBTlx4SoDcc+Qh3+GjDef0e
	 HIvETkIkUg06FOzqbGsxFsgphqP11MBKBKljmUEcma2w5uYGhLwOx08+ycZKKA0lqA
	 dCkxKevA5UH+73dSCbV5CMQGQd8tVmgIaLqt42suMCU5GpPCHM/zFQH2AGeBDoM6FS
	 dXt8Phw5nfaidevmpcweS1ncElWyjL6F68o2AdL1aATU68zFumOnOCZqlALuwMOqTh
	 KhamEsN0tnwcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2AF8DC54BAA;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX SoC changes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888817.20509.1858416277198489927.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <20240428121247.10370-1-shawnguo2@yeah.net>
In-Reply-To: <20240428121247.10370-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 28 Apr 2024 20:12:43 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX SoC changes for 6.10
    (no matching commit)
  - [GIT,PULL,2/5] i.MX DT bindings for 6.10
    https://git.kernel.org/soc/soc/c/3fdb967e6822
  - [GIT,PULL,3/5] i.MX ARM device tree for 6.10
    https://git.kernel.org/soc/soc/c/7194048ccfa2
  - [GIT,PULL,4/5] i.MX arm64 device tree for 6.10
    https://git.kernel.org/soc/soc/c/f71b3cf82e0a
  - [GIT,PULL,5/5] i.MX defconfig changes for 6.10
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


