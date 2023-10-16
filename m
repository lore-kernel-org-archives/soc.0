Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43833CDB484
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35593C4160E; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D426C433B7;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=6C7IxkqOZsrmI+DEnAC/+64prROsAkHyxYwQEe/EKYo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=irlkMQ69d8lAqGC07p7QTAp8Vf75BgwKWD1EkMyTvxXXNqLzo+LZLC3GdRrj025aD
	 LpnifdwSklPwaUXl4JMhtmvYHZ4CWiV72DBvwZ13M81WyFWxeroH8TDhixgEaUVIBH
	 6dv03TDI1jm60pteQfBxdGW0Myk4tdYb/ZoC/F9ap4OuthAoyPHKL/LuFsl79aim8s
	 z4llF+nyE8nfyQ+E5hzlglCKAqcXS2TVYIqZhgEiAAEJL6r+Q8j5MFKdjJDKYmh7g/
	 ONF0fdlN/CKfMvo9K5/+QZa0mg3t3JLGr8fBf6+GQFh8Dd9//8ZB1oi8L1U/X/c9ar
	 Q0WibEaJiGYww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09F03C04E27;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191803.22284.10597458519957818089.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:58 +0000
References: <20231010124347.1620040-1-sudeep.holla@arm.com>
In-Reply-To: <20231010124347.1620040-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Oct 2023 13:43:47 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Note that this pull request contains changes in the OPP, pmdomain and
> the clock drivers. They have been acked-by the maintainers agreeing to
> take these changes via Arm SoC tree. Also note the OPP changes are merged
> into SCMI using immutable branch shared with OPP tree.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.7
    https://git.kernel.org/soc/soc/c/d1debb7b322c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


