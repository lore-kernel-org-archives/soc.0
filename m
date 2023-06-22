Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC5DC001DD
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73635C433B9; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CE98C433B7;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=TM9s+3ybdQw7ts0z4U6Z4v231wEdepOamCTDWVy3UjA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=buWDDT1C6udzNcKbnN7aFSNo3XXaGpt6KbzoYs4NrNrLuCtZOB+WlZhT4zP2c0FtB
	 LD5OP9bvxk7sPP/76FaHt8bqTDV8BpvbsqDBAg/bepXhWNBVWEKpZxkWXHqLdAJzjP
	 r+g7Xn2qXYjKLbbJDhV1idjK4hIxE0Lpkom+XKz9sE7AlVapjN9X22kE0BoHcz/l6O
	 7oopYs7fiXyVcbc3XiTgSbVfwg6Lo+rxNMqlC+1ydNXO/2i0OM7MylS4vvTTil1AXd
	 eHWLLya1kvBGOiCSrLMlUVsPDL1HOjeQoR2C/8Z0DUW23F56aslZWtvBZT7jLp27Nj
	 M36yqP4p1x6qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DDDFC395F1;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745023024.12309.30120780065437645.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 16:10:30 +0000
References: <20230612121017.4108104-1-sudeep.holla@arm.com>
In-Reply-To: <20230612121017.4108104-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Jun 2023 13:10:17 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull ! The powercap driver related changes that have dependency
> on the firmware driver part are acked-by Rafael and agreed to merge the
> changes via SoC tree. All the changes are in -next for a while now.
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.5
    https://git.kernel.org/soc/soc/c/2d0d3a100407

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


