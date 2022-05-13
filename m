Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF628C4332F
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95066C36AEB; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FE72C36AE3;
	Fri, 13 May 2022 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652436018;
	bh=SF37JgH/eLJNjvQAf4EMu9zUFllU/1w62Rt72QJ8o0c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rClrbUEzblye1WJGjiYN5eqgzHCKCsvd0uxjuVCD5yzqqzKyttz6KiRDHTxldNYhl
	 bKwzbo39p+Ix1qogdMNIbNcnsYdZsoF1s+HByKslrGZOZriM6/pQTLyyOVNQ1v8yef
	 vKMIHNR3u2vfIGiX5OZ4eHtcnW/mLyRq5AiIfVUDIFIpf8yT+AGLGinAc5ADxeZeVA
	 Lsw5yk+jkZiLNhys52bapVYa+V7hLDeOfPC6w+eRD43S1YXO/8uWhysqbV2K/F2Dfn
	 wx4UWupZk7ZIZgHffgjabXHpxVxwmy5Ip8T94qNPjPX2QFaXjc2bFLUo11lBgTiaRI
	 Pi2Gb1bcgjAVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 60ECEF03938;
	Fri, 13 May 2022 10:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip soc32 changes for 5.19 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165243601839.30999.2964131424594181123.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 10:00:18 +0000
References: <4421093.ElGaqSPkdT@phil>
In-Reply-To: <4421093.ElGaqSPkdT@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 12 May 2022 01:42:24 +0200 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-soc32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip soc32 changes for 5.19 #1
    https://git.kernel.org/soc/soc/c/30258ae65a06

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


