Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A85C77B73
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97FC3C433EF; Fri, 26 May 2023 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 758B3C4339C;
	Fri, 26 May 2023 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685117419;
	bh=jUUoOs7nDpq0Usf63X+oh19q0sb62PslALcfZiHF4QU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WrSHMmy4c3MB1h0Bo9ROP2SyLPxvfeFVvbxku7CnXChVwBDarqIphiWlk52sXDrCf
	 BK3+f+I+i5Dv3xo2Iy+spyojJj8POg2khixBsCuw8U/gEsAMPx3qOg59PLfBwFyGnG
	 pPJYNEkADMgmDtJzlOuMfUC+MfQRavjsN54TQWFvNhCrLNyVahDbs3UiopBB21pkGD
	 cMXAs7SY/tuY0Tjy7y3AiqL6YXqojZ9hmUZbtMGr9LYfG4ivrKkuSHWOl7+oWOZbr9
	 0TiBKmqhgJApdSavOb8stGl9lF43vjoFPy6lMf7YTUdxxt192DEc3RqTCAYfjN+p2h
	 qDF+cSwD4fUWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54D0BE21ECD;
	Fri, 26 May 2023 16:10:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168511741934.25839.6688326588156894642.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 16:10:19 +0000
References: <20230509143453.1188753-1-sudeep.holla@arm.com>
In-Reply-To: <20230509143453.1188753-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 May 2023 15:34:53 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fixes for v6.4
    https://git.kernel.org/soc/soc/c/abf5422e821f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


