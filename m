Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07CAC25B4F
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87579C113CC; Wed,  8 May 2024 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71B17C4AF17;
	Wed,  8 May 2024 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715152830;
	bh=IDYLkrHCW5zkfV2kUfy58J9zHLHB6NDt+X3fdRDbeAQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ogZ8IbTKbXka4t8OTBNyYtOSH7cGfd7Wfq3gdrDArJeiwyfutyex1kyPhDw3sRGQf
	 b2dNGwoNUKAu8eVQQ2eBrr3BGCS3RR9rFPhMee1XFfnd5CVM9JZqIEgxTxT0C7Pt1v
	 eDBhri0myQhHoezNe4icoavjXqIgqURG6NvprcTo6PsQDvG9yzNWIcBwzgZ8rYm73x
	 0LtEKZ73Il0E+pyainP7hv52z5ha1OX4qQQ7fsENUxM9rK66pvs9UP39B3vccn0tst
	 qDbObwj6zEMLJTnZyp+IznRHCWKpwfE6XOcZ1uTtM0hhTdFN9lltcE1/zpvl+FZWmz
	 M62diEWmz2/uw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5201BC43334;
	Wed,  8 May 2024 07:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm driver updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171515283033.32265.4238879209935749940.git-patchwork-notify@kernel.org>
Date: Wed, 08 May 2024 07:20:30 +0000
References: <20240508020900.204413-1-andersson@kernel.org>
In-Reply-To: <20240508020900.204413-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 May 2024 21:08:59 -0500 you wrote:
> The following changes since commit 166db01007ea802ff9933ac73ec8f140ca0cf5d5:
> 
>   soc: qcom: cmd-db: replace deprecated strncpy with strtomem (2024-04-21 12:26:47 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.10-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm driver updates for v6.10
    https://git.kernel.org/soc/soc/c/1c97fe39fbac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


