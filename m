Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3612BC25B72
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F107C43391; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDA32C433D9;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698339031;
	bh=vav9pgXtVk2a/ihvQSY36pEZWqCZvbnjjdeczFNtxq0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lrHi52CuvkH05bo5nltd86q6PfnwHg783Nnek4RUu+XYoBKEhg+ARqTFMJHirxtMK
	 3S+j6nXRrufN88cFXFlUGIZXZPaq9MbRjCsPnoUn89SrjGobMxkMtNo4q0WqDiBEPg
	 R2YSEZnABZoM51f8hAS9KSeNMImAECKn+cBPm5KqhnT1g5jIxnWuw97m/7IJkKH/4Q
	 VOL5Uaxn5YsgcdJaq0SCjWHXAgqqXyQieKluOuXE4QgS0GnCm9oe/mYk4Rx0twQwHS
	 DYm911MCsKLK1fwQ+XYT8Hbb15wUnPuoDmwK6o0rLKHs06Y7BraKrZLd95wz7fWfjw
	 9C4tBv+9kcMXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1B23E19E25;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm32 DeviceTree updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169833903085.20019.9941241329584305886.git-patchwork-notify@kernel.org>
Date: Thu, 26 Oct 2023 16:50:30 +0000
References: <20231025201503.1016435-1-andersson@kernel.org>
In-Reply-To: <20231025201503.1016435-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Oct 2023 13:15:02 -0700 you wrote:
> The following changes since commit 2138c32af19740ab54bf5622890fe96ba3530b75:
> 
>   ARM: dts: qcom: ipq8064: move keys and leds out of soc node (2023-09-27 16:10:23 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.7-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm32 DeviceTree updates for v6.7
    https://git.kernel.org/soc/soc/c/7db5f3b012fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


