Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10F9C4332F
	for <soc@archiver.kernel.org>; Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA299C433B5; Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9421CC433D6;
	Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665391814;
	bh=882zielWslA/mbDtDzCNOrozTi3K+aO6oug9l1vcxoU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=auV1H2zT2KxF55OLlCBAFv5YqijW15EUYttSHn3kcKEL8giYxOg2WtLN3duAWF71n
	 aV4An5xCryVi7xvRCIY+G21bA619FXwGGUw0FrapayYbbnx27+An7GVQnL50850i90
	 2sBr+DlT4vyERKuOQFbFiQA35wCgaibNeu6Ks3bneIY0+z7amFL2UbFuQsXYn07pgV
	 Sj0cNVUR0BEQF35x2otkKKaceSikVO3LpOrHAVd6WZVLLTq5T8YOFWSm4ve6DE+2v3
	 Jwz8FX5k6WlypA5Bs16wN6Puv48IJI/nCd/usqsaT7JFjas9yfxUiHFmoCm/D8qLsL
	 1ifJAuxMXsxAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76482E50D9B;
	Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: spear6xx: Staticize few definitions
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166539181448.8542.3415498010434523786.git-patchwork-notify@kernel.org>
Date: Mon, 10 Oct 2022 08:50:14 +0000
References: <bd3872ce5125477ea80b1131ad9a34c98aa1a796.1665375018.git.viresh.kumar@linaro.org>
In-Reply-To: <bd3872ce5125477ea80b1131ad9a34c98aa1a796.1665375018.git.viresh.kumar@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Oct 2022 09:41:07 +0530 you wrote:
> Fix warnings with clang like:
> 
> arch/arm/mach-spear/spear6xx.c:365:13: warning: no previous prototype for function 'spear6xx_map_io' [-Wmissing-prototypes]
> 
> by making few definitions static.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: spear6xx: Staticize few definitions
    https://git.kernel.org/soc/soc/c/390ca5bca7cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


