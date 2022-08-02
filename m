Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67EAC19F2D
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6491CC433D6; Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47CA2C433C1;
	Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659450031;
	bh=tLTulxJuZTwITaYpeSrBxV6lzBLp/Ms8O1PKl6mSsOQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=e5URg3s+dt2Mg267Sky90C4UVfX6BpDK/41pttXPM8ndU1jwoiOQBnp+bhr9GYft2
	 K9L3S3Gv9YRJ2zTDLyrnCWsIPxnaBqDDG+u2Bez+WbQ/iP8hJyMs0CUTADk/h6rjP1
	 nmO99hSqe6gWuj1BgE9Xdcf/MF5gn7oIUlw8yCTTvL6fQ9dx7r335ixVT0Gvzeva8D
	 UDVutqb3kOPul+ZvhgkAYmufL+VRhmWWZiDtSkVfbQ/WStCEMxgBUFM3PsCSyMAu/h
	 cxyqWEPTEEIQMeYZE80woiknsVeIsJX/MbWqYm9dj8XsHgz1TM4WsEKkfsawechdmB
	 opVzeEz9rv8Lg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25D3BC43140;
	Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165945003114.4474.2275642279967017732.git-patchwork-notify@kernel.org>
Date: Tue, 02 Aug 2022 14:20:31 +0000
References: <6de8649c-9795-54a1-fa45-8dd50355061f@marcan.st>
In-Reply-To: <6de8649c-9795-54a1-fa45-8dd50355061f@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 31 Jul 2022 15:57:53 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these DT changes for 5.20.
> 
> I know I'm late with this one... hopefully it won't be too much trouble,
> since it's quite trivial.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 5.20
    https://git.kernel.org/soc/soc/c/87df0cecc269

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


