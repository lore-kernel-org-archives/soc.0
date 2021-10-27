Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C53C4332F
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 07:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0873F610E5; Wed, 27 Oct 2021 07:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E484F610CB;
	Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635319807;
	bh=IX1otU3xzikPGMKZQOTzIOIrn3UZqZ0PGeQyY2nfQeU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lxkYZXLhONVGA7vfm/PpQQ/EMfCEYlsr24TQhZuqgTFY2orliCQqvJ+zTc5RV+ELa
	 0+PuJD6OKj9aiyb7fS6FmRTlNKsBWZZIBnReNpkRnLajY8a6wmHhCENp83wtFhz7Yj
	 KR9HY4F1MBUvbwG9pV0Ehhi7QoO47Ytb2X4m3D3HSKK7BdVCk8JsMpE9rFsSdtxLGd
	 kGN5rXzzy2i5os196VXhe0sMJhPJyxF4dkXzrEroyK+M2XYKrGDpwErBPn+rNvW7J9
	 qjHZF3JW9jK4OlJPVwcUF0pAurfkgNj63g/x5ltbec8jCgdJe+LwywVotTNXmK2F+P
	 BkgGNSpgD4rvA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D5B7360A47;
	Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] soc/fsl drivers changes for fix(v5.15)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163531980787.3831.14936161311626798283.git-patchwork-notify@kernel.org>
Date: Wed, 27 Oct 2021 07:30:07 +0000
References: <20211026235744.19258-1-leoyang.li@nxp.com>
In-Reply-To: <20211026235744.19258-1-leoyang.li@nxp.com>
To: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 Oct 2021 18:57:44 -0500 you wrote:
> Hi soc maintainers,
> 
> Please merge the following new changes for soc/fsl drivers.
> 
> Regards,
> Leo
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] soc/fsl drivers changes for fix(v5.15)
    https://git.kernel.org/soc/soc/c/76f79231666a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


