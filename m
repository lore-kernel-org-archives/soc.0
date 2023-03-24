Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9921DC6FD1C
	for <soc@archiver.kernel.org>; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6817AC433A8; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FF37C4339C;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679680822;
	bh=DUKDimESrc9XVqACL7s4W4Gmx0bskh6YAGs/WNINAsU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mkpJC2oYBpdBVO2EMLHscZ40TXb38gX9j5v++xKuHOZriZQQe1AZHKS6+wk2j1hnn
	 iQQmbL4QonTp+wK55rN5zP0tTvwKRiGO5Qgf2BnCuSAbY3a/o/PU4R4FNTKKIlw+M3
	 yfkps/BPMAQJAQOYWOjWA432vi+0TXZv53gJGFDKIqSpdl/vGZFuRxeBbKzgtToXjg
	 Qmr3QgwXFW/2+6BRc4TAuX2NeSC4OU0aMEnCrwNDKe9h0KbOQgCTR/5zaXGrHxnlAk
	 7sTdeHSc4WkzP2lR4N6Rm0N4O0m3rQ9qqyNWxdy/6fwXMLL91R/b2taONlVRh1IpVd
	 TNawB4LF/cujA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 14DA7E2A039;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: mstar: remove unused config MACH_MERCURY
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167968082208.24696.11766846786873864134.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 18:00:22 +0000
References: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 21 Mar 2023 04:38:10 +0100 you wrote:
> Commit 312b62b6610c ("ARM: mstar: Add machine for MStar/Sigmastar Armv7
> SoCs") adds the config MACH_INFINITY and MACH_MERCURY. The MACH_INFINITY
> config is used in the gpio-msc313 driver, but the MACH_MERCURY config is
> never used to configure anything in the kernel tree.
> 
> Remove the unused config MACH_MERCURY.
> 
> [...]

Here is the summary with links:
  - ARM: mstar: remove unused config MACH_MERCURY
    https://git.kernel.org/soc/soc/c/d6053666ef2b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


