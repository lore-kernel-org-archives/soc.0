Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E6429811
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380679; cv=none; b=sWoQKLSc+5gLRVcElid9O9CmbLTdajEU+Fk0hUiJlpOZfAvQ00ZBEp3pP9HVdCX8w8ecOR0+dGv7d3CyGwdWDkMSNOlBWqbawBlrxiGfPHZwpFgUoTuK7+9wCXmTv2o9OnAh0WDTAXvBMmvglP6LUmSJEpDy/Y3V/dSGZLk33LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380679; c=relaxed/simple;
	bh=P5TKprJSeC8AcXP2EarAKmh83NdNWye5m/oS6Gf8xqk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A21vkXZIHg3gIoS5ywOLG5XbZy/tkbygGuGpLM90i5cfZmgWu6DrRWLp2cJGJ4NdQwsuylqHPXqQFJdMjjT+TiV3cbCeI7K4Yo1onC5DIGRBSJPKuuQp+2wJU/tuQbdVCvg0tUFd4U3jTWKMnIJD8SOwb8yfb+aPT/ND7PsHe4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GE6v1jFg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GE6v1jFg"
Received: by smtp.kernel.org (Postfix)
	id 3B48F1F00A3A; Mon, 10 Aug 2026 16:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F4A1F000E9;
	Mon, 10 Aug 2026 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380678;
	bh=IQOYTPTzPNSEK8CsWxQdVOVjwNlk383UZl2GBQ9mZqU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GE6v1jFgTJVkuFQ0RyC85rWwspai+39I/9jHpYYPDK4dSLKajqoFZo6PjDEr+iWvD
	 X0b7kcbiSQrunkT0ItgvHwDOuNQQzQP9SsP3d5aBTBaeAchFxAo/6YSnpl1UYVKM6q
	 3VY8wxXgVI21av43LG6SS2gk0RUpsZ+YJArsTjQYF/5KuJ8MU3oRasVpZSaDzeafXG
	 eoJ3L8fKljtoj1nzAKjiygtZcUtNfx/PoiHTYEeZ5ohj6tgWlNVrJ4ebvZxzxRQqHn
	 eLGluywUMaZD69DaBRs6nqPfGXvPAgFv/Tv/Rrc1Fcs9qDE8FxEz2X4witLyuNIn6y
	 RdApy6OafGENw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1980139253F2;
	Mon, 10 Aug 2026 16:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638063463.3872609.16588179813948603007.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:34 +0000
References: <20260807155035.603563-1-andersson@kernel.org>
In-Reply-To: <20260807155035.603563-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  7 Aug 2026 10:50:35 -0500 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v7.3
    https://git.kernel.org/soc/soc/c/f809cedd3f61

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


