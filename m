Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF4FC74A5B
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 80638C4339B; Fri, 17 Mar 2023 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6327EC433D2;
	Fri, 17 Mar 2023 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679070018;
	bh=MCc3FffLadNh/ID+YYOktycFJVArzs9NvBbn2WWBzd4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LQiO8bqVsr2u8+6+wy1gFNZH8BpbH7feCDcIPQtFPjD6L57CLLTIPV1fujOHEg9CX
	 9cpu9hW6OUFsaDRpgfBJAED971ufiTVDgsolgmtyxKqY0tGvz5YuX49O4mPpm9Seaq
	 98KMU6A+2ekgKZ75bNpnaoQjD9sqx5Ln2mjKZYqjGQhtiqHB2F/KUhqQXVd1CgghV4
	 jvnFE0kps4Kgtb9rDnw3yhHsKNNTxuzmbi3DWQZi5avXJt9X1zucY79NW5x6Ed0gNl
	 JxZLL0ffjlqJZ2k/pvnZMoNQaprfaNy8+PkIj7bJ/jhwnWVLr+gLwbZeXFcyJ+fa3Y
	 53+IRklxWiqPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44983C43161;
	Fri, 17 Mar 2023 16:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167907001827.31956.6698239494798209437.git-patchwork-notify@kernel.org>
Date: Fri, 17 Mar 2023 16:20:18 +0000
References: <20230315193557.1709241-1-sudeep.holla@arm.com>
In-Reply-To: <20230315193557.1709241-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Mar 2023 19:35:57 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.3
    https://git.kernel.org/soc/soc/c/d2e53ceaf284

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


