Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD31FC54E58
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 891E8C433B1; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D0BAC433C7;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568697;
	bh=4xTDsMXE3hzrPcSMPZsZqtiRaj+mTe400v88U70IYiI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Gv8/AIHvxNEeX33LlJ76l1XKbCmltEotczi5xXETR22HsIosT1JUy2bye3TD7ncu9
	 grJhjKq/RwO2U6VryKk8RpCo1VUlIrM7nRjDTh8aUxnf1EMs6hs5ZqfUERxwoDnVvG
	 jOGE/kyncxuk0k+dPxbj2DlI8a9W76bhDPtRJ8D7tqeIKuOgVOmJPB7o/syg6UadYf
	 Od6/pBrZr9o20XSDgOzgd5yJGsdOHKfSpD9xfbreuFh5YwFBgeDQ3FNFfN2kG01evb
	 NMG3+g/pnVHGBh3n3G5t8w2RRuYqklZ1i6KwDi6keGVJvl2pFghKtAUAn64r/fsERK
	 gX1m0ON/STY7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56335D88F89;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956869734.25915.7339430526308723358.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:11:37 +0000
References: <20240226144536.1525704-1-thierry.reding@gmail.com>
In-Reply-To: <20240226144536.1525704-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Feb 2024 15:45:35 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:
> 
>   Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: tegra: Device tree fixes for v6.8
    https://git.kernel.org/soc/soc/c/35edcf68a999

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


