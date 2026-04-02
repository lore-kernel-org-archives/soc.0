Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF633360722
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165433; cv=none; b=dQwY846jwk+PVkeL3TcDcwP57QAVEd/X8bYBAXJIujqgvMLWjPq3fG6LzCHoD3NdikED2Zd49URLRlyINmJPUnerOXISjFVVJH28AkF5MCOe3BjAnowh+B2peTzABDMcjkiDKO28EEKuG3hsbgX2ua2u4zWn9MQHKgEGDejID1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165433; c=relaxed/simple;
	bh=2I0FfV6VGhbI9hF115Flk7fXOA1CX2nFyvfYHRSZl0Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=StjZQZPU8h0cLvXZ4CITb4bXtzByTr6SZMz+WTU4cw6xWBrNv/xzdZck1yNxp5ypf6MIBjxlPjaK1gWIiXU5zYeRJCA2avu/s23mC6ygKdyQt5RXO8YecCmIcHxsQiPRSa5xQIism9kk4Yl7VRyDoXSd8FcCVRipDj6HDob3e64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYVEPvGq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYVEPvGq"
Received: by smtp.kernel.org (Postfix)
	id A54EEC2BCAF; Thu,  2 Apr 2026 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD6EC116C6;
	Thu,  2 Apr 2026 21:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165433;
	bh=2I0FfV6VGhbI9hF115Flk7fXOA1CX2nFyvfYHRSZl0Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OYVEPvGqmU1FKxg9WZQI1BHrkbjM8zU4shmO5yuS2KYxa0MsR9Z+kKmGl1+JQo3+2
	 1Pd6dR5RUuy8KJXmzl1/PpSZTmnXB2saeqRJSdYG2D+7SAvhhTQzSM026RA7Ig5dI5
	 XOgs7gv8RTPK7JYcafs2dDFHET4EkYBN7srLRJvDH5+TdWTHavmIVJM3Xqza8vEwzg
	 iKXvGC7U6tU3L8lSTcDFBpR+cA+RgVov1oWu3TuOuCiNrKCgVn4Y2wWgafUOqDtQ5A
	 W3FuOky3qriZfR1IYHU8ue40tZJMHkZR2z479x1dZDC37O9+oFzBWJ+LAsPZhlA3fa
	 quZ9losOyKvZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DBE3809A09;
	Thu,  2 Apr 2026 21:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516541580.623252.1277952736997589134.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 21:30:15 +0000
References: <20260402170525.2452299-1-p.zabel@pengutronix.de>
In-Reply-To: <20260402170525.2452299-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  2 Apr 2026 19:05:25 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v7.1
    https://git.kernel.org/soc/soc/c/fbf57f25f032

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


