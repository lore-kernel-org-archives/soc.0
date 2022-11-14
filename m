Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B4BC4167B
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93548C433D7; Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BF9DC43145;
	Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668430816;
	bh=BUwHVzceAa3sqPXs9M7AqXwQ8alchCFKgnxf6syrFgQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oEwt/Kwza6DvvLnrVh9tPiizODUzmr9lF30ArwO285rsWWFZAbk9Mobtb+ZrapMVH
	 tRA8Okm4hnTn7uk++JyPlm7rXnak3StnXogwnZvQ0LRcdmukWZQ/Y46i0M5UoR8bo6
	 iLxgmZwsRQppX+q4dpCJdjnCu6V74j/FCf+yw9+f5WLKWdBLHmzml7K7ljCjzRxIsz
	 JZ7ftbcofzuqlwhgsZSqFTrO6JG4BPhAV+5VzHf987HdExXtM1t6gDuI+tiFTemHxZ
	 qqUvITltm9XxXNoSpcdp5C8ZsSJ2q05T4lPlYu0xaixTDbwWC/z8P7Ao9h4RaKrQJZ
	 fbFqd3lPSAtZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CB98E270C2;
	Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DTS fixes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843081637.22003.12614863932706609579.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 13:00:16 +0000
References: <20221110040635.795921-1-andersson@kernel.org>
In-Reply-To: <20221110040635.795921-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  9 Nov 2022 22:06:35 -0600 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DTS fixes for 6.1
    https://git.kernel.org/soc/soc/c/67b745880792

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


