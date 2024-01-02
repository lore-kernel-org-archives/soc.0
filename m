Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029DEC46CD2
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8829C433C7; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B33CDC433C9;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190300;
	bh=UgX+6oEX3p3daHYQRSdG+mGL5HNiqSBR2HW9JXxQsq4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QQ8zwBrl20sjMYg8VCMNhFysCxsLSO81APuuNT23UIJy66Bq4AsUdZ/odVVj7Ego2
	 vsWtGml5BjItMC5uaIevCMwl47OfC2y1MnKNnZUJIxsPzNvlDJZUJx6AApZ+1L03Yz
	 X6fK95Nktpytt+b3AUH66/g5pLV7FOF+sgkjWY2+f+63CIlKR2nhZ1VGYm+f8SLc5I
	 CrQjBaPz6gVurgstvdWfeL0uvzhiAgTQLjMmpx4fgjdXMdParEju5brDbGiPW5AIcd
	 TtHaWbywiRXY/K5xfQM+zQ7wL/lqqSsHRg5Fc2A9wM5xPnxN4IZERcKIyNYGdr9G/f
	 p5ghteYsRyV9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E93CC395C5;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: sprd: DTS and bindings for v6.8-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030064.6407.1832813384970821171.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
References: <20231228084958.1439115-1-chunyan.zhang@unisoc.com>
In-Reply-To: <20231228084958.1439115-1-chunyan.zhang@unisoc.com>
To: Chunyan Zhang <chunyan.zhang@unisoc.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 Dec 2023 16:49:58 +0800 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/lyrazhang/linux.git tags/sprd-dt-6.8-rc1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: sprd: DTS and bindings for v6.8-rc1
    https://git.kernel.org/soc/soc/c/f81647e76136

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


