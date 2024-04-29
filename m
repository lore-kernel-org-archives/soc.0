Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F065C25B77
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 658C2C4DDE2; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F6B0C4AF54;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=/NsiSepPy2dqtWIwAP9bNLiIDwRWIFLc5/SgKhOis/Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=j/JdflLD9X3EoyryeHwwcfLuBzLYamYTVdfh0CsdbW0qlyRt939iPz1QP82HzOjsZ
	 M/NH7+TT7TCxlLSffQZjMLboo6SlP1nhYAKmBhmzncx0ChqrzG7D3EV51UnNRoyDMK
	 FFxFCdSky627rP+271xS/uT8qJ8tn3Pd10rPUQcU+SnkG8oQ1xhQTT12S4AOXZA3tk
	 zyrMcDyRnuULS9WPtQz2nXsSufO4YO+hS6w7Yhx9+SS6fVHJ4iFslU2ngKArjU4mM4
	 RTf83z2f/D+D0liCPR1d+4Yu3bwRAv+3Fjeu7tWyidmbx8imFI4VviTyXmjMrhNKrH
	 sd/vWDmNNjhKg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44F02C54BAE;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888827.20509.4918234735290335482.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <662A4115.9020805@hisilicon.com>
In-Reply-To: <662A4115.9020805@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 19:40:05 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v6.10
    https://git.kernel.org/soc/soc/c/405a7cd98697

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


