Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1DCC4167B
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23C99C385BB; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B361C385B4;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779108;
	bh=aY8QmdtGz4Ylh2ws0LpPNaOPVBvbJoC6jrriY/gditU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PJOHdxpJVyrfqIiUWL566GYkr39ZyJYQsheQGAHdfdx4Nn8MkNyy/9WzPxwrz/5av
	 r4E8ttYwHLNMmbM40ZIrNJPe7lTYLUsKZ9tdnB6fCjAwbMXAs/mNuAiBpEoFSRuXzy
	 HP8TF7dUxd16zW8Z0BKt91KQGNdaFctVCpSPbqU0c1CG8IyUMd7S01pP45Fv3gI5iU
	 XleHTVrUjn/+H70xvO98wIJ4WZR2Fv6yzk0F8ysIycsG1esxw22QsMX/bBLfX6+oip
	 yNfy0Iwg6htrXcTPdV25OHx7PKKcncCNGnjzHirx0AF9/FbTQyYnfaYsxjR96vw+2Z
	 Ws0QP6DWII0sQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6548E8DBDA;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More devicetree changes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910793.9627.18392030272831655745.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:47 +0000
References: <pull-1651726643-535261@atomide.com>
In-Reply-To: <pull-1651726643-535261@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  5 May 2022 07:58:12 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit dff844e1fe17e6c41e5899d46a378f857ea4f354:
> 
>   ARM: dts: am335x-baltos: update MPU regulator range (2022-04-21 14:12:52 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More devicetree changes for omaps
    https://git.kernel.org/soc/soc/c/485b5afae681

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


