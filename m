Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F123C433FE
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 21:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF49CC385B4; Fri,  6 May 2022 21:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6946C385AE;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651871422;
	bh=8mL39spxGTYIfx9j560rdsN7RnRi0ixq47NkLxPoe00=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fhRJ7mvhFvlNLud/vfVrPgZRE7HTx+jYnlLxy3FypiPJhA0ZDO5Hds0SJU3YVyNdY
	 3yjwc07RWXHFK1GUfJD+xbqzkE8nFfgBMcrW92lAlbDKSlHlPltTHqnr5hXOHTmsq2
	 /3XhQBnmf6HFPzs09/vAsRymi09J7mRYBMclANx244J5TmGHg9dsJlB7DLN0M2TDEC
	 Hj0t9z/HJWvKEDLjp7xl6c3ULMcrPeNduXjBLBDPdJNasd0VRBT8jtZD/gXPbsxr21
	 HZtWHL+jQQlyAVuq+1c0gPSuVq/CeoZp7uYXGcdwAhJq829tmfv3jW3HIgDHfO+5tf
	 XmHlLUIUQjF6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD17EF03876;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/5] Renesas SoC updates for v5.19 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165187142270.4183.1404272761664699271.git-patchwork-notify@kernel.org>
Date: Fri, 06 May 2022 21:10:22 +0000
References: <cover.1651828600.git.geert+renesas@glider.be>
In-Reply-To: <cover.1651828600.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 May 2022 11:32:11 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v5.19.
> 
> It consists of five parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] Renesas ARM defconfig updates for v5.19 (take two)
    https://git.kernel.org/soc/soc/c/7a2dc21938cc
  - [GIT,PULL,2/5] Renesas ARM DT updates for v5.19 (take two)
    https://git.kernel.org/soc/soc/c/4a17dc417aad
  - [GIT,PULL,3/5] Renesas ARM SoC updates for v5.19
    https://git.kernel.org/soc/soc/c/48a68a4e7597
  - [GIT,PULL,4/5] Renesas driver updates for v5.19 (take two)
    https://git.kernel.org/soc/soc/c/819ed6f07da0
  - [GIT,PULL,5/5] Renesas DT binding updates for v5.19 (take two)
    https://git.kernel.org/soc/soc/c/50a543372d7c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


