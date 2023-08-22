Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D6AEE49AF
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37431C433AB; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20103C433D9;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=7YSFB3jhcroxgvqoI4sHlS8BVVlZnRYKFt4L3dx/qrA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IdU5fvDsDUFDTN8iFhla3r6Tyc5jGEe2rsew/j4ZTgvVFUWnPvO7O4Aop0rUJifOl
	 07L88i5pOBDk72eZucZy4/hjeIgGoI4/wHORKl4omQszFSAzHsN5+BqqfSrBwI5Fe+
	 /AbBsi+4ebis9zbOitmK2PYICKXp5aUTHXAHtQ0X7yYV2aFASGYyGHSrNfdKXNxIlX
	 SgbqJgatJRDjrinxbVIqtMscmbTrB72JiiHnikBJQy+0CD5lfA28sUZe+l93aao4/2
	 vOhIZuDScYd2dpBJ5w+S/vnmzez/NP9C71Z/FPvzqRhWusN48bqXrY7FQyAIPBIqL/
	 rtUSfJZxyBehg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03C52E330B1;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.6 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147601.32531.11034308304904153086.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:16 +0000
References: <7414564.rnE6jSC6OK@phil>
In-Reply-To: <7414564.rnE6jSC6OK@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Aug 2023 00:02:54 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> Rockchip changes for for 6.6 .
> 
> As always the 64bit DTS part is the big one, with some new boards and
> yet another lot of added support for rk3588 peripherals.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.6 #1
    https://git.kernel.org/soc/soc/c/b89c940f2a1a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


