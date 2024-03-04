Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC14C54E61
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EB5CC32785; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6854FC41679;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=/ynce2tHbm8Ca8HYNnnd6D7NdIcxWVe7ct3ZtcHC13k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BbIHqHxBJvBAP2K5UyZLwS/IEySN2IViNTgWy56bcHkRIzCMXdh/DkCEUPs2bJpk/
	 KqacxrkZg0FnjCP2sHJWulufbvVuTG0HwRITfIHkP61VXSiissD5lIIiI/JhheVm6d
	 agwnId5JI1L5OXExYA35XXR7ueq8FoFS4igHdQSUF46MRmBu8BjQlXRrCTUJlV4vO4
	 y1b7j7BPuJH3hWLmhOdjGcl4b3QHNMobaN3GD0fnfzYbvKnbs9XM3KOiSyr65MfPS5
	 ejNx7m6XfgVrXSQ77wGcmzM7vTxlcjLOp/f1g239DqW6RgS+T6/agKWvAh2wqmoxDi
	 AmzFSIyj9ef2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 555B4D88F8A;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX SoC changes for 6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872034.25915.15627464779408507251.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240226034147.233993-1-shawnguo2@yeah.net>
In-Reply-To: <20240226034147.233993-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Feb 2024 11:41:42 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX SoC changes for 6.9
    https://git.kernel.org/soc/soc/c/d741a2d863f8
  - [GIT,PULL,2/5] i.MX dt-bindings for 6.9
    (no matching commit)
  - [GIT,PULL,3/5] i.MX ARM device tree for 6.9
    (no matching commit)
  - [GIT,PULL,4/5] i.MX arm64 device tree for 6.9
    (no matching commit)
  - [GIT,PULL,5/5] i.MX defconfig for 6.9
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


