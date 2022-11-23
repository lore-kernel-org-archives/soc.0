Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81309C4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DD20C4314F; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20660C43148;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204824;
	bh=yKMO7jo8tUtiVXjHQFrzp/zW8uzrwuaNyK7Xcww/Yw8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tGk/57V6Ye1hMtIqxyfEpLU5DB6FprxV4m+djbqrPMqxIUo6c3VdYHvu+xNy9057P
	 //WyqirhkL9bWFiJjYNCX7haumGyIp7awXfdqO/c53FEBgDmsmydN8XCD29kBQFIDW
	 P2eAXBWvLLbRLVIBpy95p7ho3bbKXE4MLrN932+iLnLh5xlC1VFTREWbOvm+9O5dlF
	 VTYVmbNT9RHu31Buxppr5vQPJmKO87zjuD9ioTbAAI299XZ0/8oAyZ1nRXxqHMlgge
	 fB5Xx7NicS5Aw8JdKy+L6099r3vkliCEscaqo+2NpSuD+QOtbro5ZnYd1JUfM3iGPH
	 gx/J7F3tespZw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0505DE21EFD;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: nuvoton: devicetree changes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920482401.7332.5893885808864548986.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:00:24 +0000
References: <CACPK8XffL5_L5D_ZGQid0r4h0wfTc+XBGUO1-0QW7ErPPrrvEQ@mail.gmail.com>
In-Reply-To: <CACPK8XffL5_L5D_ZGQid0r4h0wfTc+XBGUO1-0QW7ErPPrrvEQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Nov 2022 02:30:45 +0000 you wrote:
> Hello soc maintainers,
> 
> Here are the nuvoton device tree changes for v6.2.
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: nuvoton: devicetree changes for 6.2
    https://git.kernel.org/soc/soc/c/62cc4a55fd7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


