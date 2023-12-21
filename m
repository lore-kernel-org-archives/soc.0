Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4B6C47077
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C502C116B0; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54202C433A9;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=XawQ5h8aSntZWsj8MBxd4NF16EneDAj6aw8nMJjCYsw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sASs298589kJV3VZAjYez4pQ52bVe7QdU12p65VmIc39KxrkVjzKcKn/OgYYYPxq4
	 kKaH04TL/3VBeQIvSM8s3B/IGjEnKw8ltO3836QTuXVFmSuV7ANeA3bse/ZlP/ngbX
	 XOs2VvSV3MBPO/q9nQIHQRvQM2jyd4P39I50cSPy3iFrCBtpXQFMeig20R8tP1wdl2
	 zJ4izDKStgO5an4yipEhP04KNONZ9/fg6LfOlLZnlnMP68je0JvulP4CQ8lu2O+pAm
	 qcNh2rmB6pYOofZmOQKwjVz0/oap/t6IVt/QfpKCK5ep+OIhaokWjufX7YZn2B4tEi
	 0UB2eWBRUovUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41583DD4EFA;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.8 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046626.3302.11862712278272760370.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <9363227b-1c44-4a20-b245-efbbbf9ab1dd@foss.st.com>
In-Reply-To: <9363227b-1c44-4a20-b245-efbbbf9ab1dd@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Dec 2023 11:03:47 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT for v6.8 cycle.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.8 #1
    https://git.kernel.org/soc/soc/c/084d415d219f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


