Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD91C7113D
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F7F4C4CEC1; Wed, 28 Aug 2024 20:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C5CC4CEC0;
	Wed, 28 Aug 2024 20:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877792;
	bh=fOobyTNBmYNRkdw/1Z1zuwBrFjkelREQUbS8DyIS6rU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kd8U3XTeDsgJuGsJLk1dU+wygEQ1hIunB1GcBS/Tk2Z2xnatmo1hFIO7hhtjCiEUX
	 tU1feFxvu4plM1iWp4LXdJR5B6I9GNknK5pb+Hb+ub7Y8/N1QJg+dskV+mSEfMBT4s
	 Df8D3XPHwpghGtorvNwKNbgH3fbtcbb425luEPVUM529uUHSyS83hw62UbSMePKE7a
	 KJJctu9gOUpJR5Fpx0WSXyqwE1611F/hUtDelZ/C4CP8U1ZhvuC7Zo4MtPqNFZHMgW
	 6A7/yLO5Jb4WLUC8omaZhPq6xxpTOlZWJMHjMX2vVTsrkqzakQMHu5u9MGHdAUWhLU
	 ZTI5O1Uaen+XQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D6D073809A80;
	Wed, 28 Aug 2024 20:43:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487779275.1420116.2505392157430416591.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 20:43:12 +0000
References: <20240826152426.1648383-1-andersson@kernel.org>
In-Reply-To: <20240826152426.1648383-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Aug 2024 10:24:25 -0500 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.11
    https://git.kernel.org/soc/soc/c/ec57571b5dda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


