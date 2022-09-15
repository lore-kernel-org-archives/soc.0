Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2B4C6FA91
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 732B8C43143; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D79DC43140;
	Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663273220;
	bh=RfEGA5jnPopqINbLnkjD7+9qIvJQe5j2gzQIbTGevWU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XE3CwJzRZqmY2WnuZ1BQNsngKbqfuiTwrNQ7F4aCTrtb8OwfMf0aEBO8W2t1HXpc2
	 apTOFZMLIjRdPNA2/fR6pAUQpGP6Diep+Jyj/5f+UVgxN7MSycI+V/QaVZwIddeOe0
	 UoyV5oWh4mBGZgng9ZjrAmg7ZNtiR1HVWcBKBu2HRs4iDGo31d7BPqOFfSlgq0J6bl
	 svMPzn+h4OZO6oO/EOkZlTbCFEBAeeiWxIJJfKyG97acuyApwWhkUUybaGwNTKN2zW
	 nvzwKixsAjCKUq8dmOTR2QqBFzyvDNp1iKN30uiM2cLQtnfJJrH3mZ+5RuOHKvfdWc
	 NwUlc7t3unWTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42ABAC73FFF;
	Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Updates for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166327322026.27590.9345751084317846812.git-patchwork-notify@kernel.org>
Date: Thu, 15 Sep 2022 20:20:20 +0000
References: <20220913100612.2924643-1-sudeep.holla@arm.com>
In-Reply-To: <20220913100612.2924643-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Sep 2022 11:06:12 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> There are minor changes in the dependent OPTEE FF-A which are reviewed
> by the corresponding maintainers/reviewers.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Updates for v6.1
    https://git.kernel.org/soc/soc/c/387969b7ab01

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


