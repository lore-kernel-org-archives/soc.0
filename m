Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C768C43217
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41077C385C6; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23E9AC385BF;
	Mon,  9 May 2022 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652132437;
	bh=ol0XWVHxD4X1sVhTq2nOVGplLaUa6lvNXtfJzYWGt1w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AzuSyaI/7YV1uT/vAYHsUW8ZG4K8kaCUd9ihoQ4kcf/l3O08VSZiMkJub55pA9gv5
	 pJssSRLIqQFjQH1CrS34w8dqJxfThkjWVfbzPk49uq0oD0bClMY7cWmb+lz1CUv80W
	 DytpgZ2xgBsm5e32bsVO/eK0mD/DlEjh81ACGQjpyFSEGrSCGL0pD66NwyHRpUdLkW
	 ekVfSSHCurBPAQvQ3omt8KdiIq5g0MaMM/SgHcWEXwKU9EsSYv5aCIJoxgvo9b36/z
	 SQLFO2yvHNTK9KPKIw565/P8H9ob+UuJglUei0RpkrnA6QkwOrzVNoxhzJsiUm35dh
	 xY2o7jXWJOr+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06856F03929;
	Mon,  9 May 2022 21:40:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] ARM: tegra: Core changes for v5.19-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165213243701.32686.4137097652202791825.git-patchwork-notify@kernel.org>
Date: Mon, 09 May 2022 21:40:37 +0000
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 May 2022 16:30:00 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] ARM: tegra: Core changes for v5.19-rc1
    https://git.kernel.org/soc/soc/c/baf7cbbefbe8
  - [GIT,PULL,2/6] soc/tegra: Changes for v5.19-rc1
    (no matching commit)
  - [GIT,PULL,3/6] dt-bindings: Changes for v5.19-rc1
    (no matching commit)
  - [GIT,PULL,4/6] ARM: tegra: Default configuration fixes for v5.18
    (no matching commit)
  - [GIT,PULL,5/6] arm64: tegra: Device tree changes for v5.19-rc1
    (no matching commit)
  - [GIT,PULL,6/6] arm64: tegra: Default configuration updates for v5.19-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


