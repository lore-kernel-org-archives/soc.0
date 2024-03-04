Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9FBC54E55
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49D01C433B1; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 317E0C43399;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=PfNIOZfTKmvD10aCkhU6O2t/zTi0rj4D0RX1PxTmB+E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cuWSUqdMa6/maP60BRUfPj41fpaV4RnI4sAZgJ7slvMNaf8EBnTn22KFXlpvAshnQ
	 MtQJoFe69r/ipAF0sS+6d6hAePONs4JW4w23kunQaoImy23fOSA9a2/mEByuGCn6gD
	 /GRbx/xWz+uD2k4ICEz6GIfQXONBiB91YV6Ppk2tisEWFx+tT6I4z3X6XvQvx6q2N0
	 Ws3YSu1jGqXduHOp6tPAKukYpIsMjrSZkbjqGiRKqEwKTWnIdg9c/K0KDYleOiT7OU
	 IOz3lolqUnNEadtKQMSFRh32scrG1j+hLOtR6CH7WJI4DreeyM8FOcObrgaGadIzCg
	 Qcw+kgNtHzQ7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F6B1D88F8A;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Kerneldoc fixes for omaps for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872012.25915.12051159622223601971.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <pull-1708944095-4485@atomide.com>
In-Reply-To: <pull-1708944095-4485@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Feb 2024 12:42:44 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Kerneldoc fixes for omaps for v6.9
    https://git.kernel.org/soc/soc/c/9cfb800b2631

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


