Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB1DC6FA93
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 586EEC4314D; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D1A7C43147;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944728;
	bh=OttUNYRh6Couk+4OS2LT6nu08USQdKrCX44a841Sr4o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FU9eBizvAKy20OAI7rIYag3JlnKN/McUcsUXdR78dwnpRXWfJ3vJIL+DxINN5eVFh
	 7SXj2pM/R2GEkP1cdNZ3jZPTA1APCFQcI1TQKd/dWohyWe462U6hfZB7SCrb8vcBOy
	 gMlYk9pmj0xYgP5mGn0yReWwIpSsTBbzNFx/T0zgcUtZ2aCRw+s8y89mko0SDhvSLY
	 JPtDyn4S0tTqMpvcZ9JIrOe4rrg1B5foV1nancbNDJZuVGWZvW+/BPOfo9YaBb0Svi
	 ZZ+WqwZmo0qgWtQOuB5B7OrPBZ8gMrTPKf48CEjNEbM33gYfPrnLbXBzGcr8m6rCQD
	 bO54EquIGTObQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2BE6DE4D03A;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM DTS updates for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394472817.12526.18421676091455628812.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:52:08 +0000
References: <20220921222619.1338380-1-andersson@kernel.org>
In-Reply-To: <20220921222619.1338380-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Sep 2022 17:26:19 -0500 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM DTS updates for 6.1
    https://git.kernel.org/soc/soc/c/78559d6fb859

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


