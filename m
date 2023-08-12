Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18D4C05051
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EBAFC433BA; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77911C43215;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=r4y2u0BgRnUg3H0ubQhDWWnxVpzaEbdPiK6gGY3DvLg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AZ6aXWc1bW0ZcmJcR2ZyHsVKbIGWr+gIFupAohTiJXj01H9RLq32ILs6L/TNUryMv
	 ER9DX/JBNi/dFuQkSAh8bJG3R2vppIoPt76MbEB8D2fjGYaNzjzT6qBxlJ3pckTF3R
	 7D5vgn6iqatWSsT6dr3hvMfxvbJ6dHQZs/SjR+OiEy0EEsOgROw8AcOOpEVp5TVHjn
	 t848poi6OGwd0GJZILhzOpovv8dBjaJhdo66q2W36bGmgUoEuhIKD5VNRfyafb61cO
	 l5y7tKEgagvhuENCBVDNYFrjSW2+400lWid2pA2uQbg1qgH4tAzZQ9Yd6NbkuVyDT0
	 4PA2lNE2h+q0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67A18E3308E;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168942.30475.12770206657271510649.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <fde6d7b4-c751-219d-3ec5-04e5bad2aa17@monstr.eu>
In-Reply-To: <fde6d7b4-c751-219d-3ec5-04e5bad2aa17@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Aug 2023 13:22:32 +0200 you wrote:
> Hi,
> 
> please pull these changes to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for v6.6
    https://git.kernel.org/soc/soc/c/e5963e159655

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


