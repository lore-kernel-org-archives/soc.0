Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58965C6FA82
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 080E0C433B5; Fri, 23 Sep 2022 16:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6194C433D7;
	Fri, 23 Sep 2022 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663949414;
	bh=cKdhZnCMKSPE9qk/Eokuyrc4d0HCvjWwFRra6sEtmes=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KSAYpKctuP9fbXQP6/VhpRUxbvCYFJzv7+SGecP12zaKvpG1uAOGbPkBwx89C93RL
	 Z9qq9HwbFoYxMhI/YyfvD2eJuV7H/7V+C+ITppp6GOuYE4xKpox/bJayFxyF7Ylv4l
	 xh8UAIqPF7TERXV8k1I+e27+u8LsnmGN2PEyvqK/T+L1Lp0WGPB17EWYmKskVF8Jb/
	 lzidv0CeFZKCRd7S/syOX/hYaKE/u/plthrop2XJ4gGNJNWRrHuEI18gED/M9EL+EZ
	 g4QyilXlAqH3piFgEbBK0ffF5zmJtcV0v/FH9aa3cUwJLUwhpF8Iv5fMxufL55O31D
	 9xb5F7TIfSB7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C10A1E4D03D;
	Fri, 23 Sep 2022 16:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394941478.29766.14227463495324993646.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:10:14 +0000
References: <20220923143519.41735-1-p.zabel@pengutronix.de>
In-Reply-To: <20220923143519.41735-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Sep 2022 16:35:19 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.0
    https://git.kernel.org/soc/soc/c/2653853e2a2a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


