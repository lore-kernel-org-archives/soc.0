Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABCFC77B75
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4DA53C43323; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38308C4331D;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619284;
	bh=bVUAldohEOgavgkHfjFXA353Q5gE96By/UB2t2Va5Jo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dr4viydTowGJSWtzLx/XMMEB8JEMYEJJ75DD5fiNvEwxjSnFsYXrhutW5QbLR4fjr
	 qrqjV2bfaOC4bhxLX0Nn1ErSH3bpxLopnQ17cSqcPu/lVAAjHTyaTiOyCkCBDeQFst
	 cgkE5jH6UlLQUmNDC/O/9M5o+KoV0ZzuFDW01IVA8Zb/CJnIh7sqOU+dqs3k2EOVpl
	 KEMrFFNYhUtfjkVCCjpjdzdzIosJP6Fakf7itYcZpmjM5Pr2aa16m+WYEPxFCP1LjJ
	 ZIjrxXvK8by6fAsIkxjEkbcDoSqEId+GOF0DMsW1P9xgz/He0k8m4JbkOAX9ZsXdjt
	 BVvmb8HO8oWxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2450BC41671;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Clean-up for omap1 for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928414.17322.4566537320672562223.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:24 +0000
References: <pull-1680180485-415954@atomide.com>
In-Reply-To: <pull-1680180485-415954@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Mar 2023 15:48:19 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Clean-up for omap1 for v6.4
    https://git.kernel.org/soc/soc/c/c00574bb43cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


