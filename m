Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22319CDB484
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06B1FC433A9; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3196C43395;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580027;
	bh=2y1t0wqdzOYVxYXUUxsPJ/utxTKp3Aku67XtWScQ/j4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cexGrcWI8end/Ea5wTdwDbVa4wrPFH8eaRPs8Ry8YlaJ6p+dKaqkmmuUmBhQadkDb
	 dNIrqPE374necrtXCtLnBiiqyTzDMO2brFavDkDZ0MfoqLWorXhdmD3AWHaPRr77GR
	 0sAT+UGAZy5ADXB4kccmeOdmuiA9lMO74dTaSVXBAHGxDhJa6W0PVhpHH55nYnB/Cy
	 RY5HBK4FbF4SvkoRcW/0Zq1x7cdDQAPIHqrp567E8hDDcQRAlKNqNHV+l00bKeLDTb
	 e/4d6SKtrhbgjo6qZMGZpKZgzyjYXMWuOa0XQUuMqqveWlHcE1h+/W0avjxCexKG5b
	 ndieI4HSEKkdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0808C73FE2;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002778.24805.18406367495952798764.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 22:00:27 +0000
References: <1965242.usQuhbGJ8B@phil>
In-Reply-To: <1965242.usQuhbGJ8B@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 23:21:54 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.6
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.6
    https://git.kernel.org/soc/soc/c/5e8a5e895a20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


