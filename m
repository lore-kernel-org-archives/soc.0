Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6D4EB64DC
	for <soc@archiver.kernel.org>; Thu, 29 Jun 2023 15:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A50C1C433CB; Thu, 29 Jun 2023 15:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DF17C433C9;
	Thu, 29 Jun 2023 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688050869;
	bh=FaGEqMsH6fu8x7dnbR9GzJbm522k3v/Cq3sZMlanmHY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JEeeJbmc5AQ0SmhjEF+yrFvMHsS0SsLHHlEVHwya85+XGJkpqSrV8KVNe9L2pcD8t
	 Usjuu0oNdOwevk5mAZtIFNXvLmdJPQtneyo/C5w2c7jtlF45RdFr5V/8MtqQBdZKV4
	 jxGKi91KSQz0dx5hJJddTVVVhxbj2ftgOrJwo4RoYlpB+ZFYpFuOzYzPnId2Ds96zN
	 bB477lsqrMi/twnb0Xzl3BJRVa5pP/gljEIJ1r6CR7xjrzLPc18m3OqDW/a7yo5pt9
	 c8Ih7IY0nZ4PnO/zKPamIGLUg186mZGkIE7yBhBvVFLaTQ9VvhgnbcQDY3J8AVGgez
	 0Um3Sy7t9BJZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67D76E5381B;
	Thu, 29 Jun 2023 15:01:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] One last Qualcomm ARM64 DeviceTree fix for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168805086942.12232.15915821854963865720.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jun 2023 15:01:09 +0000
References: <20230622203248.106422-1-andersson@kernel.org>
In-Reply-To: <20230622203248.106422-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 22 Jun 2023 13:32:46 -0700 you wrote:
> Sorry for the last minute pull, if possible to get this into v6.4 it would be
> appreciated. If not, please apply this towards v6.5-rc1 and we'll work to get
> it into stable.
> 
> Regards,
> Bjorn
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] One last Qualcomm ARM64 DeviceTree fix for v6.4
    https://git.kernel.org/soc/soc/c/ed8ff046eddd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


