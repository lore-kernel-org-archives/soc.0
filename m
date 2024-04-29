Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62988C25B75
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54E0EC4AF66; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F6AAC4AF52;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=gt3/9wdcWobnESiK1BREeRAoxtj7NaKC25p9ZHtlAbU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=O6kOpX3Gv7zHKQJUe81DiDuBnHWhm7zjpKW1ZfebV3JjP8LAxht+KjuELPAWNYCkW
	 gr0effc7ZjbXMD/gTXlFNcVb49uSsqmmyx5Gu2EV2ZeY1iAye75XJg8e76xBPScQq4
	 tnrNoSe+jpq/yj6Lb/KFi0k3P7Lbi46OwfNJ5w7MBa+uPQqFnKbVf6mTX679ZTX79x
	 aRzM8lDqdxbEa2ECIGrDSdDn1Z3E2h+sUexCnk60pZ2JIW+7GnbRaXO2TF+RPI9tze
	 rg7XrCpI/Rri7gdS1b2M5ANzm0mN0PwCtDm7T2+Mo9FpjbsARqBRW2AtZ4nJqe5KvG
	 pedYfYXZHwHqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33C17C54BAD;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip ARM64 DT updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888820.20509.17793914822412071258.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <20240429121429.1941241-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240429121429.1941241-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Apr 2024 15:14:29 +0300 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip ARM64 DT updates for v6.10
    https://git.kernel.org/soc/soc/c/cc5dc7e7f930

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


