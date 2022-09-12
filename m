Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E28C6FA83
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED7C8C43470; Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5972C433C1;
	Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996624;
	bh=FPR4U50edY4Yn0vhSHAnFI+nRuxjjz9oXdLGtSJgg8s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rdU0Q0gH6n6eZ2op9sTJHgWYNNz4dPFYtqnhcLhom8nhLPAt3xNphFH8Oi31Z2y+2
	 PllvoPxZJiCIVgxghelB9o280b5GA3wQWKzH0K/iBBnDcY4OFcnHI40rpCnIHli0oL
	 NW5Dr6k0EV70T6mPv1sjsHxQhoCiNTWN35UyIZRAsKW9ivV1OOPtIf5Y1LikYpbMre
	 1i34yFwQV+sbOwb2W9fpKDeQQYwyrbFpLOR3MfQRIiTxeRoQKut4WRKs0wkwHrL2Dt
	 cXa24POtuvpBLtzVDqi6Um7espMzue0scxKMzSBLQ2wC0wK7qDdfUMKlWVu8ImfXLK
	 czud12v46jdAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0D31C73FE9;
	Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.1 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299662478.5098.7133039813666893952.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:24 +0000
References: <5600929.DvuYhMxLoT@phil>
In-Reply-To: <5600929.DvuYhMxLoT@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Sep 2022 03:21:16 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in subsequent pull-requests
> Rockchip changes for for 6.1
> 
> As always the 64bit DTS part is the big one.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.1 #1
    https://git.kernel.org/soc/soc/c/b5a88262223b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


