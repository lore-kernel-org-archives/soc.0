Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9E2C43217
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73FF5C433D7; Wed,  2 Nov 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E88BC43140;
	Wed,  2 Nov 2022 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667423417;
	bh=gk67uyxxTRvEQjVWGGoJUltHbbCsDNtG7VjVaOnWhZQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vAw6jNoZBdqA3/MssmWlQ0IVqIHbO/YkmzNTpA8/lsJeWaeTKF7gBHFDONYsYZYfQ
	 dyN+aiB33+Q6SKQOwOwu+cxvzFvRtbnz7xQ5Fx2c6Y8RaBlJIuZQ5aEMapvee6TCa/
	 Y6CJBjWt5dj4/cP5EHVF4QCJkt2anRtcDfcYIF2lGWmyL9pgLJMiZUhP+DVHEQOYAb
	 S8CVWdgbtmf4+LRcTAJ7BYbsHu9zASmyXxX0K+XzNs5eUF+srBNKlCLbEBRh8mRw9F
	 JLMNCEKYC8stVg8wOG058fTld8PVKneFiRRiRJVR2izXOTOZD77iVux3Ye41Lj6GBG
	 K6g/Ajcd0hmbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49401C395FF;
	Wed,  2 Nov 2022 21:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166742341729.30442.7908621401866668708.git-patchwork-notify@kernel.org>
Date: Wed, 02 Nov 2022 21:10:17 +0000
References: <20221102140142.2758107-1-sudeep.holla@arm.com>
In-Reply-To: <20221102140142.2758107-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  2 Nov 2022 14:01:42 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.1
    https://git.kernel.org/soc/soc/c/f76c745151e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


