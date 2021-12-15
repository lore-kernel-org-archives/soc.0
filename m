Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8893FC4332F
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54F01C3460B; Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DC53C34607;
	Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639581010;
	bh=4IgIFxcZ2CZav0IJ39brAApc7FMsX+gtSm8V8MMVe6M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iDkxM6J+9B5D6BreZSsWnNfu+QyW1B/dpYGYLoW9f+GKGP3EUPtcqg09FkFKe9F4I
	 Qf/IPRiwglWNh0N8SdZE7OmDQxT3ez/89kCU7nj58sbPnhUJ311Qji7zoE87LOdrG5
	 my+/6vdrwvMWgyBXTy7Yb+Ooiwd4G2eeTFzTck1BiB3jh/95KoBg2wX2NhU8lIVvAn
	 h/bOz0XTTmCrU7VFYNDDsJxdRaN33pOAlMYE1Fz1fOjAyQhE4trTMqTg9stCYtVERu
	 CS8lem0xAVt36jshzIN20hrDzmesQTft0TcTebb2R1UX9DirZackthG4cNqCL6e/2/
	 jXqdU0P3G4k2g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 187C160984;
	Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC PMGR driver updates for 5.17 (v2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163958101009.23013.15218914930037738713.git-patchwork-notify@kernel.org>
Date: Wed, 15 Dec 2021 15:10:10 +0000
References: <660f6f7f-0857-b54c-c415-79bcb93f0e02@marcan.st>
In-Reply-To: <660f6f7f-0857-b54c-c415-79bcb93f0e02@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Dec 2021 23:49:19 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these additional fixes for the PMGR driver for 5.17.
> 
> This just adds a new feature needed for DCP devices, and disables module
> builds which were broken anyway (and didn't make much sense; thanks to
> the kernel test robot for catching that one!)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC PMGR driver updates for 5.17 (v2)
    https://git.kernel.org/soc/soc/c/d9bd3e9aca67

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


