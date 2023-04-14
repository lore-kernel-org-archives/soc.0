Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE1EC77B76
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E41DC433A0; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C9A8C433EF;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=99qesMyLro9hGl7VBt3YAAOWECqlceA/9vVSmxQqnwQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LUmU8P1b0/GRJpEF+XL7PGpIURiC+k1K+QRkAVYnRd4N6tSXtR+wH4W5vVlaWnUa5
	 7G/1rKKs1+iolPH9hhDXCRmNMUFg7SvQgTaalW0Jqh+Ve/rsWbdJ+tY9Qipi+rmDyx
	 RNjRXYwWuPQoFv4SiWceZkF9zC1Xjo66/s9tTXYbJotfV9AXFFEfpLbWzl7FFyQ4uY
	 MV6CLe9l9hU/5caNJeNC7AQPctv65GaNcWgVbV3jrMoTw0C/mBQOUsFqxkocgkiVfB
	 67AbvfS8PhA2IKPqeaRc8MqqHRRTXqostWRGqWrok3kCN5WjmWc4UQpum4whMT+5Ln
	 qW4FH2LdibaoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F6F1E21EDE;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/7] ARM: tegra: Core changes for v6.4-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783032.23940.848150684578195140.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230406124804.970394-1-thierry.reding@gmail.com>
In-Reply-To: <20230406124804.970394-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  6 Apr 2023 14:47:58 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] ARM: tegra: Core changes for v6.4-rc1
    https://git.kernel.org/soc/soc/c/fceb6ba1cc6d
  - [GIT,PULL,2/7] soc/tegra: Changes for v6.4-rc1
    https://git.kernel.org/soc/soc/c/547d67a904f7
  - [GIT,PULL,3/7] soc/tegra: Changes for v6.4-rc1
    https://git.kernel.org/soc/soc/c/871e766df429
  - [GIT,PULL,4/7] dt-bindings: Changes for v6.4-rc1
    (no matching commit)
  - [GIT,PULL,5/7] ARM: tegra: Device tree changes for v6.4-rc1
    (no matching commit)
  - [GIT,PULL,6/7] arm64: tegra: Device tree changes for v6.4-rc1
    (no matching commit)
  - [GIT,PULL,7/7] arm64: tegra: Default configuration changes for v6.4-rc1
    https://git.kernel.org/soc/soc/c/b4655af5f668

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


