Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D68C6FA94
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A36FC4314F; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54AFAC43148;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944728;
	bh=UsxrPPTQC/ILPrge8E2KCw1YNlPvlncR4zbwa/1rKvQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CFpATVwHxBSkIdzwJEAtCFyCGhMrgS7cADl6L72wVCSC/uTAjiRTbLdNvyIs9X4hR
	 XXoJyYuk/gGz9YYxwb3wwR9T1r8/A5WrJSv49Ifl51ZhE04WXP21AoR1BSeVSr21y4
	 twwfHtkwtdAD4fjfQFbRl8qnOzm06hl3XfEBCNHjsVmHlr/rBu5Ysd0CpL1aJUuYF3
	 trAnyPuNxtskUmLnz24RqdStLAN8Hbnqmh3FKLsmNX1uVphPATfEsigiV7C3Mzr5dz
	 sE8aJHnA3/RexEh5t/Y1q+wFyy2xwWOHXdTPQhTB2JJ7RnrZ6HNjF/jL2eim/Ce0/U
	 lt/TwGc5I8ETQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3E3EBE4D03F;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DTS updates for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394472825.12526.15148656299422076821.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:52:08 +0000
References: <20220921234854.1343238-1-andersson@kernel.org>
In-Reply-To: <20220921234854.1343238-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Sep 2022 18:48:54 -0500 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DTS updates for 6.1
    https://git.kernel.org/soc/soc/c/6972b275fedc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


