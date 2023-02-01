Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52BBC64ED6
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AEDFC433B0; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72798C433A8;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269022;
	bh=lPN7AWtWdEdWgjo7GdMvwbFjxOh9XcDP/I4Opuu73iA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=d6VKx2Rl83M58ERIoOsJ7eakdqGotmA3v0ff8nHTJGVe4lMD5Chf2vZRji2RgAaAb
	 0LyYa7ZQ8OypXEsszSAOyLuQwmbwH3zsMvQdKtIZoBs0DKrVPKt1F/hB7opQMaDbew
	 SQqfHoBYsANRq5QuLo4mmlsZQAjKewUw+L3rJJJEAThvkz85bfGUJx+9+jfKnzTWWQ
	 MA7oiglUQJETHkOkbiIYQkY3EkKi2Ml/hMy+xyY8LqVSueVNeMfr36deC9XKbnR/XG
	 AYQizl6yGD04FapDxyp8NLxbVELprBtXCvBq136sZvpUXo3/6KiC8foBWXynFK7feD
	 BwvsbXLqCskLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4AC04E270D1;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] i.MX drivers change for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526902230.23236.2120782894376887479.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:22 +0000
References: <20230130023947.11780-1-shawnguo@kernel.org>
In-Reply-To: <20230130023947.11780-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Jan 2023 10:39:42 +0800 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] i.MX drivers change for 6.3
    (no matching commit)
  - [GIT,PULL,2/6] i.MX SoC update for 6.3
    https://git.kernel.org/soc/soc/c/ae3147bb301d
  - [GIT,PULL,3/6] i.MX DT bindings update for 6.3
    (no matching commit)
  - [GIT,PULL,4/6] i.MX arm device tree change for 6.3
    (no matching commit)
  - [GIT,PULL,5/6] i.MX arm64 device tree change for 6.3
    (no matching commit)
  - [GIT,PULL,6/6] i.MX defconfig change for 6.3
    https://git.kernel.org/soc/soc/c/f6fae7ab6d9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


