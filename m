Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5227C54E5A
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3870C4166A; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB216C43330;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=SL/jb2VE3xumbCZZH7C2q3mFUtowBmBBjJehL9+Hwsw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=D0iQFgCizE2NCaw0BRiFhBIGjinXf8tjvxdssRtAkKZREEeUoM3OfnN5t9CAopmUT
	 vZ2N7JSbCmWypC88QoVNBMa6ob0yCvMltLkcoIINd01Medw0PnGnLjDb8oSzlibr3j
	 ABSBu64NUAl2gYjOntP4U6jjwtN/xzslQ+b0d2qZnBiMFXA/azJgJ/4gzFhwIArUQ0
	 aaECKiesGUwh7dV0cNLrprMAgaePt+uRirRD4De0eCXRw/QzeMRxkBuXhxY6KWMd7c
	 T6Ig08Q1sKtzfHQSu4qAb2jeBqbP8wMeQThbZlMbrOAijvirG57SQ4QrbymxeewSxl
	 DOsqtQQSeaZtA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 817FFD990A8;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.9 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612952.13542.2516408421425352236.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
References: <3622360.hdfAi7Kttb@diego>
In-Reply-To: <3622360.hdfAi7Kttb@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 23:57:43 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> Rockchip changes for for 6.9 .
> 
> Some new boards, some new peripherals, nothing really stands out.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.9 #1
    https://git.kernel.org/soc/soc/c/34eb16dedb9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


