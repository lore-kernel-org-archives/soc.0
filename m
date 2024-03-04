Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F70EC54E68
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 983EBC3278B; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83232C32786;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=xfE51JKOge0Hl8HT9hlgNXNURWt0wn3g7ZIJEeNxDJY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZKb4BGVMQxvv0irbNGZD8a6rDfNTXR4yeu1BcfdEAENwyGFskfS39hvOG+b3WY+5x
	 G5T64oovi1HYLFHg3f+sEKebGfu6zM9PvXkgS6QmsHSgvmiHH+ZdiuVErBhvlDquqR
	 +KbDU1YgQZRM8Mf86TlaKxM45+u7MD1Q9/IT7UhTMIR8Up/o4KdVAUITJOsiDl60k6
	 sNpbM/DTgL1k+vLsPrwwfVKABS8qkPiZUrujw19yMT/FP41DFhOkDOib66GPTe80ZN
	 cXDnAzxVtW9whha+jcB/37M+xH4rJjiaQiWygh+QYzaUnJ/ju6NxZJLMSv0WGW24Lg
	 1j1oelptGwFOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 70AFBD88F89;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: Zynq SoC changes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872045.25915.13757853309868793552.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <CAHTX3dJpawPhgVxSsXuSvG20JY9r4EkJu2NrrH1OKRjKxTpNAA@mail.gmail.com>
In-Reply-To: <CAHTX3dJpawPhgVxSsXuSvG20JY9r4EkJu2NrrH1OKRjKxTpNAA@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Feb 2024 13:12:18 +0100 you wrote:
> Hi,
> 
> please pull these two simple patches to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: Zynq SoC changes for v6.9
    https://git.kernel.org/soc/soc/c/56f0fafd5b77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


