Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A586C41513
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0986C4AF0E; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9D1CC32786;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451507;
	bh=DneX6PzUZCCy5ZVgmJF5FUCXglQSei04I56ru3jk5zM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FkEXzncRlbr7xqz1uA8qlgRbs6DoRyuGa41dEWR37HFgWO4pAUBarungi2rfob8IA
	 ysgTvAIFxU9nZzZUgtLmXN0gu67RN2G0K+rPKA7cJ2WnbbRa3bFiAGDfEoGDhu0liI
	 GGGxBPlYh7q8e4H6XbxWnf4UJ/ADUDbVh0VzfKIP3xFQcBn2O2wnOH1abJNVQsLFe2
	 2fM3xQcNtW5Ue/f5vCiV5/Vjum+1Jl8mKYZWVyDFxPgWYjZNvMQvQsZciJTwolKLEG
	 6NexVMBo+iFaXD4H2I4WZ7T1LkzBbxvrnjRj3D0tEdMmJSbP5kA0WmQGs069G3V1Ek
	 5P9ApTWnpuABQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A7CD8DF3714;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Allwinner SoC fixes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150768.17395.16285914831812575381.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <ZoQY5k21RQLOrBQ3@wens.tw>
In-Reply-To: <ZoQY5k21RQLOrBQ3@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 2 Jul 2024 23:12:38 +0800 you wrote:
> Hi SoC maintainers,
> 
> We have one fix for 6.10. Please pull.
> 
> 
> Thanks
> ChenYu
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Allwinner SoC fixes for 6.10
    (no matching commit)
  - [GIT,PULL,2/3] Allwinner SoC driver changes for 6.11
    (no matching commit)
  - [GIT,PULL,3/3] Allwinner SoC device tree changes for 6.11
    https://git.kernel.org/soc/soc/c/9289b97a672d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


