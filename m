Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF6EC27C46
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4F7EC433AD; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7D6AC43397;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698268828;
	bh=mJYAkHm2ddlXa3sShZqR/lDzw2Se9AhqDX0jFSa8hyI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u65qoMILTLlPJBclt0QBiwDoI3k9DnUWzTnGYkcrSioq1oixtrxrfe4PBY+Z8udCG
	 i43AhHGCJpfsbFC888F3tL5LOStMS1gs8hECZx+5/tk8c1fcG0J9UHD3ZlyZO5DXDB
	 b5LrMlNWSEqcWysGy/2im9nBqpvURkTgi4fOXCgYLEL4/Y5V3U36tGTsH1CUTrih7s
	 KrCUuO4txEPjBqqZ6g/BN2f61WJgW7XZDkLDJ7KFMULgdH1QydANxn6fLepP+TwGiM
	 kARoYakrzBymFtypKpb9g4C4ARP2YI45W3UzBnQg9atyKBMLeYptOS1lb2T5Rxj8wu
	 pUABhBmOSQ35Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 861CCE11F5A;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v6.7 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169826882854.12441.17718256849088888516.git-patchwork-notify@kernel.org>
Date: Wed, 25 Oct 2023 21:20:28 +0000
References: <87zg0e8w4v.fsf@BL-laptop>
In-Reply-To: <87zg0e8w4v.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 19 Oct 2023 17:33:36 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v6.7.
> 
> Gregory
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v6.7 (#1)
    https://git.kernel.org/soc/soc/c/8519f9c3c399

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


