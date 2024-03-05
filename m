Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF99C54E5C
	for <soc@archiver.kernel.org>; Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EE08C43399; Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59446C43394;
	Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659229;
	bh=/p50iEqkp0XalzRkrMpAwJ5Rzz2gWXGCX7IYmFd36Rw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iLSWFrbXyj8j0k/3bR9pwQ/lCdj9nxWGkuVtYQsFSD1B3tMUqbnYhVlUENV5we0ys
	 u1Hz4XJPfmqdHzVsclhHm5skY2Z/v24wQsuuEXxBnJ/nYOwtbf3MMPW8JiLqtwvDfn
	 XVccQ8SdWSx9A8ArepDmb6KqywGyMO1LhqPSyZuDTQShGl/sU1FG8huqxDlYS0TaBV
	 aEA7yG1umlFdmQWMmMAXtT8jdCKPlcgCxcjsdxWss64yrdRPEZLuhLzQS6bWcfn25L
	 f7ALnYz/qvwfpUlPa+I21zKt2wCIY+heAoCD976Ke8Ud7isLa7t5Dwqq+Aj622w8Dg
	 jLrCyz0fjcDWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 36F49D84BDE;
	Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: s32c: update MAINTAINERS entry
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170965922921.19661.6097468035299844482.git-patchwork-notify@kernel.org>
Date: Tue, 05 Mar 2024 17:20:29 +0000
References: <20240304204249.936140-1-arnd@kernel.org>
In-Reply-To: <20240304204249.936140-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  4 Mar 2024 21:41:00 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As discussed on the mailing list, Chester is stepping down from being
> the primary maintainer for the s32c platform, and Ghennadi becomes an
> additional reviewer.
> 
> For the moment, there is no full maintainer for s32c, but Shawn is already
> listed as the overall maintainer for 32-bit freescale/nxp platforms
> (except layerscape and qoriq) and agreed to merge s32c patches as they
> come in and are reviewed by the remaining reviewers.
> 
> [...]

Here is the summary with links:
  - ARM: s32c: update MAINTAINERS entry
    https://git.kernel.org/soc/soc/c/98dcb872779f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


