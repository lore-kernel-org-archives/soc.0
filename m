Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8205AC63704
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E9DAC43153; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31D5CC43148;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=qY2r90MgNNfhxIuxlPZhq8LpaW9gvOHlcJR2YGavm9g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=epujpEi66KO00repItMImA3U/hQG4hDKeRtJPShmawqkKsp5mrOiqbiufWvA1+pam
	 1yzYRnJTLtxe2RuVuBf6Pi4G5meQiAhRcEC86VMUJ3HA/9PLUA6N2VtoBiJSRybgAF
	 bUQ9fqQ7UAsDqqgkJsy6xjdDMo5DK06va9+YJPdMRw9e04oNEgcrOmigJ64k5WViHs
	 soYI5ATK8ciXFRH933eci5uqhmhPYRfjUQtB36jnKUn2PPsS/GJoUa9Qjl8WReObo/
	 Jf0N2xyyMWDghfH8na/dCud4u0OwJQNvsUkCnEZ1HHP+p9oOVXnVKZHSAcMINT8tyq
	 ZxykEWeszvS1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0B9D7E4D00F;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas ARM DT updates for v6.2 (take three)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826204.9936.4843953752308531536.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:02 +0000
References: <cover.1669283381.git.geert+renesas@glider.be>
In-Reply-To: <cover.1669283381.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 24 Nov 2022 10:55:00 +0100 you wrote:
> Hi SoC folks,
> 
> The following changes since commit dcad240c15c10bebdccd1f29f1a44787528f2d76:
> 
>   kbuild: Cleanup DT Overlay intermediate files as appropriate (2022-11-18 14:45:30 -0600)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas ARM DT updates for v6.2 (take three)
    https://git.kernel.org/soc/soc/c/c98ba7817618

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


