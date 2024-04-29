Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66717C25B76
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C6BBC4AF54; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46BAAC4AF62;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=t+OfsfNPHfjUEx02DX4ws/n9SBmVfKL2C9pXv4Be/30=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NvCcdQ+PuwqqrvZEX74dG5gpdZ8hKyxjCYpe/A80a7r4WnVr/Jveiow6KDAw4+d3/
	 77ZPd4gXIQDznRpAR5EHWzMHaLL0vKaciesezMBfBliZ4w8sDBPQ029wSu1B4EXejn
	 4uesQr5FNgfYWA37arwGS75ni4M5lgBOCD/ppzXbibVArnVqZGdS2rvUOcXrjRfaa+
	 XhfBrRKnBjg13HOfmErJiIPwsnwOEb5MLpa7NVriYUuK31W5Ye8mDmYTPq4JaOigGs
	 f/oqxZp2FyHB8kGd7iyfqgqnqhphzULAuDO2OLh+p0lRFLS9ecXJbX35Oq2dbxiWJI
	 xf+Blq6IACMqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B45EC54BAE;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444723.17402.946682010323317793.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240426105051.1527016-1-sudeep.holla@arm.com>
In-Reply-To: <20240426105051.1527016-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 Apr 2024 11:50:48 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Updates for v6.10
    https://git.kernel.org/soc/soc/c/93f9f5a48943

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


