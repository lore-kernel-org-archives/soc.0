Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243FBCD5BA6
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 10:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C882C4CEC7; Thu,  5 Sep 2024 10:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC48C4CEC3;
	Thu,  5 Sep 2024 10:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725533429;
	bh=mVbgNsplp6zGuGuVaioUMK14gfXWZ0dSP3j0LRON5ik=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ff3ZvJLwXVIgtdTPFF0gk1aKs2xSWZ0ijlirjvx5hM66V4QtJc3abQNdH+QB+VMzl
	 VzMT5Gofhb7Rt1Z8GyskERX1vl17Ysv5fl8xUWouSDpfhsqwN9tm4Ry3/r5kDrXRuk
	 D7lfhILRAmeHF/s3GMJ1xGjqmPQa9CxxWnHvSEy1bFUNbgHMgq6KppXtY+sMSiSxBI
	 zv75sCburrNu1/DEvo3dZHE4NTYQzPeasAsNZF7ZPDQypNYGYS7ZZCgIcpGHbDgR5O
	 tdorzfwHRjGN3KP/sB12RkIRc6iZeq616a57XwT6CjhVZJLMvgFVlUqvQxZ1McnDxU
	 /Ai2w8icukkNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0A43806644;
	Thu,  5 Sep 2024 10:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] One more Qualcomm driver fix for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172553342976.1354535.11490953453683538622.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 10:50:29 +0000
References: <20240904145214.4089-1-andersson@kernel.org>
In-Reply-To: <20240904145214.4089-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 Sep 2024 09:52:13 -0500 you wrote:
> The following changes since commit c158ceb826068a8bbe3c9e78df420f47ba53c8a8:
> 
>   soc: qcom: pd-mapper: Fix singleton refcount (2024-08-21 09:50:48 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.11-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] One more Qualcomm driver fix for v6.11
    https://git.kernel.org/soc/soc/c/95fe795c2446

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


