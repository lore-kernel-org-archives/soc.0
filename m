Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C55BC25B10
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B656C32786; Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75A13C2BD11;
	Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148531;
	bh=0al8JxcfjDach3FfbOVlIeHvIwSm6b322djoTJ0UBV0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rBWApApKkQchyWR8BXj0mt+E3u3uHzk/gL3z3nSm7DmISpGN6310KpJiIwnA0k18m
	 le0hpWAweM8XoyTci8KQXCCDiD2nMEpTfxC9MWpFmmJtroR2dTOVs2Z2nESlKksf8K
	 DEGruRHvowGXqqa64Tz/ZhPcDG5WZLGDXCAej1D275vgLx6mc6FrSn7H/oR2H5TScY
	 coSyqcroHa9HhiiR68I0DTfKuLIe8XUAtTFLqNuB++pbcEKrWDsGEc+SzpHFG34HHs
	 ddL/33jkRAlhDtnImJcgiJamItdKzRRuXhxhL832yP2grUK0DGoj2sfZY7zj6lKotD
	 5mCquLdpzwVMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D808C32761;
	Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fix for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171414853144.5338.1306656788437347213.git-patchwork-notify@kernel.org>
Date: Fri, 26 Apr 2024 16:22:11 +0000
References: <20240420163816.1133528-1-andersson@kernel.org>
In-Reply-To: <20240420163816.1133528-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 20 Apr 2024 11:38:15 -0500 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fix for v6.9
    https://git.kernel.org/soc/soc/c/14672a9b3ec5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


