Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C840C41513
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87E85C433C7; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71866C433C8;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=T8sJMbA9Yck4X40xL6PTPnsR6757hIim0ZIWX4GLmPs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rAtGQ756dq7+AobgNQcUrHRnC0D21Z9NX2GPJoe492Do+bphD2lScTklE04A685GO
	 sSKIc52jG5uINgr7UJXFLfvoQ8mxldFu0u+KQSfGrg4vZMJ2pjSYROyfxfsXHulL8R
	 hTKurZaC1a2hdXGIjXMvtzim1IxPPO5jyOVnBIuiK84A/vnvOw8nuzyHa9MZ0YJH8F
	 qesA4ebVsEckloU7yiR4R6AB/K5fuciC58CEqx7mi1BtcPxrkHLq7AteknNXRM0qnI
	 9ofPNi9jHf2SZhlT5JhAzhVPN2Gl4rY0u4DiQnWJg7K80bGGwFQrWOQ3uf3kAnuHdr
	 OMGBRoimb+WWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E28CC3274B;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562738.32343.11023365224795425057.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <cover.1690545139.git.geert+renesas@glider.be>
In-Reply-To: <cover.1690545139.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 28 Jul 2023 13:56:59 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.5.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.6
    https://git.kernel.org/soc/soc/c/75f27cbab58d
  - [GIT,PULL,2/3] Renesas ARM SoC updates for v6.6
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v6.6
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


