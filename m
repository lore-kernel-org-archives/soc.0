Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B64BC54E5D
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70EC8C4167E; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59855C43143;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=DuVp0Muzxb/szrp1VBDbHaWwZziZUxKADZb7OTRSTMo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MsjImBA0jKFafJYh/J8lg7fi8br6/dI1yzZQmiWylOpdr8SOMGvmj8934RaUJkuZ0
	 /i7XoDKj77PqjCmfBeXWcxySEVavAi0uBLHJxJ2Z5qDJBzwJwkjO4m+DEVGo5oor/d
	 K/6db1QJT6IIS2rSpiauceyYEHtLARSmBKZy8edyMt1INgv/gcBzF+Qn0+cxY/2l9b
	 edPny/1D6DM1CzYMhFjwB3Tn1hDLaAXeF8If6gIMDjp5FGCERe1sw4C4l1un9q2G3g
	 2yHv8NAtOu5188uKyiZZeGvuOyHOTYYhRdKkY8Ld4oqVy9p4pXrvGZGOW4X2fyWp5Q
	 hViCcAB4kSgOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 47253D9A4BB;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Driver change for ti-sysc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872028.25915.9976774568842045244.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <pull-1709194472-263643@atomide.com>
In-Reply-To: <pull-1709194472-263643@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 29 Feb 2024 10:14:44 +0200 you wrote:
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
  - [GIT,PULL] Driver change for ti-sysc
    https://git.kernel.org/soc/soc/c/9398cee5d87c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


