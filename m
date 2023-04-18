Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF6C6FD18
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EA70C4339E; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D832C433EF;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681831220;
	bh=ASJauHu2yf/ZdkNtlmNWN/IZSLUhGqUjyLpMRtpGr3M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oXwRXNVEebgIDAMZrJ0WqObaIvQOsUIYn+BrU1A6wbDNJjzBLCJpk6o7SwO8B6NOz
	 L6gZXI5SVmty8TJxgnjJEzr1MlbTcgEwO586TlbsTdFsJN7m5Mv3duMyYS8ZHRA/wx
	 mC6md48E7R+raluvQy6+E+IU1Y+ZXTPrUcpL3Lyilzo2/cB9gC2UqQFPQcYAE8QCfm
	 kW5dg1tx83GKDnb1kM8Mxv/zF7pMpYNlFZvZKEgBMdkzlPkVPrOs9r4umfSaC/J0bb
	 hHysSgIYnTp1Ebyz4h4EVczIfsgn3TUJmu0kgQCj4U2DqEAxWAF6qC+GHUs+IGopNi
	 HX7WaFOmMjoLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 439B7C40C5E;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm64 for v6.4 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168183122026.6966.7601342230945918394.git-patchwork-notify@kernel.org>
Date: Tue, 18 Apr 2023 15:20:20 +0000
References: <878repzfbp.fsf@BL-laptop>
In-Reply-To: <878repzfbp.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Apr 2023 11:53:46 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for arm64 for mvebu for v6.4.
> 
> Gregory
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm64 for v6.4 (#1)
    https://git.kernel.org/soc/soc/c/bd2c0c4452ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


