Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C044C4345F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08D9CC113CD; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7132C4AF18;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408887;
	bh=7ubP35qjSlCmM/K816Q81q39zpRJiTx8MLA+YBzVijY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XrOhyB4S51rVxams6CifzhStU7lWLg/mIErdunS+dPhPDjcS1ILTu8c69mvLjlESZ
	 xQB32yVb/uwUxN2zq7k2ozgjvaQpeUeXFREzbC5bRR9Vmj/TSvfcEYD19DfvPhXpr1
	 9Ve081iRb3J/W2QocMLrU9QlHRmg9FpsSJ8d3JvEqnPjMk+Low1aB/fCbpKHqR1+3n
	 yh402GI0PGnKQKSzLdj89syFb08UFjVAe+SanSjV09sdTfTX88etpVO8wfJE0EIs1N
	 zaCkbjOT4GEEEf8lP7DtEgkvWKRiWExuk7gSgP+LV1Cicqi06uVoPm3LIXypP88IsO
	 DDGIz0shrJ/WA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0A8EC54BAD;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.10 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888784.20509.6859201120835185021.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:27 +0000
References: <15361932.O9o76ZdvQC@phil>
In-Reply-To: <15361932.O9o76ZdvQC@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 23:45:43 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> Rockchip changes for for 6.10 .
> 
> Some new boards, some new peripherals.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.10 #1
    https://git.kernel.org/soc/soc/c/c7639b7992fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


