Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC700C6FA9C
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0E0FC43156; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB4B8C43157;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=iVbvZJ21+2S1zqcO6MzcwiBqxnO/GrZ+8yXGgLtqAyI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LSSyfn0067FN9cHj6jRNwtz4M74eY95ZhsXSYR5LsYlEyQxSeH8wxkY3qNICWl0bz
	 ho23t9DjVlLyoRKubLylZhzzCQbD+S0WoyRb3HtFKYXAAHd7G+7eWiJqLRi88sSxiy
	 hHsh6q7xnaKxvHG91QSXa+b8/r7YB/ihCPCYz9xAoMT7GgpzKkGLvMSBM5/5Hu6HP9
	 U54q9PLkgR1O2YmzM7DckgzPHsMamaOhPG8FJlUCgBK0UjyYc+E8bVZTSYRcx5Tt4v
	 PskIYzJHME6lpkUxUU3kTMRNecwLovnr+q/jiwyrHlK01MCj7Su8qrHUKk9u1gg5Q9
	 iOD8MqaBOvCYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B902CE4D021;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: Drop CMDLINE_* dependency on ATAGS
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882975.18494.9739327210734050172.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <09f0619e8038654d01588d9ad3a023485b2bd77f.1664285209.git.geert+renesas@glider.be>
In-Reply-To: <09f0619e8038654d01588d9ad3a023485b2bd77f.1664285209.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 27 Sep 2022 15:28:26 +0200 you wrote:
> On arm32, the configuration options to specify the kernel command line
> type depend on ATAGS.  However, the actual CMDLINE cofiguration option
> does not depend on ATAGS, and the code that handles this is not specific
> to ATAGS (see drivers/of/fdt.c:early_init_dt_scan_chosen()).
> 
> Hence users who desire to override the kernel command line on arm32 must
> enable support for ATAGS, even on a pure-DT system.  Other architectures
> (arm64, loongarch, microblaze, nios2, powerpc, and riscv) do not impose
> such a restriction.
> 
> [...]

Here is the summary with links:
  - ARM: Drop CMDLINE_* dependency on ATAGS
    https://git.kernel.org/soc/soc/c/136f4b1ec7c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


