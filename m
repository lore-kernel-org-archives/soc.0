Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09ADC54E61
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A540EC43601; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F6C6C43390;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709708430;
	bh=ARvsl3SxtdIpDloYKodZ6oiMe8VgU2RuRY8Yq4GEelM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fI5Wrluw9kYbfWT64WLSvh08whRXOUnz2kWt8kQsDkvik804F47Yuu+1Q+g8oa1pz
	 6TSIPN3v3Wx0HpTTuGpqV9jLa92tfMNg4kS8PhKGpoF4jltAUhtq6LH2a27n40uMlw
	 8bDR2g1bbWKdsLcQmMmIFG0dZO86fGQBmw1bEWXhsB8Cgpol5nvIb/BDVJcuaXp3dK
	 McTHgjwXxv2wBhwTFkBsTmmfN/LsD4Zwqa61b/jV6ZYq5zzCpbYVT5bEcmKs3goKAF
	 FLJNU+Bt80NDjds3msWDbfWquOHZeg2ZTV9z5nnn9ThL/NAsXaanh3U1lvtGEMMJfr
	 9weFtlMPWe84g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68A18D88F82;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V firmware drivers for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170970843042.7525.14145405596772069767.git-patchwork-notify@kernel.org>
Date: Wed, 06 Mar 2024 07:00:30 +0000
References: <20240305-vicinity-dumpling-8943ef26f004@spud>
In-Reply-To: <20240305-vicinity-dumpling-8943ef26f004@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 5 Mar 2024 20:00:42 +0000 you wrote:
> Hey Arnd,
> 
> Feel free to cherry pick this either if it makes more sense (or even
> send it to fixes instead). It's a fix for an oversize allocation, so
> given how late it is in the merge window I opted to send it as 6.9
> material.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V firmware drivers for v6.9
    https://git.kernel.org/soc/soc/c/1c7cfb6158f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


