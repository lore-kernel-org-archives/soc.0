Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D06DC6FA90
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44CC8C4314B; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26821C43147;
	Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996625;
	bh=upZleE3/vEzAowWu5ueVSBlDp2w2sMGb0dx39VBxYsw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SzUbZiKLQF2OIZdNWyWuHzh69tiybxebZcGmVUfp+bLFxuKmjX++sAo7NRGxVWY6/
	 ZXK1xzU4RwQO6/5YPS+wffAYw8YJ4Lm+wJ/Si/IGrXM6unmXsSnIRdFDwUoFNzAOTI
	 6DYfc4YLJVnloiSLyJDi0RMG8sAGzGhVCFPZdwnkvA2J1ipfKZ2Js0cPsATmR6ICgO
	 djX1IYk32H23szEaoDwXxy2RnevcxX830KUwc7CR8JOeg5+ZYP6KjGwFaMrnm9ht9+
	 M8IMyDu5QvoNryl/8AYH1cm+5w3ETDhMfalBX0LRoQRdj0DQBjLEwTdWdRzDEZbWFY
	 jUAK99fV34URA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0DFA6C73FE9;
	Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.1 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299662505.5098.9655726950400940104.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:25 +0000
References: <d80afc20-2745-24a2-ab70-a5a03439bd50@foss.st.com>
In-Reply-To: <d80afc20-2745-24a2-ab70-a5a03439bd50@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Sep 2022 15:38:44 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT updates for v6.1.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.1 #1
    https://git.kernel.org/soc/soc/c/6d243f898181

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


