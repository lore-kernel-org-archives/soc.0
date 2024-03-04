Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDB7C54E5D
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DE46C43390; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA309C433F1;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=K3qiXoTKt2GMNd62HMga1pBbnYixgGu0Awd6CbNmbvI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mPiSV2rtr2DXsj4ZrDhCDgLc/jPbJCgnBM5Q5j1pBQsRNO7K5zSINoao7huyJ75b8
	 6hfY1V9W5H37lzPArchM96hR7WOi579VLbEVzUUMhCGEvf/l14KnBKJegei+2tjiwP
	 8yIXB5/6l2ob9FMrb4F+zRvvSPmJXq/ANV4Zbh6u4dq0dX3GPdtm8TSfhtxaCMQ/YB
	 Rz7214ztNDkwfzNa5d5j8dycLLw/fVYa8AjzV1mLxwo05W/faxCtAXaK0HNZfthg/0
	 LUdASGNTCwAMUWsh5xMSGzPTqVs255BFhXexrEbfCY9fDXm3/LuY3xGDuohEkGexoO
	 15SsS4vdhj3OQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C3563C595C4;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927479.27833.14291197564357042065.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:14 +0000
References: <MA0P287MB2822315119DA51FF95EE3071FE5D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2822315119DA51FF95EE3071FE5D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 2 Mar 2024 14:48:08 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt changes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.9
    https://git.kernel.org/soc/soc/c/f9c59f24821c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


