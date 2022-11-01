Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08841FA3743
	for <soc@archiver.kernel.org>; Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAEAAC433C1; Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5226C433D7;
	Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302217;
	bh=ksRmSxePIwf5DuddV6UFPhNKsIhlggSjv15TBbJJnio=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=l8yLtzK+PSBchtvEbjBKJe7YstSAvhBb7tbGoHprtjO6VK/rP8gyRgmXdRL17Ky7D
	 EcVqgTJCEw0Oq/Cg2+RIMzviwIVqBeV4hHSbLNlb0SZB0Hn2ploNNpkBty1fbgw3OG
	 UCqpbzH9mutH/TR9XzgzE8w5bbeGjzBwcyrLTUJuRXw6YPyoCgKVoDsaRzMuya2iEY
	 wgZ/VLQtETu1cZhIiUNA4EJg5Xg+nEvafoik7h3ZakhqyAHTiwod+ut9+s8alkijt2
	 ouu5Fnn9Yz1YxodQ8369CE16+1bg8Om9aLNMYoi8pIKJqoaw0Quqo9Lu3SEkIwYxc/
	 ws8HVkhHS/r4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98CD1E270D5;
	Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166730221762.4100.7734717451617725552.git-patchwork-notify@kernel.org>
Date: Tue, 01 Nov 2022 11:30:17 +0000
References: <20221101031547.GB125525@dragon>
In-Reply-To: <20221101031547.GB125525@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 1 Nov 2022 11:15:47 +0800 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.1
    https://git.kernel.org/soc/soc/c/c872f6ce2212

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


