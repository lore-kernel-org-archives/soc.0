Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17168C04FDF
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1BF8C433BD; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB74AC433AB;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=ESrS3o7xQB+6cwAvnbDz1Z5Qw835vXCwZANW6kX07nU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OnqPuMkeKAlfaTaLaEaumV1gu7YQ1Hq8cDQqQay5CFPUC0ZKNo9WVYatQRRt/uW0J
	 41i4VAym3axaBgaM5Dlp2Yckh9D6N65BAGVoz/SWqkGqMDXguUINxN93Ef1ZyJ98K3
	 win6rrRq0sqiksyw41+9e7Tk/pNVcc92Kj612Ov7fJYJ2WoDn8ou+JkMSLeY56+eg7
	 TKF/lbIslsbMdpdwHDRGL5XMuGFd8gTph4eyayBxn2Tp6rzTE6vzy69aLZ4BBrp3Bl
	 0WFXmHAc17kZXMnQEt+D/TMzxUa53rMKEwN+dhqZaGwFyPrGR2cpISkQ1hnTE4VGm/
	 yhWvlnsw8VdFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B78BCE3308D;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] hisilicon: driver updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562774.32343.14579918902777166782.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <64D605DE.2070303@hisilicon.com>
In-Reply-To: <64D605DE.2070303@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Aug 2023 17:56:46 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] hisilicon: driver updates for v6.6
    https://git.kernel.org/soc/soc/c/bb2974ffff00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


