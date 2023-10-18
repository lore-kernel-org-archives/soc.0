Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6194CDB47E
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 15:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90FDCC433CA; Wed, 18 Oct 2023 15:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7591DC433C8;
	Wed, 18 Oct 2023 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697643625;
	bh=Cq1sz5a3srWqkfvOjexPYq9jI5dYEXuMBxQDWK5poDA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iOHEus07Pgj+jcGkIjdinQz0gL6c60mxF9M75NAmTIJkVMKvRZQIaQaobqRupWWPH
	 P0F9mhQPguenX2/ORrnvRiUXU0as0SpKpKmh3T9OMo+p1kOlkENzsPAfB6Nwy2cpmM
	 IsQM3uKhP4RFqIpTC7i0IokM6Ex5ZRx6mx4gsnVWEeO0yH1rsNqfhxLJI8kCrJEO51
	 PD6eWz5cVSyZt10ERe0DJHJgfcJYtxNM2by4Edi3sWw9QZilgzOvu1CMHw3QlxVESQ
	 LPgxobMwCQpPHsYNP6Xwr+iEVZTFvjBS/ZeS6bYmjgMgxjD/6wGe2Uzr8tnSuwF/Zv
	 UtcHwkQfX+TCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6442EC04DD9;
	Wed, 18 Oct 2023 15:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169764362540.8197.3944658658126650228.git-patchwork-notify@kernel.org>
Date: Wed, 18 Oct 2023 15:40:25 +0000
References: <pull-1697606314-911862@atomide.com>
In-Reply-To: <pull-1697606314-911862@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 18 Oct 2023 08:19:34 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 06f114cf7cbe96a07c51c47114d79e9654275919:
> 
>   Merge branches 'fixes-mapphone' and 'fixes-ti-sysc' into fixes (2023-09-13 11:11:11 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps
    https://git.kernel.org/soc/soc/c/eaf16b92b18c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


