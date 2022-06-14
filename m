Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6128ACCA47E
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45979C341C5; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2770EC341C0;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655239034;
	bh=0yOTDHsh7n27A2uW2Ua3JIrYk+1etYosmHLv9zZQeAg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZUn/M6QJ+Fnfwp8aDHyxSsHGkoaMiGGsCYFWIiZm+aeGF45H8VlqrW9UquYHODlOu
	 BCXPSABUegZJiJQnJSDSwxqfi+AbTn69BZUlAwynWOxWYgbrE6+bQOOnYKSlUxPFtp
	 bQyuGJotbhqsfUgfqyRihBZ4DYChaj+nD8tjSkwMmjBCbTTp9kpySxOdShD6mMS5hp
	 StR4+3SJ27OkzxI0btCjz1yPgZyG0tGp/sXfgPe0UYVuAQxPZOPT8FbabppiKHco3H
	 ZTLd5UbiGD3irYMLS+WM7a+bz1XZhQax053Qry/5c8ganfSSM3omDCn2g+Jerp1ort
	 CF21eo8FvoDNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0DDAAE7386C;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom drivers fixes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523903404.29335.7739515321073036149.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:37:14 +0000
References: <20220608093132.1465703-1-f.fainelli@gmail.com>
In-Reply-To: <20220608093132.1465703-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  8 Jun 2022 02:31:31 -0700 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/drivers-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom drivers fixes for 5.19
    https://git.kernel.org/soc/soc/c/11bb764fbf51
  - [GIT,PULL,2/2] Broadcom maintainers fixes for 5.19
    https://git.kernel.org/soc/soc/c/965890425271

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


