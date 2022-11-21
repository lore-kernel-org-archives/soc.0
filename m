Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F3CC4708C
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0574FC4315B; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3471C43152;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=6TLlSLBWdH7aEFpOj8vUuo2uPggdRvCp1AQYrXUB4lc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ot9a548sznuFYDY5ROLgd5ZL3Y8tu6MZLu6CK2TXQzLFsNv29WgCvpZTErSZ/4IvU
	 Q4Ux4t8Wd74ruWURhzmrEk8tKIYYd8RxMKxyQNJEXI7WAhxQqWEK4Ly3u1GE9S66Ix
	 Ckk+AH1W7nEECpVB7HYfjKRE71ltsUvZlplCAjxye1wwaszQfRZHCkifU2lLEWP7B6
	 NFQ1ulpMISroLRk6ZNpFPVRWFZ0K2RjZYjhk7mS/XUO0p3lPms9wOCSDAeAkqP64He
	 99oWeicEbmEkLTWo2qOwdcsZFCct0Q9+7ojDzfuP/Mtm8Rd0OZ3W0woyaEyw3633Mg
	 PvNYaGmxTPcWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0C82C395FF;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234385.4359.2335341177409449427.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <Y3ftpBFk5+fndA4B@jernej-laptop>
In-Reply-To: <Y3ftpBFk5+fndA4B@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 21:40:04 +0100 you wrote:
> Hi!
> 
> Please pull following fixes for 6.1.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.1
    https://git.kernel.org/soc/soc/c/e7135a28430d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


