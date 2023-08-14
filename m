Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B760C001E0
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B6DDC433A9; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9402C433D9;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692033026;
	bh=3H4SxQ5PCRFAtZnrRZRfGIca6Z2E5cXJc+xOqy1O6yU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=erqjv/v0xrIfMuZInS907zs4WxCDuKcSCkRnv7LswsWRJGfDRr8jUX9dRVktrs64M
	 EktkQJpo+/KzsawhstKQcgq45dRWVXJjTPS8BVKK8TC4jknmToWPfdU9XG8do4mdUX
	 ZjpmPzgFRP2cYYYWmtY3xYUDHHemxx40ev+SwBphp+JwNlxYPdLW0xHPU+SROYSPpe
	 4lPFuJtbFgFOX2O7y3Xjj1jCKkQUV5g5gFWSL94rC8gqkYhwIxWt8azgiU/DLe0BYK
	 GVRD08RbJUQ6g3vihOXL3s2zh9NqmdXfJOIaYxoAy+VL+zxzYBTwac3+NMP3iQZARC
	 zFlgc32U5s0Lw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC597E93B34;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PULL] final oxnas removal for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169203302683.15030.1410342382360795465.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 17:10:26 +0000
References: <3f91bb89-bf7b-d967-a302-2a8e1b0c3b01@linaro.org>
In-Reply-To: <3f91bb89-bf7b-d967-a302-2a8e1b0c3b01@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Aug 2023 10:32:33 +0200 you wrote:
> Hi,
> 
> Please pull this PR to remove all the remaining files for OXNAS support.
> 
> The other patches have been merged by the respective maintainers, Mark acked
> for routing the irq-versatile changes via a SoC PR.
> 
> [...]

Here is the summary with links:
  - [PULL] final oxnas removal for 6.6
    https://git.kernel.org/soc/soc/c/f15897c25f8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


