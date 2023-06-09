Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D89C87FF1
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 250E7C43321; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DA60C43446;
	Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316228;
	bh=5qdfaKpM85dy4WUWySdeAmppSCbVcF3hENJoHFXb7f0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=md8m8qUYTAgRC7fWRQp6GEsNIew5a+bGe8IFENtNBouZZqV/akLgyqcPIHieeYF7p
	 gu7ZfSgBySqx/vm7ODZGl8jYkm8WTwEWbHa5FPwMbV424xNQp/fsxFdbls/WmU5uIR
	 ZucKjrh2/MeH4kqtZmj2NlYcYVvK+l/tYjo9uiNW3NQMS2ySFFEItzSclg+heHmkM+
	 evKVmy5yJAJljk1/UXkN4EFgL0pOqdWVdXT2YNY+EJri+I9nhGSpds2eH83xGJCX9g
	 awfesHapzE6RHNz5c3OBCQzseA6E9U1ipK3hHXw+8SiQYAHvoSoeexVujD3NjhBwpP
	 lXhj0xjwDKTQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EE1CDC395EC;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: Zynq DT changes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622797.816.13103256661785766771.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <c5c99ba2-f004-306c-6251-551826f90df8@amd.com>
In-Reply-To: <c5c99ba2-f004-306c-6251-551826f90df8@amd.com>
To: Michal Simek <michal.simek@amd.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 8 Jun 2023 13:59:07 +0200 you wrote:
> Hi,
> 
> please pull these changes to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: Zynq DT changes for v6.5
    https://git.kernel.org/soc/soc/c/08750aa8beef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


