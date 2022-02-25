Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53679C4321E
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35F26C340FD; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20649C340FB;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=vFo7Xwj6sOnyHvnIZLla4d2FLf/8PN+MYJ1R3N8WKb8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Kg2/Kum4cVQc8OwNum3y/mcKw6R7aqSr0b3ibXOPQ8Ri1J6VWLoxD9EJv/4fgR7Fk
	 UYaHeZkIkUN6ohsCqQUvhEP0d9/JQ5dZuYeMbFIqoct72l192tJGqQYfynQE3/ZxQO
	 mgO5lkEpXBbgwSbfs2RH2rH5smH5biBgTAj8g2ECBt2kVOO5h7wgAVfSrg7FKSt989
	 QOaHPSSxtwnbXoDrcCZpBHu+8Gs1uwdIjC8dDOrJNn1giMgyaUjYpYvJLtujTpp/ap
	 W0yac1aKTOgOoPMNv2ydgQLAORRii1bhzJPagrbTUGAs+1k8Yr8z6wk0BhYGm9BeQW
	 OGogKqNb+V1TQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09296EAC09C;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 5.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966303.15608.6247429396992314881.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <9977257.a15B8eIVjX@phil>
In-Reply-To: <9977257.a15B8eIVjX@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 00:20:26 +0100 you wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-drivers-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 5.18 #1
    https://git.kernel.org/soc/soc/c/581a1f8c9a32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


