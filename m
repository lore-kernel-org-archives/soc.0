Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CE9C76195
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47C0DC433AE; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31C68C4339B;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679068354;
	bh=8QT6SQ0XC+4i+S4lFmVVYUER42ei9t/JT0ii4rqbs2w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IJzQQ4ND+xztb/NIwC3BnjxEpceu3IcYxGRg2mGMdj98TIl2NSbwXhvvoq6rxn4x8
	 NcI1UA8tVcS1Bs8sqsKE29i0RpH57PbylgFmr98k0VCr4NW5eFJZ9ermZ95q0Q3eY8
	 p32cVoOQ9O4MVP7HRC4Xn5Bonm34QATDSS8I5sk+sISo+NLz8CUK5fpC7zfs8ykWa0
	 8zPPtDbgZmOBTj9vJy+ufTPU/h2HqX9E8FouD3zeogXhmOVvO5Wordr+tMMcGGVOhN
	 1pxioOwvP8UZcSjb5T43/iGKJTiSk+Frzh1hZdf2sZpGVpBnggmXqKS1FL3fUWCpn0
	 A+SFUx7zlrlFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 142FDE2A03F;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167906835407.32307.8621289565829355576.git-patchwork-notify@kernel.org>
Date: Fri, 17 Mar 2023 15:52:34 +0000
References: <20230315132814.GF143566@dragon>
In-Reply-To: <20230315132814.GF143566@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Mar 2023 21:28:14 +0800 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.3
    https://git.kernel.org/soc/soc/c/38557b2d6d21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


