Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E0CC77B72
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97152C433D2; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EEB5C4339E;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=gnvnVWPVKu/8uD3/vkRS2bzgSygotZcFiTauQGeK1Mw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Vn0eitC0iHKQeDo0EW3loE6+oKtc+Cprei+nvPFT96918ElNHNQfvkf9k/JymhfPQ
	 gEpmMKg731UAj6sVbl/ug9cAdXzq74d0nbZwLK8UwXGl8o5UvmVJ8Lq0b4w1zfEaB3
	 4WXXDMlrgB8PMXqYw3sjqQUaGz/2bTpaYqAgOy0wdsPAGITYoPP4omyt0FqVuoAKr6
	 n4iQPxSWsnHpJyERuK8MW6L64NWvAk16YulpiTQzF/K+YtornEM5wcvXE+l2p/1hIR
	 5WLUd3sPFFwcZslzHyI3+Ge2Zp3rXNUj7WsoIURz9CAg3TrdA4bOE0qnbzHuxDoT7j
	 Uc1dzqtpX6vyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57586E52446;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner drivers changes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783035.23940.15452437343875739464.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230408125255.GA17134@jernej-laptop>
In-Reply-To: <20230408125255.GA17134@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 8 Apr 2023 14:52:55 +0200 you wrote:
> Hi!
> 
> Please pull following driver changes for 6.4.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner drivers changes for 6.4
    https://git.kernel.org/soc/soc/c/e15a70922f6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


