Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD2AC636D6
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1583AC433A1; Mon,  6 Feb 2023 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE4EDC433D2;
	Mon,  6 Feb 2023 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675682418;
	bh=54MveLas/wqhWYBa/qvwhpbbsbLBEeuA35vTHZR8HgY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Z6hei5uznoD5y/4ryzRQ5ajU/yst9z05gPcT2SF8ZMd3GC5pysVIuIVROjhdSy7vU
	 LJzoHxxuVcRQx+gKNbjxfTVz3G6E8np6vVXSWoBCBU5DKCzkM4tKGXt4krwP0UNic7
	 1bOkgNEiROxZlPhhdd+SHZWngz15nMmW0vdU6sIDtxhgTC3yGPEl4YQfViv73taN4o
	 9nNJBJchAhronflQZVyV04qPCZEZn/1sDOPhXpnk++cOhdO+Cux7g7UutGTKO5rJso
	 0xNAPqIIM/Um1tq4OPpY6pEXEJ9cIbPgjJzGJOfp1+6E4PxujnwcoqqPipzAFddeQJ
	 t6bDUw9pE8fNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CEE8BE55EFD;
	Mon,  6 Feb 2023 11:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] samsung: drivers: secoond pull for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167568241783.3898.15184076698892106168.git-patchwork-notify@kernel.org>
Date: Mon, 06 Feb 2023 11:20:17 +0000
References: <20230205144657.951749-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230205144657.951749-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  5 Feb 2023 15:46:57 +0100 you wrote:
> Hi,
> 
> On top of previous pull request.
> 
> The phy patches were acked by phy maintainer and are necessary to fix warning
> in my next/soc branch (already pulled).  That was an ordering issue.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] samsung: drivers: secoond pull for v6.3
    https://git.kernel.org/soc/soc/c/e26f8413cc92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


