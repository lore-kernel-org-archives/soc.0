Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9B9C4332F
	for <soc@archiver.kernel.org>; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37EF0C340F5; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F25CC340E9;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645216811;
	bh=ZYuoDkURu0QQPojf46oS1k8nLD7nhZTHXuRW6OE7WFg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=usuM99+EjnlIjL2Hem4pm/6RvN47ykhXpgLnO6aP947EV6vwvN/BQXGTB0eZ9bAL1
	 +O0HsrIMmrj0nxbUWk/dPO+fEnEzFe67kOoxIu94bZ1mXTB6Y9ClWDY4ZB9BqlsAX6
	 nQsB4DVfJt2yO6Zia9FtQOBSim4pm+VzmNyHYAAdKY4EDtpAmWj4/02xdbHU/zU1eq
	 LvbrajPWU5fumhsqWfwPGSE6PK1hThY5V4K6kWoScv9Mnrl4R1Mfki83jhynIZWLJW
	 JLCYx974AGvtnbxSsJYexm8ZcFMcHBtBE8umdV+M8Tiyc6cOpsv0ujkIBvpkfQvXSL
	 0KGtXYgEhbYWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 041E8E7BB0B;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE another fix for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164521681101.10306.15582755608006603718.git-patchwork-notify@kernel.org>
Date: Fri, 18 Feb 2022 20:40:11 +0000
References: <20220214125931.GA1332792@jade>
In-Reply-To: <20220214125931.GA1332792@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Feb 2022 13:59:31 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small OP-TEE driver fix taking care of a broken return
> code in the error path of the two probe functions in the OP-TEE driver.
> 
> Please note that this pull request is on top of the previously just merged
> patch which introduced the problem fixed here.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE another fix for v5.17
    https://git.kernel.org/soc/soc/c/4f6668f05206

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


