Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AF2C001B0
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E579C433CB; Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82E66C433C9;
	Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690207821;
	bh=YdwqEqwS1aAiisAGC1SNnUEtABgVcxH+RKeRgZZEz9w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MoC5Vy02azpvSUSLb4S10x1OQt+rmmADyCwc+weYAGUAJ10X930XD6weefzgT+MiG
	 JwlwqV6Ut/Ck0ZHCbM8gkgsij+Iuxb8TGps9UmIZf3Px9bnU2tTmsNiPVm+MKmXRoK
	 E0ZhFgXxjbIVPBICoj/681WKvg7OmPSaFc583SKX7ATUkaTRe2vUOFLQlAODjRmS0+
	 JLQ/qnqu0CTKW1MP1TXEhD8F5WPb+paP/mjtAOpJVUlAIWAg7TVSyBRzud5a2oYfyu
	 vntzLdxnPiXxTCPPZ/bOCUxLqaoztSYtcy4ZvpH9gJ9k4SZ1IFtZF2EAr+r9jK+ERZ
	 LxJZa+hd83e2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6384EE21EDE;
	Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi/smccc: Fixes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169020782140.21041.13516965978486475442.git-patchwork-notify@kernel.org>
Date: Mon, 24 Jul 2023 14:10:21 +0000
References: <20230721114052.3371923-1-sudeep.holla@arm.com>
In-Reply-To: <20230721114052.3371923-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Jul 2023 12:40:52 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull ! Please note I have included one SMCCC fix as part of my
> normal SCMI pull request as SMCCC is extremely low traffic normally.
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi/smccc: Fixes for v6.5
    https://git.kernel.org/soc/soc/c/1b64daa6020c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


