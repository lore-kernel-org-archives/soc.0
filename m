Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CB8C433FE
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EE0FC43147; Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7903EC433C1;
	Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668430816;
	bh=kz8p17UOeqsyE1SSIiKyVuZ5SSqpkVuV9cKHxoMtvrg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LrA/TNxscHFPS+nFw23VpO9LXaYS+UnnWhwr2+2DYz+Bn26yEk0sfUACp4ty3uoII
	 TimVLmkAsfHRjLWzHtd8dL5VoaoH6qi5iauM2U/Qqr5mmQ05Af3QMrnbd7+UarRcI6
	 9jyJgd70io/B4wKvCCq015yVMakZebV+jJWXlsp5gjoLBVP0ZZcwDPUMkDS75i3m++
	 ylWqBb3gFizpAf885rY7piA+N3wQkRGZgEgBBXnSiZ/HuN2+NQSgE0tBxnBen2dF9X
	 R0HwSwdRQHwR4wKW2AydN4uXLinvx7Ixz3G5S1xrUVJ5pUALNYQrXIiAbtx2/sso4B
	 4nNv3vA9ccW2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 62B64E50D98;
	Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 fixes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843081640.22003.9413729731479060329.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 13:00:16 +0000
References: <20221110115411.180876-1-claudiu.beznea@microchip.com>
In-Reply-To: <20221110115411.180876-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Nov 2022 13:54:11 +0200 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 fixes for 6.1
    https://git.kernel.org/soc/soc/c/e82b5b63c652

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


