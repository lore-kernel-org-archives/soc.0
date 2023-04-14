Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C20AC7EE23
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFFEBC433AC; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9978BC433A7;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=/zdCS0FMYkEYLjDvcmOgsFAroIkbIXzF7g+c3ED5ub4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IoJF+C5VJC/2kcqPzT+AWLmVIZfK4/4+hvCgSRVVhrKnPa47k0mYFoJ6NYKEwV+he
	 rDE9Us/8nABIlS1xAY0B21CtL3HfL+4lmCa4Gcqvc8qDIzFCKMQGSDJlogBEt3JXGf
	 RBk3rWkzsPncMrq4CXwuZBRKkLJo7tHXX2xBL4ZBLSfq1rKOo6hwU1eRFO5Y8aVY49
	 nO2H+2B60zP9WfUIZa5S+TsJsmSrrPc2f62q6zd5/Pho52fpkmYcOwVu6pU1675fVW
	 9GszlEOIymV7P6hnbCBJumtfvmyemdLfYSyjE7KbTwJe+4iVoCPT4kgK0JnLA3J+3Z
	 1/2B1QRLZfLDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 80939E52505;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.4 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926352.30442.10121470906049948799.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <7289562.MhkbZ0Pkbq@phil>
In-Reply-To: <7289562.MhkbZ0Pkbq@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 09 Apr 2023 12:32:32 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in subsequent pull-request
> Rockchip changes for for 6.4
> 
> As always the 64bit DTS part is the big one, with some new boards and
> a lot of added support for rk3588 peripherals.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.4 #1
    https://git.kernel.org/soc/soc/c/ff68e8168563

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


