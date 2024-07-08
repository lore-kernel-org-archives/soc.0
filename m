Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670E0C41513
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AEC3C4AF0F; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34EFFC4AF0A;
	Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720449061;
	bh=NpVKLX3bQesMQ4pz+vO19hhVKYzH74xNuB6eDlmXatw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JIrJCph88XkUiLdJegI1VepaCUhC5XhTVaX05KPYUu67UoU8qm4booSa0efyAgSkO
	 dqOvtdW9DOTmR7SlQoBvpVjEi3i4ZlvLzSXrN6iqguhE2FaFap6q5e66K+2ElBvQQH
	 49yQKNmF3X4IRUUwN2mIcAmtLQiOxxHrPzuZu8EIAdgiFyLT+TKxlHNVTSw1O+zPSf
	 SNAfssljTWMSHRjD1ioaf7ZPK8ypaJuLxxAC8CXY+SWdKSiHQ2QTcnR1KzS04urC4Y
	 y2Z6ES39M/wpLfAgXSpM/nqqSui/GhxdcrX03+GHTYtS2bJsMYHSB/clHIXPLwPoRu
	 NbLG8qJXkWD2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23D0EDF370E;
	Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172044906114.22805.4049421366380567381.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 14:31:01 +0000
References: <20240702031157.341031-1-andersson@kernel.org>
In-Reply-To: <20240702031157.341031-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  1 Jul 2024 22:11:56 -0500 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v6.10
    https://git.kernel.org/soc/soc/c/d8eb522fa3c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


