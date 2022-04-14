Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31787C433F5
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 134A1C385AC; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1A74C385AF;
	Thu, 14 Apr 2022 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970617;
	bh=Alfk728T8OYECR2+YQ2/L5eBDTBkKtec4DM5gpkNEhY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dj86E252vy7SEoClDjMxyIuuvFJAE53wkj0TW5vmw5JkALnJHmazdJWBotGRqoZJ0
	 xeiygpJ5rQlWdRGrqu+dk6dvqPg83ns1gSO+qU0xG5CJrC2dWE5KvfG277YQiHsdDj
	 sZ6hgd+rKeESVDSBEiP0Q17NsQQpMEUXHt7Ak+rvX1nF29LDZsQ4dJL3PBYroiSMC8
	 f4g5TBEbtraskj/gpjpCUeEm4u50TE8stMxj9lKPHEQKKM2MT7vsERfb9vL9IN9vpE
	 tZteYQPbccjAldg11WSSQSS9B6mRoeF8N7BD4jOPEGB3pN+TuO9OHZRCjB6elUmpB+
	 6/dpMGU5uUYXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DD507E85D15;
	Thu, 14 Apr 2022 21:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [[GIT PULL] OP-TEE fix for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061690.10394.13929947491312847191.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:16 +0000
References: <20220413052001.GA49798@jade>
In-Reply-To: <20220413052001.GA49798@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Apr 2022 07:20:01 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small OP-TEE driver fix for the error handling path in
> the FF-A probe function.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [[GIT,PULL] OP-TEE fix for v5.18
    https://git.kernel.org/soc/soc/c/c834eff53c18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


