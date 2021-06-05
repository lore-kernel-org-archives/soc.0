Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97C5C48BC2
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4154C61421; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 276B861415;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622933885;
	bh=V5dLs97pmudnH9zAo7rTz5xhTq1+w+qc8T1TmlkS/PQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NLPZ2YiSDyl5LX5Wa4ShqEN+NvqgXLDSLg0eiR+mmVkMxJz3dE8bwJMiXcBYDmkor
	 x5uc+fCdf0kxt3vf36T42rKQGgdRZIicW/qnG4gZ7QDvzfdTdMvWk8eI3h5NcIVFGW
	 BkhTBrimG3nojW8XQUNu8mv0inmDE1oiKlq1VxORycUzO/Zoaq9G3Ps88l6CorJon0
	 wnLXBHfyIjcnUoynKcX+eQ5GjNAUOqYxmVinU5EXQmHOkVJThFMAeAoRCyzN8vO28s
	 cBuD844dQFVp9O18yRN9xRsgRyvnTV1PNiSQA5ANobPFi/r3CVJI65Ge+l4UFxIWuA
	 0YUCUy6wPykNA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1A0FB60A6C;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SATA regresion fix for TI dra7 for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293388510.32315.4560117196603153425.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 22:58:05 +0000
References: <pull-1622613578-121536@atomide.com>
In-Reply-To: <pull-1622613578-121536@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed,  2 Jun 2021 09:00:05 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit d995d3d025bbd2d89abf12418f20d19bc0cb0130:
> 
>   bus: ti-sysc: Use kzalloc for allocating only one thing (2021-03-24 13:44:04 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SATA regresion fix for TI dra7 for v5.13
    https://git.kernel.org/soc/soc/c/94277cb5b4db

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


