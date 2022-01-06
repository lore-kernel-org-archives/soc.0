Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5CBC4332F
	for <soc@archiver.kernel.org>; Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8604CC36AE3; Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F384C36AF2;
	Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641498029;
	bh=DfarofmFgaPYmqKMxVegNTSxM/MQNU8eoQ/Ehh3HDIU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h/K1rQylHqudgyLMiBUyn3lNibLNkFio+AXUTfcdS2y0ylycVRu7BLK31h9ke/x5h
	 VNVeXgTJXmyHUJS47B+dugMW0aQ82NNvzRsG7BRfIAo+9tRWyW868+uR2wK0sjo6QX
	 3B2SMJ2g1E0g8Is5Q8Ym4HhwwiuwVx2NgQ4CxxoVw5sYw7X9cvopiwCDsY062d29St
	 lBujZuHF7mGJwZoxmLj70wGSYuu/pBLZxID52mDlLtLaLjLgNE565+aid48uIib+XP
	 7GBgNf4qrghGMeKhSkARr+sr/VtSKRfVE20L6JdY5rSmdKD7fdfQp0yvAh+KE1gej4
	 3qru2WFdMm7jw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50CAFF7940B;
	Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.16, part 4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164149802932.26637.13022206345433264306.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jan 2022 19:40:29 +0000
References: <CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com>
In-Reply-To: <CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 23 Dec 2021 12:30:53 +0100 you wrote:
> The following changes since commit 2585cf9dfaaddf00b069673f27bb3f8530e2039c:
> 
>   Linux 5.16-rc5 (2021-12-12 14:53:01 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/arm-fixes-5.16-4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for 5.16, part 4
    https://git.kernel.org/soc/soc/c/c8cc50a98e4f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


