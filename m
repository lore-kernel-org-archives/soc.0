Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D01C25B7A
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 773AAC4AF66; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60AD1C4DDE0;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=zVQqNAOFR3PUIkn+2RPKVKHDw9vj0nR/u6+x7MfiEr4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FSKctTKiasqZRE0yLBZafHa17ZYfbtnX/FG0FIwIv/tgTfEN+3WwtFAuDZtQYRVjD
	 AylvLQNfZMJoUCUHYaUQcVhin6j/lOXRBJZTuwVyMnzTplzIJ2kCAGnfdEMJgBsYe4
	 SfE2J36NVhPn38vFMI0N8SKp2nVCm5b9tCHKcyRWadMg/fAHcNHL1/26b+mBt1PqI7
	 XMSei9PjKqsJZeaxMrp0kzzt7EiT95gbqDJealiiOs8JPVnxmCLib/OYXPUFI/YCou
	 dxKuOfZTJeNAWSZMQEwN4+oS9wZRN7XNo1uBTj+5qGkjmjaJYhTWs1jCfnGfexZ+/K
	 tHD2FuMlbPBbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57A3FC54BAD;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444735.17402.11673005198051302065.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240426105031.1526987-1-sudeep.holla@arm.com>
In-Reply-To: <20240426105031.1526987-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 Apr 2024 11:50:29 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> The pinctrl changes are acked and agreed to via SoC tree by Linus Walleij
> and the dt-bindings are acked by Rob H.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.10
    https://git.kernel.org/soc/soc/c/21cbc1058ab7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


