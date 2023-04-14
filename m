Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00346C7EE25
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4A8CC43327; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF673C4331F;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=G5WdPgpZzt3lKGpFaVr7kVJm3ZV0/2lMYOlVKqon9g8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GoUYz7CfGYl2onBcTBO9xgynKRiXyz35AdW6cYg2Upp1G7PfKWLmGaCB3dzxB5lMQ
	 bSt6ZqnkfV4q2tebon3zuEdE5pagY2YyY2roaLREZIXPFwmOWU3nDRl/4KkJfiBxBb
	 p9TOjs3+lIDOtFDc54kEia2GNyJp9BjlZwf52D/8rQC4TyVyN8141Ky8LPDzt7ZECz
	 KTYVnwGLRt6F2+z9nwcXkPUOPEQPxfD1I9qNvFgba+Z2UI6xYQAMD1r3WMOQvPrurC
	 mATX/DSfEAuHMRHaVy8t+b6Jxvkl1XZ9Q5Irg2kZxJhG5B/ZTkkq06J/yZqYyYBAgT
	 VZcCnBtsOWWjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ACF9EE52441;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926370.30442.3153501751444703650.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <7263df01-aebc-2db5-f074-4805e0ae9fbc@marcan.st>
In-Reply-To: <7263df01-aebc-2db5-f074-4805e0ae9fbc@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Apr 2023 16:18:05 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these DT changes for 6.4.
> 
> For this cycle we have the M2 DT series (which didn't make 6.3) as well as
> minor PCIe disable fixes on the older platforms.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 6.4
    https://git.kernel.org/soc/soc/c/295954fefe2a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


