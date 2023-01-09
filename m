Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF944C678D7
	for <soc@archiver.kernel.org>; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9823C43398; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C456C433EF;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673304083;
	bh=o1auHznQuxTZ9PilOFQTXftBhnNngJF0nkvABi8mAn4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=C6lRsYREhwayPhQCSmEgVTb13BDxZyhFi5f0ZqJLQq6oO8DtcL/XQG3lFwZCEe9t5
	 UdxoRoovb8T5aKFW33DvRauS4Ck04VdoKpicF6tFVkqax6wa9uYvrtV3MqW60VL+tD
	 zH0/TnV56643d6sJSp/HEb7ciwNg+eaz8dQYjEA+t/EQSJVlROXehwx3zPckD0IIaR
	 2V1blBgdFqMJqb3ZhggISuqubwvt/p46nxU+zMdUbVsseJYs9bhHU9t7zVNi5016CZ
	 LLWmUyEvVGLTxDcS4sFkYrJS88VYdu1XtMu1oEDibwgJDjQyst7o5GghOl/W5A4iG/
	 qjGSJvZgdUwHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 758EAE50D70;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167330408347.13717.5873810523809829736.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jan 2023 22:41:23 +0000
References: <20230106093909.652657-1-sudeep.holla@arm.com>
In-Reply-To: <20230106093909.652657-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Jan 2023 09:39:09 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.2
    https://git.kernel.org/soc/soc/c/a316877372f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


