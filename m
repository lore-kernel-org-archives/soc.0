Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7EEC43216
	for <soc@archiver.kernel.org>; Fri, 27 Aug 2021 22:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F0AE961004; Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D7FAE60FD9;
	Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630102208;
	bh=m4Z8IUazUje2llyBo8rULQ3Ja6w5ZhIjnZl0i2fZ0no=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Bi6BVvTSDengHqwxmsyJkXujwqpHSn0xA8K/pidRCA6sQlHXG0ZN5d0aU6ixx8OLT
	 UpdneExXsmKo5XnXiJVsXrpVGOJRLXggy5JrWuMXV3wKtC7UGhplvwUfcjAK4T/+Yb
	 2jDxlvI9F0qhCLOvlobVm0DrIYmQsd5ZnCIhK57chLvEaNv9/G6P9TeHZx5uWcoqJh
	 a4l43JrJbHxtOzLKXIuaHgUuRI+agSR5UCWGniso9m158jpM7rHm3j4b0P8CW+RHj4
	 LNcBhRjoTUt+Z1/IwUndhbERb2gKDwUeLOKCNbrOiQONXOXrkR2noJbwg5tOVQCT0Q
	 OXrZBPLlVskiA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C6FFC60A27;
	Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.15 - #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163010220881.19400.4203321342010272785.git-patchwork-notify@kernel.org>
Date: Fri, 27 Aug 2021 22:10:08 +0000
References: <6569432.ejJDZkT8p0@phil>
In-Reply-To: <6569432.ejJDZkT8p0@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 23 Aug 2021 20:45:00 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> another late (and now final addition) hopefully for 5.15.
> This includes some dts fixes for changes from previous pull request.
> 
> So if it's still suitable, please pull.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.15 - #2
    https://git.kernel.org/soc/soc/c/dd300577952e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


