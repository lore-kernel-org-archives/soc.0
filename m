Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03198C54E72
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9762C32784; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3F55C3278C;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=j0Fn4AGA87e6hli7fWCR63nnlbbPqMqa2MBgnQQDQ0Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kmv1gPxlbz2cC40cmw/cM9cLHWXpC6+pyGy5J2N52dhCp29GdEWeOGx4gqcE0eG0J
	 9AD6/Z9UIMEjCyOoazUr0qZc+W4xcE/KTL0lcUi+L9mVuMX9bK8PEmOxxU4b7NAG8v
	 q1HOtoa3IzfQNOlLh5n7L3Q5RHFlCR6VcxlssVAkVtPz3890YQ6ks6ym+VLp9ONwfP
	 yQtfQy7Ouvn/gjG9IcRbWJLBKMwWj8Pc8VejA86oqDIPaugTWz0n9OQkUZH15FfCD+
	 JLwMaxAUrUgIM4aWtIjg0+mLAi4l9aL1XrgsFG99btPTqAj1kpG6WjBklSlmKjXGBL
	 N8q0OrlcuHhWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90386D88F8A;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872058.25915.8886353614833934189.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240225025205.479589-1-andersson@kernel.org>
In-Reply-To: <20240225025205.479589-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 24 Feb 2024 20:52:04 -0600 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DeviceTree fixes for 6.8
    https://git.kernel.org/soc/soc/c/2bb5a9ac8842

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


