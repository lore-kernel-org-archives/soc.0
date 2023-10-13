Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6055FCDB485
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43CDEC433B9; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 281BBC433D9;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=TW+kmqRApIj+utBRl4cAa9ov2DtYipxxmc1N5A+C97M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KYQhhJpbYLk0pKkIVoUJyV+WiwQ6r/HdJ5tkQxI8wqGNYMorpys8tiNjsHc7XxWZo
	 XlEzTdFC08NQ4ZF/TLk/uqWJoXVb3ZJA4E5guVTghqQzwD8d5l1UIGsjc0a+qXDM8s
	 fg7AoMNBRx9lSHUECwPf4FSrL7i3lsQ38GJZJqiAmLi7xw0tPwKczD77ZgfsJSpBHk
	 2AeseTmYRqyr2FvIV96zuOSlwerhqc1CCw9+SDpZpR10BA4kihDPhmivyOk117h7Ax
	 uUMyPfRdP2zul9j0GsaOkJk96i47+KV5QGYGsqT0mW82VeR47ihtzEF1s9R2aJbc5f
	 S4bRmW6y40fBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09571E1F66D;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree changes for omaps for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083803.14185.7201765960707907179.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:38 +0000
References: <pull-1697010475-119828@atomide.com>
In-Reply-To: <pull-1697010475-119828@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 11 Oct 2023 10:48:26 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree changes for omaps for v6.7
    https://git.kernel.org/soc/soc/c/46579e69c27b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


