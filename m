Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DBBC61D97
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDE3CC433AC; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC1A7C433A1;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595889;
	bh=fQBREP57o6/BugU/6izvxF5lhNxbICnQVgcpPvtzGGU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BfIAt6RZGOvA/jle9CE251ksDvtAkvC33mwq6MWqS0tBS5TpWZHTnXXMn2VKYrwlq
	 l5JWOQMwS5Lm2QKd25WVwhgmMHIWa+Jt1IqMAvGtjm1QKgNur8LL6hJezgyefeiQiP
	 94t2lj4bEHvvFrh4UU4csqdDn+J9hb4o6f2kmQjlrsChnwa4GxZeh2n8Wrx0AuKXSC
	 Y89QppU7XZiJvqe0iyRhXtQqNfvQUZcnKrjFr+01qWMnmRBcJ08cEcp7rbPc0pzN5f
	 +lMWFshsOB79oxaROhlQsrd+8qudO+tnHM7Wlq3mEBKruhUS9/b/tqWwpDhwZ2qpRt
	 9l+S/7jZNk7Aw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A565BF83148;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588967.12731.16583497523143666535.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
References: <20230120162152.1438456-1-sudeep.holla@arm.com>
In-Reply-To: <20230120162152.1438456-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 20 Jan 2023 16:21:52 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> The majority of the changes are in -next for a week now and all the reported
> build related issues are fixed.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.3
    https://git.kernel.org/soc/soc/c/f938b29d277a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


