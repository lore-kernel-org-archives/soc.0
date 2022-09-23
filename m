Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7FAC6FA8B
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B219C43141; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55B74C43470;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944667;
	bh=gWfCY30LGz7vfCwIdh9jdT7XtclwaH7WNjCq9QK16og=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rEKi4hDSq5OpYIDv/Xp0qoL3LTOuGwb80If5UpO1bucmPVdS/b7xcXtmacVJsgHGV
	 DKzjr1hVL/Lh6yECjzvQeTWiW1aihJI2OZ0pAO5nWPWLC5RK5KXtvtOIv4GgwiVDCI
	 fjzgOdxfMqkmDzGMnv4EM1OEu1tGL34Dkowa/v2Dotu5uPhHyFOhvQHB7WMZOuW0/W
	 0je8NgDh9aCX4rfJNa8TlFwPXAyLNqw38CJk3MX1UxYO6LMk1l+SgqFQD7WvjVXh4q
	 4jx1Ldme0k33F2fNUlx8nKYsj7/6GdSnDTVEJUxLsDP73xHscw8dnjSebLHEd219+X
	 RdSg7i3N5uMww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 320EEE4D03B;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DTS fixes for 6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394466720.12526.664716262638895478.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:51:07 +0000
References: <20220921142939.1310163-1-andersson@kernel.org>
In-Reply-To: <20220921142939.1310163-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Sep 2022 09:29:39 -0500 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.0
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DTS fixes for 6.0
    https://git.kernel.org/soc/soc/c/c69badd1d746

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


