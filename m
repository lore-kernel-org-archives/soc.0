Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234A6C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AF75C34100; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01E62C340F9;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311579;
	bh=av96/8w983Vtdm5v838P2cj0Shx9LGQnZJk1VB9exM4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=G/W5xkcP7XICUp2a29ZLB9nvWY6FF4ksGyiptX0w/zYCzBrUATmvb/0oZrhElB49Z
	 60GS95xd7EQ6VU6AE9XGQv9iCbw5CC3u2lzP1XbmbvkFx09d8BQ85zCegp9lAb69Du
	 +VvLlwLGz4WZjRTimvWID+psY4sKcGJMnlxFtV9gUfD+zmuL6D+uk8IuKqfqtRomcG
	 EHzSbIT+tU27vGTKAg+nXA2ud4IULZ3bhnUobt484F8eXXmOC8vNDIdQ9G655FyAIu
	 k7uZHtu4ho5USiXrQt/+uBTngoYJsAQbCI/vKry5RNuNiNbOmt893oNCtYDmyzW4N6
	 h1aFKIlE1T1kw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3F76E6D4A6;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157885.18327.16015600347288474336.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
References: <20220129073150.GZ4686@dragon>
In-Reply-To: <20220129073150.GZ4686@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 29 Jan 2022 15:31:50 +0800 you wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.17
    https://git.kernel.org/soc/soc/c/f8d1fc05e288

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


