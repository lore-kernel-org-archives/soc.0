Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1953DC61DA4
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 16:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF67DC433A4; Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C95E6C4339B;
	Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675097417;
	bh=u50Cvy2wCaxF1EqcgZseTRb/SRIJEDwlsocS5LE0/KE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rkLqcsT2vav5qWZIX9s6eTVBxMCTE2KFcBKi0lcYwxri0B6KEa60M/6I5e16UWwg9
	 u3dMMepByDeDWrN9aXMoka9fKGE1VHuUq/zxoq9f5K0tu9Zut/KGBtw66AVGNBA7dh
	 Ec/knk+DJseqiVpWdXC7BwJI3QzZmNwBbhNjysajLisPdGIDHTeskNhkI6hYfMJ13+
	 J38PprXHdRjoTZmroXzDQMabPu/7zz5h0j5M27lByl3dQVzWSwsLfqYHSoOrcBtK0b
	 8lEjkbzL1SMrMl69/WXuhLpStyUQitCcA54Up/o2J0e/ccLxRoUPEOuNFG8cC1utE+
	 CUmTfq6SdAQ9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5FE1C04E36;
	Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner drivers fixes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167509741767.16068.6673929981986051858.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 16:50:17 +0000
References: <Y9RWcDdO0nj98KVj@jernej-laptop>
In-Reply-To: <Y9RWcDdO0nj98KVj@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 Jan 2023 23:55:44 +0100 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.2-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner drivers fixes for 6.2
    https://git.kernel.org/soc/soc/c/a6e6ceb28a26

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


