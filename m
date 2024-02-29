Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40A1C54E4A
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA29BC433B2; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89CDBC43390;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=pK9kRouA4OLWtKDJBJM0pal1Ko7Mn95HfWd94LIsVuI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a65cfsNeUb42btKOxtcF4g0xmJcxNYdwxHTRa7jRkF/81bsa1esuAoHkwSI/aRpBr
	 vAWxcwzcwlAbUqr+DCgwSLveMykG0rhcdLV10GJSkCE4itaib9ms2Ko9cirU41wE82
	 llttjA16wXmwwDtXKBPcMfL3m4Lh/VrzZ8SavfXw43NELGek5PoDoA8he3KmbkYY0D
	 3G0ylg3CUxV41o+DQy8Zy5d08AOhBbf7LrLCyKM9SHIdkF3vXZEdKUQ0Wndsp9Ly7x
	 AcNVT4pASRz08T7nNJs/647hWTLSLWAfXmE0j4Km16ifhesuQpSX8f7u+rFHLg5+zQ
	 AWA7o4Km+fWlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6C62FC3274B;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612943.13542.5224181435342437016.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
References: <cover.1707487826.git.geert+renesas@glider.be>
In-Reply-To: <cover.1707487826.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Feb 2024 17:54:49 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.9.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.9
    (no matching commit)
  - [GIT,PULL,2/4] Renesas driver updates for v6.9
    (no matching commit)
  - [GIT,PULL,3/4] Renesas DT binding updates for v6.9
    https://git.kernel.org/soc/soc/c/6b66ed51cd7b
  - [GIT,PULL,4/4] Renesas DTS updates for v6.9
    https://git.kernel.org/soc/soc/c/466b99ac51ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


