Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522ADC6FA95
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45DE5C43153; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EC7EC4314C;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=6RT1kQ2EKicHeoy7Xhz+WG4KcZPWE8ZRDZhyXoKMGx8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=g/K5jLLPTD7B71VYrWuwsPE5LSmM6iOxT3frZTSiNPXGZvFl/MY6nAopSRZt1dI0p
	 fAs8f1jBD+oULdc0oK1b1O8q3YOkeUHJG6MyzJ649a2RbQC+FvOPjhfbnmmxJ+c+Xf
	 s9BMqkW0dFNiPd5sGCyYV5knNTAQO5TqHDjihaY/LFw+wVDy47/T7HYLCZXuTg4AES
	 YATpStU672g/1v9nX4HsN4Ht+wf84UH4sg1r5GsP1cAj+CQ4DlJigBUum0QTYQdoWP
	 Ej4pR9kRSo9rdB7M4oQwC0Ozjn1WFwhHj+9L7wpmiN7NDx3c3Swzj+GAHLa8GTJO9S
	 HKYhJCtmqZGsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1B985E4D03D;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner drivers changes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002710.3905.15737365829231409414.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:27 +0000
References: <YyeOthH4y8wy8A8R@kista.localdomain>
In-Reply-To: <YyeOthH4y8wy8A8R@kista.localdomain>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Sep 2022 23:33:42 +0200 you wrote:
> Hi!
> 
> Please pull following driver changes for 6.1. Note that this PR is based
> on top of sunxi-drivers-fixes-for-6.0-1.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner drivers changes for 6.1
    https://git.kernel.org/soc/soc/c/891518b71753

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


