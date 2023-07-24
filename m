Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6DFC001DF
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 952ADC4339A; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A16DC43391;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690207549;
	bh=g+QGH7wRUBnsufDLozzIUUli/tsare2rBqOIQ6/cLEw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=M44/X9UKoffJHMWKygSMXCr9nmKq+NJKfERsdBgs4yKEh6XyXsEanW1kGeqDNYDWv
	 NyqYCy7aI3RcFh1HdctizU9dsWQ3Xi1N1hIIyLcD6igI5FR5Hnmv+B9r54NL+b3S4/
	 jKPOKzLdVvsPCWohrJqwFpd+He4Hw+7rr4pWSNklPb7y2slihXQE7A4RSbskZd11kq
	 rlp5V7yJm63MKbaeff905dhbo0iqFAn8NU7JSsWH4KppBcDhl5swH22EWD6qz7fAHl
	 JZPaMnOvDlJKfpHui8qDvWLzrGTGqz8WTcHxm0Q5ix+98ATAluN9kWE/EfzGfl2Js5
	 tX/gK38soYYkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49A5EE49FA9;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi/smccc: Fixes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169020754929.21041.7103948956454919837.git-patchwork-notify@kernel.org>
Date: Mon, 24 Jul 2023 14:05:49 +0000
References: <20230721114052.3371923-1-sudeep.holla@arm.com>
In-Reply-To: <20230721114052.3371923-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
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


