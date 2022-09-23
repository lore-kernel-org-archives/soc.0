Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6633BC6FA97
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55E78C43152; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40609C43150;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=HM1WWbTgF2Ol3vFW+9fky3t1Pg6bVSg4tPDKQZB2ck4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RvZ5POP3fsqhm+JYtJV5LakFACgonc/w1NBEQaQLJlcp10x7UKzogPsJHsLxpNzp5
	 T4NY8iRhPjFIRxz07LUH+swlmUSB9k0wYwxRKFe2jQzjWnoIxb8cHsH3yn1n61ex9/
	 BbuH/3FqvZus12ay7NYTAuQzaV7uco3AMy0kslQgZa+c4NnzWk/FwgNLQeteyOdnBe
	 1OWz+8LBjwPluIofSr6mA+sTmx0f/X/w7kwj5EwO3+++Jo0L9xtJZJR//gY939SBQ1
	 G+qjUeFU5MifiE7alEyCNkmYAMCVVNoAPgMXnBUGiAAozKxlUItgufDcyuETmGkR+e
	 OuniYw4YZ/lrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3061FE4D03A;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree changes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002719.3905.12931515408167631890.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:27 +0000
References: <pull-1663587735-853102@atomide.com>
In-Reply-To: <pull-1663587735-853102@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Sep 2022 14:42:37 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree changes for omaps
    https://git.kernel.org/soc/soc/c/79a9059970f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


