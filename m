Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B7EC3DA56
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D4F1C4AF54; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07E23C4AF1D;
	Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451508;
	bh=P8ybdV/JoK6GVCuxBtrvDvg4UP403x3rI/khFOKaRto=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LBVwYyp+0wF1yN2ggXmZFu0umRCZyB65ktUxgfVX5wOeGpZTkxkZfQ1090nSAcrU1
	 p0ZZH+W3q2wnMF7vjytXHDZqVAg+Je5GjiIF3w6027Fqtkuu/zDh0mM+c3pOT52FRj
	 3XcY6hzGnNQosaaQXSMtM0riz1HoM4KHpBr8bSls1rLQmPhhlROBzQU8RQMHqd999h
	 01KDdelrOUjRbRrpU185fbEFvaYsumdkAxV6I4SiQorCXDlXNC2uDzaDd4j3nBTcqD
	 t6H0qI6DBWMcQWrWwEbW2UXb3+Qr8Fxx1vGF5qmcMznZSxkQeD3cQ62liRh3zXhONW
	 JvG551fPJ1GBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F3323DF3718;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 devicetree updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150799.17395.7225669655368615771.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <37f251a1-f3bd-402f-ab22-cf786c3871d7@ti.com>
In-Reply-To: <37f251a1-f3bd-402f-ab22-cf786c3871d7@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 5 Jul 2024 20:41:13 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.11
    https://git.kernel.org/soc/soc/c/b4f8192afb40
  - [GIT,PULL,2/2] arm64: defconfig: Updates for v6.11 for TI K3 platforms
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


