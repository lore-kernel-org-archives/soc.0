Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689A1CDB48C
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58C48C116A9; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D7F0C4163D;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=VcY3sS1ZqMpASH5DvlrkJOj+UFwDp1HuLovf5GEFE90=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OeARwc9zOrj1+qI2yuRSDTW6ruakP8s2P7nBv1086ZJLWCwM9txVso7+vuJqe+Cy7
	 lvGO62t2IqnvoylMwSFR9c7I6vhtbgZNq6DD61sXrLLeT0RNiFmjgEXmLyZEx4EDvz
	 UYuqnl3/QlxSR5U4qCohpoBV7owPw9VBiv/kzuh6+ARhz1JiJ5vA57OUWOpGdzPMPs
	 Ckp/YLRmsVGCux6lVVbFc5HV3yfMGNbgJQ/KVU7ReogPUiq6ifSapu+HiNDhfT6zaQ
	 d1ld01BYXxitvKvjeFI7tm1VFOFT+hzWnZx8btyR6ammr6Ys0dJqNiGmqH0GT4d5xC
	 Zvur8nApzb/ag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29E59C595D0;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191816.22284.9376059324538750990.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:58 +0000
References: <20231010124354.1620064-1-sudeep.holla@arm.com>
In-Reply-To: <20231010124354.1620064-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Oct 2023 13:43:54 +0100 you wrote:
> Hi ARM SoC Team,
> 
> There is a small change in KVM FF-A proxy implementation which is Acked
> by Marc and agreed to take it as part of the other changes.
> 
> Please pull !
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Updates for v6.7
    https://git.kernel.org/soc/soc/c/d3cd3b55014f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


