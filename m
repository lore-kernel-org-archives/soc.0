Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66771C433FE
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E781C385B3; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27428C385A1;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970615;
	bh=QpQ7WSwV9dMrahEFXgcIAFMdJVFNw3s5lAxMfF+Zhbo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=l7cxOtTr8ONGyUF7CSiHwoGelh2BN7koBd5w89wyiPGWhsgpa/qE1tjDQIeIHPuza
	 lCc1yiBccN02WBasA+NMMK46s0qkw4C2ScJD9tOLeL0jaAnH9ZZ6K8yeAePlAHUpug
	 HLhulv6tXzcS0lk096wtJBthVbmhmEOmqHl4NOyu6W8ZzxkIAz7opHGCV8kUAmqKLG
	 v8dE4eNQWd7LEwk2LEnUadM0urBvW130Tg+6Xu0Yn7tX+F/J72NAOV6T2ygs4sKHQ5
	 0I4IhaRZbdfdDoWR/Dl20c3Q7EcfdNAKXBux6UYhexdWoNoNtYN37zQByXZmOVwiW/
	 gfjek9jiqibow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0AD3DE8DD69;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061503.10394.12972569383172615476.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:15 +0000
References: <20220411024301.GH129381@dragon>
In-Reply-To: <20220411024301.GH129381@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Apr 2022 10:43:01 +0800 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.18
    https://git.kernel.org/soc/soc/c/803fa58dfa47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


