Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D22C04E69
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51262C433A9; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 261EFC433C9;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=BVTyGVuGEhB9demyGHDOOMIT9Ni6vBM0xyz9SB9jg80=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EgZBAj/Ll9qC3lqWIVqd5Tuni3BM1XqZv6Gu2BM4OULFT9x5frwbaXJb9pEP5Zftt
	 YXx3fRmntf0DSnUBsF/CTx9He3lscZAf0eFvBNkymjKariL6efVESdPeuM4YGOAFLg
	 N/qFWoFHjIi/GKZLLkJSECg2veiwjsS5qZ2HH1zDLghI4E6mvjHzao/cxijzzszwkc
	 0+dTpWhuFcXCv6qPC03heuAaEXd4vnR2zm7r3tBN+nDmGgoFGJQwt7GlfjXeM5Rd4l
	 CuWJFCbmAgsfin9enCtniCS6eCW6dwtf9XXlN+7Jr7fhVmEyJCzRZdFj1JJcFo3moM
	 7RQg6gzmjcc4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0A349E3308D;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Devicetree binding changes for omaps for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168903.30475.4757958438793662508.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <pull-1691658952-110529@atomide.com>
In-Reply-To: <pull-1691658952-110529@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Aug 2023 12:16:50 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Devicetree binding changes for omaps for v6.6
    https://git.kernel.org/soc/soc/c/4e62609005c3
  - [GIT,PULL,2/4] Maintainer file list update for omaps for v6.6
    (no matching commit)
  - [GIT,PULL,3/4] Devicetree changes for omaps for v6.6
    https://git.kernel.org/soc/soc/c/064a805c4aa8
  - [GIT,PULL,4/4] SoC changes for omaps for v6.6
    https://git.kernel.org/soc/soc/c/c0c3bf74242a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


