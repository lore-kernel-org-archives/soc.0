Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D351C47089
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E2ACC43141; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03606C433D7;
	Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155626;
	bh=kaFvg9d1GS6ngL/JjvRhgMZ4NRTOGeeSdQEekiTIZss=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KMcJ4y/Kuv33167b+OHowQk/XUB8oetHzimhe/GOwv+vkwkF4XeAp3Jm/b5P7qZ4O
	 qKu7PRaDmjycMgK5tywhSlfl/bSU5wQBQk9F35Fs0z0T6emZhLmcwUsK9Upwg4CNEb
	 JV2BObc0pWYiV8G2bxITDsS3sqatLsRp3RVc8U5m9ImQFtEicq2iL5y5oTBK9PpOkN
	 emWZ/EMdCxd+1OXTny3HaTk7NMKG6fs0tCsQFCM8elQCdGYWlZsL4mBSCA17bZHJy2
	 tuqx1DG1c5wFkeDMG8wyODJyzenVfaEe8NdTLJrJgca7nT/yfxs1tMctGDbXt2lgw2
	 KQtZLa+9LBWzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8038E4D039;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915562588.11152.5282910633000164591.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 22:20:25 +0000
References: <20221122202748.1854487-1-andersson@kernel.org>
In-Reply-To: <20221122202748.1854487-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Nov 2022 14:27:48 -0600 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for 6.2
    https://git.kernel.org/soc/soc/c/2fba4fe4603e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


