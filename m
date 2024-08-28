Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE7EC7113C
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D158C4CEC1; Wed, 28 Aug 2024 20:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E7DC4CEC0;
	Wed, 28 Aug 2024 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877791;
	bh=9HpIF2l5heOPAKgNArRCO8M+ZSRcfZqGspbum9uVAw0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a042dOKQfLUMMvuEEQV9HZC5953oKwfNTZTKUbIvct25nZQ4q4K643OR3jYOYY4oT
	 6ON3U++cMBto6Ye1AHV8GRfMiFIl4GEgD5JFlpOYY3Wt1FSuvxzLShQUZxaAEzyrP9
	 sUspeIXfMNnpz/O2Yr51LP24xA5aeOx4+RITjCPxQqU4bcPNlacJ0pAv022pylq2VB
	 U1noDbtXK+JJSy9TxIoTuPpfuXw1hMnOd/Kyjn3iV3YyNEMBVxCv1SKIvo7ODaMjJx
	 T9qTw76w21b5T8N0bJ/s3I9M2j9BjynpCTO2DkAo4D1CdSL1IBEC0waIG7xMHGccuT
	 S6aVMEf4RfMKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B3A3F3809A80;
	Wed, 28 Aug 2024 20:43:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc driver fixes for v6.11-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487779149.1420116.12375411653791659521.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 20:43:11 +0000
References: <20240828-fidelity-almighty-18d5434aaef0@spud>
In-Reply-To: <20240828-fidelity-almighty-18d5434aaef0@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Aug 2024 16:26:40 +0100 you wrote:
> Hey Arnd,
> 
> Please pull a single fix for 6.11, as things have been rather quiet on
> this front over the summer.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc driver fixes for v6.11-rc6
    https://git.kernel.org/soc/soc/c/3536c01d6577

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


