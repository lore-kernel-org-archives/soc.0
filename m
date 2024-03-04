Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF78BC54E55
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A58AAC43142; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EBADC43330;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568697;
	bh=/KPg28DlQPDjUNn8FOd4iZHpsM0IFJnPswQMh887ktw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Se1Tsso10US/2mXGpKkA48siILwjLfd1S38D+At+It3tRiArlPl565thy9wrk0ZyP
	 wyJX1vKTMlIt3TUy7veyX4pSZbQyARGooIE2ZzhsrUxlhAYQDblSIccfD+tzHzUidW
	 zoYvq6NIO8mpAj3qwupx2YXv9gfCVOKxZ9Jjti0pcg73QF/f51uoP9lcBvh3kNhqF8
	 JmsNa8Vh6ggLfi3XT5qVMB2NyHxEBS+eUwrMeixAB6/6zhiSeEVD891Kbx7UB+44C1
	 L6vPkOhI4OtQHVtEi2GNblUkOvXt2+nugWsD+IjCvno0ncO85ESnXX6LNypmsHwQ6M
	 xFn7IVd/sOjHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B6C7D88F8A;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956869743.25915.14284073251652296468.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:11:37 +0000
References: <20240225025205.479589-1-andersson@kernel.org>
In-Reply-To: <20240225025205.479589-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 24 Feb 2024 20:52:04 -0600 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DeviceTree fixes for 6.8
    https://git.kernel.org/soc/soc/c/2bb5a9ac8842

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


