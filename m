Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D550C636CB
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 16:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1E00C433EF; Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBBA2C4339E;
	Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675097417;
	bh=5SouwNpD6GmZQy3GYD8zEwMrSj9dSY3FuJpzKop+AvQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dcp+WvacHdY6KMaoCcGVWREEX7HQd0R8NW6+3iWz36iJT9k5Ej/O0w6u/EmOSBKKX
	 MtsV3SzHv6B5fLpyY/CcRV6o9ZGLmhC51swnhrdb7zUUmWg28e7R64qoXzSQzjzFP/
	 j1ix7uL6ejtMUBzdUnDDm9JIin63jCIG/xplyumGdWvxdzTqPe9RhcJN2poMHt981c
	 BXfd0n0VSIDBXdGyzgadTu4AJnwxNJGkhyR/JLpWv9MyybYxYgIp7YM5hYDLUkLCKv
	 AgxBdpttrEn6qI4rz9pVh08UM+rt8OJvdXCLkF37wxoxmqxYVZoMeNBFpBP3MWSypH
	 2Wg0wMc6xUU8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4703C04E31;
	Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.2, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167509741773.16068.17249768947815656218.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 16:50:17 +0000
References: <20230130003614.GP20713@T480>
In-Reply-To: <20230130003614.GP20713@T480>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Jan 2023 08:36:16 +0800 you wrote:
> The following changes since commit 490748874ebf1875420fc29b335bba2075dd1b5e:
> 
>   soc: imx8m: Fix incorrect check for of_clk_get_by_name() (2023-01-02 21:16:05 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.2-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.2, round 2
    https://git.kernel.org/soc/soc/c/8a74191c899e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


