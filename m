Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ED0E7F135
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7CF96C116D2; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67715C4339A;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=gHfqHkji4B/OPuzxq5G3u0ljY/+d/v5QKaV8hZlpubk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XnUmGw39fQ1l+sZI3wWht28nGNZag9uP/oCneiMjNkERfBmksUWTbMWqn8nCmyJEk
	 the1A/a99Grc4uVvueZ3PiyZqKuBmY9jg5oV9qa8CLHZiWRnRMGQfG/t5V+K58U99Y
	 msA6SJXzg1hZYv5sSdr9Pbo64QwLJe+5qNg8QEnhHM5r9Z1qCNywOn9WbpkczDejRI
	 H4c9rV0MghvJh0GhArQ4+rHmVitWRzlF4b3xdMtB+J0RjxMlj2+Bqk0CkSKmJe0mOi
	 0cxfl3M2k3tDtVNC91OMSt7TIzCGphQm5zwCZ6rZEG/jpufnxzcMedWldmFiJxjmEk
	 tNjSYtYtqrWeQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 552B6C6445B;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps and ti-sysc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223334.24546.9477458815256594546.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:53 +0000
References: <pull-1695715881-95183@atomide.com>
In-Reply-To: <pull-1695715881-95183@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 Sep 2023 11:11:47 +0300 you wrote:
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
  - [GIT,PULL] Fixes for omaps and ti-sysc
    https://git.kernel.org/soc/soc/c/e99e2e8d1b12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


