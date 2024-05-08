Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80C4C41513
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A509C4DDE2; Wed,  8 May 2024 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73C3DC4AF66;
	Wed,  8 May 2024 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715152830;
	bh=t93zxNIFoNlK9IOczIZYuG+djop0y5jxW82d5sJzfQI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=k+kvSprZy1W8WLw7MWMSd3vbBhaHX1PiTNOcLY9fHxZUiySavQUHPxVeYHmJ5GPlB
	 Hj/j/PEcZ/qp3iBgykGkrtFMNJuWeCPbo4rjXLh9jdAaw/gzZw3ZuKma8hYwDRwz7I
	 aHufOaOA6cIxj0/DyIujrqJx7IHWbWg0/gbZZPuW4qW3S7rDNM4Qn9/x7rLx+5hwnr
	 DIqoqsXnZWmBwKhM3Os/nVfMIb3nJeFyM3v+/N9fO4Eib2D3cbrjRsM45WdHhKbzwI
	 xA8lxx2fDxn2AWtfqZF8SJt5Hi3AH8XF4i/Suh+I428BSEBHrD6jyLOyG1HlGkhgnX
	 ZRBCzD1sHoLFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 58DD7C4361A;
	Wed,  8 May 2024 07:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm Arm64 DeviceTree updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171515283036.32265.11802019548554541789.git-patchwork-notify@kernel.org>
Date: Wed, 08 May 2024 07:20:30 +0000
References: <20240508021820.206441-1-andersson@kernel.org>
In-Reply-To: <20240508021820.206441-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 May 2024 21:18:18 -0500 you wrote:
> The following changes since commit 873d845a357a4d89700cb1bb5b3da68890756f50:
> 
>   dt-bindings: arm: qcom: Add Samsung Galaxy S5 China (kltechn) (2024-04-23 08:00:06 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.10-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm Arm64 DeviceTree updates for v6.10
    https://git.kernel.org/soc/soc/c/0cb7e0c617c6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


