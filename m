Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77076C433EF
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DA05C385C4; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4797CC385CA;
	Mon,  9 May 2022 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652132437;
	bh=E3YYwfKgQTcEK/mQzemy4p6N73UBrmLMe1QIeJhiACA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TDEBgOsi2yGCf4rQ9vdrE13Jierdqw75dlCH1Cf219p/z6LFulNNkTihhMzMngQUh
	 IFLGt5mMAJTfPRSTBn//vNFo8E3aj8vyTGF5TOlbYNeRdPNVRCDmJd1eVfsvzksKR8
	 KLeMw0yjkam+X1UssixOjJ96euHYLIzu3GLGkH0G+CZbeJ7htee1+eJE8O8xRLgwhd
	 j0YyeUacGCBUOwAOOIWkKWhNetn3qlvaI4aBbVjwc5c2RhsrRBEHfIrl9kfmPB1VhM
	 TMS+6XCbg+a7M3jWW/dyi8E/h0HqBm/TGrtY+Fu6LPBJMMG52r2/0gH3KNQatGfvps
	 em9iACzMRrtkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 198CAF03932;
	Mon,  9 May 2022 21:40:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX dt-bindings update for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165213243710.32686.1634563618873033287.git-patchwork-notify@kernel.org>
Date: Mon, 09 May 2022 21:40:37 +0000
References: <20220508033843.2773685-1-shawnguo@kernel.org>
In-Reply-To: <20220508033843.2773685-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  8 May 2022 11:38:39 +0800 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX dt-bindings update for 5.19
    https://git.kernel.org/soc/soc/c/3d09c0dfd0bc
  - [GIT,PULL,2/5] i.MX drivers update for 5.19
    https://git.kernel.org/soc/soc/c/2b6866d70db1
  - [GIT,PULL,3/5] i.MX ARM device tree update for 5.19
    (no matching commit)
  - [GIT,PULL,4/5] i.MX arm64 device tree update for 5.19
    (no matching commit)
  - [GIT,PULL,5/5] i.MX defconfig update for 5.19
    https://git.kernel.org/soc/soc/c/1758da7f31cb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


