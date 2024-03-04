Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2F7C54E64
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4E3DC41630; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F3A3C4160E;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=jKjEfj/JnC5N6dhifBTY0d6IBaLaGoWuLAJ6w1Wpf08=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TRYK2IUA1XiQqbehTXenwpG48R11ePBc5K5ss7kKm99SG4+KQz84MbPp+yf5fb8bi
	 heQaARGfW839fcYt4tutcflpgllHt2jnqWYnuKDCP1bIF65D9Qy7Xds0RcEMBOAh/y
	 mon760fFgdg1yUSCrFRvM7l9EyA6Y/dnPkV67B9wrFIAE88u1QEfFBR6EgeXO9km5I
	 LC89ESTVIwPsjrdX7fb3TD5aifEjMMv+eudAs0VVEBhfKqSGoRpV/x8yyuD8ibYSQB
	 PI7AMsTJffUavQVSVJiXQDq8WlKOqi1VdPp/gvW/xuSp5G5aRratrH/t2Ybo+wYDeb
	 +Ea2+M12rF+3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7D513D88F8D;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Kconfig change for omap1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872051.25915.1147771446071775801.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <pull-1709194435-723888@atomide.com>
In-Reply-To: <pull-1709194435-723888@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 29 Feb 2024 10:14:08 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Kconfig change for omap1
    https://git.kernel.org/soc/soc/c/dd0907f31aa3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


