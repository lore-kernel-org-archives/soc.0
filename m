Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7EFC41535
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7ED1CC433CD; Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DF47C433CB;
	Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702588339;
	bh=WrdSEMqcSbTb1Mf5KyvNpdro/Jmcx28c/8noN4g3HdI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YYurPVFkQgqKulmiJbot2iDzdjuNvEQTLOMv9ojbJQ0QWC1I5TFMGM14JbrB0C4dX
	 WJCfXaiLtDeMKiJHoEsYL5UXJ9zZewH1YAhpGCMP+S2BI5ebmNGHq4uEl77pmp9Fte
	 BxBe9vJonLzQa72SQeFtW3GM5wU9EDAcuy+HTCOw+vBLo4dCV7FRmGyad+ZUOjhKv1
	 +x+02yFzQjdYTqRB2pBeMKC+spvPIaLDLrqJg58DaG/YyUsorsIpgAA0pTGKYb2CMr
	 r3WFt1sSfHujEnNure5OUhC/617G/bmqEPAe+ebjyVNMQ6qoqb9OYV8OKQ7XjKOUaP
	 KJNheSEelIxDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B502DD4EF9;
	Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170258833923.10180.18346657634278133578.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 21:12:19 +0000
References: <ZXtVUJ0SG2NRpPG4@archlinux>
In-Reply-To: <ZXtVUJ0SG2NRpPG4@archlinux>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Dec 2023 20:19:44 +0100 you wrote:
> Hi!
> 
> Please pull following DT fixes for 6.7.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.7
    https://git.kernel.org/soc/soc/c/81556f228c0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


