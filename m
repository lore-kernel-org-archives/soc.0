Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCEAC10F05
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF70FC4339A; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D42CC433CD;
	Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701883050;
	bh=e/Nf4YSeBkZML0GcAU706PLF0McAFlhY+jF0kkn3o30=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=B1TFBlrWSTckLxqFGp1QnHLW/Dwf5y64NBhUuTw+E8pP+4uwtY7HouBN3+YiptS5Z
	 j8xKxpaQg8o6kx5d3JR+H+SXEyBTlyDUQ4OM9C5LvtBcYzePVg8di+zHwcH6V+DZX+
	 YvcbEmeCjX/a8LqhOikF/iQ70PB3Y5AjVSrDyWH44RUGcbUAcV/xMtwxVRZrMicAGJ
	 ewl7qJvziDioarx6aKTczdvRd/wVZ/D2S6StVFTO1A24ZTJlK7dl5rUHGr0JkyZNPR
	 z8cv3RePqLiN2qvthZEh7oWes79Q2r8pfPPaO6edXQbZToQbrsyvAXx8tVEu4aiRso
	 ABvN+bpJnGe/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8266EC395DC;
	Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170188305052.32642.6972435884389456910.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 17:17:30 +0000
References: <cover.1701433485.git.geert+renesas@glider.be>
In-Reply-To: <cover.1701433485.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Dec 2023 13:28:15 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.8.
> 
> It consists of 2 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas ARM defconfig updates for v6.8
    https://git.kernel.org/soc/soc/c/542b667fe9ee
  - [GIT,PULL,2/2] Renesas DTS updates for v6.8
    https://git.kernel.org/soc/soc/c/9ea6b7dfff2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


