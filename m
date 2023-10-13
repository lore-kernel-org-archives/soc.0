Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6443BCDB486
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5694DC433BD; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40D41C433B6;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=y02e1HEsJT4UOKiKjaPgz55YdtkgHu5XjPPUF7jfdzU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=q2/VHBwabBLzAzCYitaLrykFFs19OVHMTC7oyCq/Z4rXPnYW6uAwY99pWm1O4XWQr
	 ohFGV1b70VjIhGsi4OAe6BquKqfE2jO0IfYyswQYCRwDoU+h+IBxAo35wbHphtcsdX
	 CMygoydVLQ8SRD6DmCzP7YhQenW4SxDHccZZvKmlKeDVLkQIfB5g2SPZZYMDu3XL9J
	 WOVQ+FDvO8EHutAbgpMA1FvGtCn7nbA8z31L9KKnYY8j3DykMNEc7m333ysbRc5rwj
	 hJelxgw2Rb4mmxxo7bZsMDTgf9xi+yiHteQelkfDKM9bJvp/r0pRGCFSfM2aXJtnmQ
	 Qo1kYLcIO60HA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23969E1F675;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083814.14185.18292508712580178245.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:38 +0000
References: <20231013194203.GA2155816@jernej-laptop>
In-Reply-To: <20231013194203.GA2155816@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Oct 2023 21:42:03 +0200 you wrote:
> Hi!
> 
> Please pull following device tree changes for 6.7.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.7
    https://git.kernel.org/soc/soc/c/37d01395d9c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


