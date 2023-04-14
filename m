Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A60C77B72
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCC7EC4339B; Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A76B5C433D2;
	Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681473619;
	bh=OdUqfwFnl9U9AJcQLpaH4M1PoGIHNfGBk60ztzCdgO0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gjP3JWRoGF1m6Cl5nkhncjU1vJDv0IvJ+kUzce5p/UBOK9qEDXPovbyc4b32nSUmg
	 p2pbTn1QijVagb9R61Qb+WF4Z0Xl67jUY5Kcje7g4g5h4d8ROLbeNx/F7U06x5cM7G
	 8KfB69f/NipFHucgJstXuMIYwh2gOn5Leagh/5R75tjMOk37wbQg+cygINLUQ+4hs/
	 1FzyoCMf1U5d1yq8P+Z9NHk5zfd810odCvr1w8dI8/ds2dSlwoBx4v11qhnpPwELlg
	 PCCyJD9WljkximrZQyP5cEIRb6TUnCA5wLuvQCvMqtajh/n+qxb4SYIYMFLz4/sEdy
	 BDhr7Mx2kMClA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 87D0AE52441;
	Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147361955.16823.8570757137297687719.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 12:00:19 +0000
References: <10559306.CDJkKcVGEf@phil>
In-Reply-To: <10559306.CDJkKcVGEf@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 09 Apr 2023 02:01:14 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.3
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.3
    https://git.kernel.org/soc/soc/c/43950556b767

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


