Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB13ECAAD8
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77149C43143; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61BA4C433C1;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944667;
	bh=hzgV5Lxv26lMN9c/3+NOndLCYdBhxZndwRzBoJw7JKc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=p+RlfyzcDErcdfIdZyb6DIu5NXxB1byL66txoWVop97tvhzhHBUWOP/Zprw4NAQiD
	 vUUcXF7oakvg5q1u0hPigmQdmHyr5SSdg6HcaQn8x00INtQd3O5k6KYRGcLyXjvgp8
	 sLHKyulqZYiQQXhHxEIzp+30L8BeL1LTUMZlc+OV0Ozx2O9L7+bpoAuZwaBe+GYQWE
	 yVBnh7AaoLbDRaptvD+eUyCQX+AKvSGbzsVO2hEPju11ork7isItbbKog9QSSJ8wW1
	 SxC003RwBJzv5tXPmFPfpdArnvEO7eYQ1lJKiUNzusrk98S9bk8j2TPQhOKtHEIVFC
	 JbyZqqHT3CjdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 43D23E4D03F;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner drivers fixes for 6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394466727.12526.6819785463236237534.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:51:07 +0000
References: <YyeN0m78+m9nNEah@kista.localdomain>
In-Reply-To: <YyeN0m78+m9nNEah@kista.localdomain>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Sep 2022 23:29:54 +0200 you wrote:
> Hi!
> 
> Please pull following driver fixes for 6.0.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner drivers fixes for 6.0
    https://git.kernel.org/soc/soc/c/7e1e2acb7b16

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


