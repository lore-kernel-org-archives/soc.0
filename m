Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F755C25B5F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20463C4AF50; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09EB9C4AF1D;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=EOgRijqgi1gstcNamXz0jBMzJQDbIGgIwaSpuQexroY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WcrPOX/ZCC0xk2Oa+M5V9giNu5Qga3ft6rcvMTT08DLNqJHwpb5pbDkytFsXE7XWj
	 c5NLjdPU0CWNe6LYtRr7K2rfDnNLVNWdJDpT8ETR1H8dTePLy5UEMqiulM399pcktH
	 8VAPlabSb5nJ5oToDPfn/imXE0PDq9bj5WrHhzV+7Xj7WMNGtQUSIfRwWu5G4FDpSJ
	 xBLUJT2VaVsacllrxsaaP/7XfUpl/Ae5mdTh/OOq1pSe67JVAXv6VQbaIsNttsaxEm
	 6ulJhUwljydlDw8qfikklsZQxyNqNzR7l6q68Y/8MciK9/YZzKyiwrRFnERx45NmxN
	 lrnxz46KOiFNA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EE5B4C54BAF;
	Mon, 29 Apr 2024 21:00:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Driver changes for ti-sysc for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444697.17402.14720465081534042847.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:46 +0000
References: <pull-1714283210-549557@atomide.com>
In-Reply-To: <pull-1714283210-549557@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 28 Apr 2024 08:47:11 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Driver changes for ti-sysc for v6.10
    https://git.kernel.org/soc/soc/c/75e4eadcf94b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


