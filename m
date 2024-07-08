Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30A6C41513
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4BF5C4AF11; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F0B3C4AF0D;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468245;
	bh=R/F8Bu7TctTSf27/kVnmaAA+FGA3uryySmvY6k5RKv0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=p8/1a3IDua+LWUUgFa7AvPB/Iunh+VWxp8jy8hMSQVjFCfFkx0eGfcHNtcQXlACX5
	 Xd//YYeu15Q+Ad2m1uF4bHZ2qOi4UN3K9Obept+CK5M4drDs7V+H5R9wJnPb4m442v
	 XZ1akKKzQBfYY/A8UYEuTC9+DJmtUDwsj9JRKdb061bAgPm3ECRjmxZoS4DZTZPgSN
	 Zp/1jyuOfsoOiHNn2dfcK77/uMp/aNM+KTn3a+eBn5lIIDqyqbpYo4l4Shn7+1u/ja
	 Go0rUWoJBO4+BUG90fjoL3QjMSHSS97cV960FYO5LKREwRgyfeu7sJyftoTd3qA4nY
	 MlD4PAu1FfVMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7C89ADF370E;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V defconfig for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172046824550.24660.352138954136533392.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 19:50:45 +0000
References: <20240707-unused-outflank-aa127ccb2cfe@spud>
In-Reply-To: <20240707-unused-outflank-aa127ccb2cfe@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 7 Jul 2024 18:28:38 +0100 you wrote:
> Hey Arnd,
> 
> The 3rd attempt 2 with a fixed $subject.
> 
> Single commit here, I discussed with Palmer about taking these defconfig
> patches for board support etc via the soc tree, so we're gonna try that.
> For now, only one commit here.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V defconfig for v6.11
    https://git.kernel.org/soc/soc/c/43528789a0b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


