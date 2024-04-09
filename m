Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AC3CD1297
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E4FCC433B1; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85C67C433C7;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712678195;
	bh=oSJ06NoDiwlxcoEh983FG0UAUuLRrgxeUtjv4gwTdzw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=U7dBLYXobxF67W26+bjyGVblgB7N3mlzK6SoHvn8qe15d6xe5bM3PVaeq4/iwJOu6
	 adYmu2B6O8mPcPySaoeYgAwGnfUjAa9rUuzFqw1vsz7eETlqnmD+9u2iFZ6TJ4ikKT
	 ZahVwqtJj6B1Rsf6mwyx47gRv8vaGX7oKOsWNPoJ+QE7duwYvCJ2l2BfEvATKPEJBr
	 nOuvMk7wEe+rXSCXGbRjRQtVOD6L6l6aWLPW/Z/F2IUL3BRHzSodJtvX1xqOI/xXJ8
	 pPHK5mptY+NUOqZPk8m4kmgBJ/SEY9vJS06ElOiiZgJwdLBFN6tztIyTNn1TwQrCzw
	 tcGjCmZw5awjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 682F7D6030E;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267819542.12038.1786108746451048730.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:56:35 +0000
References: <20240404140339.450509-1-sudeep.holla@arm.com>
In-Reply-To: <20240404140339.450509-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Apr 2024 15:03:38 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fix for v6.9
    https://git.kernel.org/soc/soc/c/e349017a7b5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


