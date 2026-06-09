Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453923EA8B
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023244; cv=none; b=jm/kwhKncy92t93+NCjl7qjVR1B1vd1ygGaQyv50rbYFw4Gzo26gszdn4pFJPuClJRLljHPtNYwOp/GR/DmaijNRBFMkQBzUrM8n1CZrcHMqwlaf8TyGLeCxqVuJ2yuja0ZPCWaP16IUEBpdyzbbFtfWz7FGblSO19TtYwUM3oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023244; c=relaxed/simple;
	bh=OCvFxoKnmtRP1/l05bh43+jrUQXomlq+s9nImWdFsYU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RPHAi8UTtIH6OGnE/qyTYTr81WNTz3RA2GUuYx0DQi7BWyySsJzmT45J9R6PWk6Tke8/0RGkC8l22EWGQXKfeagQXrg6BIcxn9gkl4XHFBiBgbVEBChL0p3FdkFvDpq0CgYMa49RH3StDofbbPf5Iz+LK6UE9J6Zxpta+id7J5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMWoCvbg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMWoCvbg"
Received: by smtp.kernel.org (Postfix)
	id 20C2B1F00898; Tue,  9 Jun 2026 16:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A28D1F00893;
	Tue,  9 Jun 2026 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023243;
	bh=czgH8ROxpzXfRvldp611w1eTPin93cDXk+WQrFoo2Po=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fMWoCvbgWdY74eZ6HFzDpko+4/HOldIUvYCSRcK2GxzAy2X/0GXwO4YaBbdrLn87q
	 hzeNagI2ApGUucHwxq/uAKLz8k7fbX4lv5HZbJW+NJ++24wiiaVyhYM8tkYGShU4p9
	 z9nl/YLSg42+g3/Jh4IQcEs5ydLgY7qK3puouCRDM6J6s4JZAhiwaJnmQuWEcM3YJb
	 hbY/FSFAvxIqAc5HHx5B7AfRozSvi7oPlSWaEQ8jkFeMx557yH6Ab0uql+aKULDY+q
	 fVjeyemvH3X2ARezJzYiOOye4HVP4oM2aFGsnHDuBpFoJfQOjMoe1KS4yMnFeexRhN
	 V2RqHVuk5RwzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938743930989;
	Tue,  9 Jun 2026 16:40:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip RISC-V soc drivers for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102324113.2135346.15677925240966133214.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:41 +0000
References: <20260608-vacant-slit-9499ba5eb8f2@spud>
In-Reply-To: <20260608-vacant-slit-9499ba5eb8f2@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 8 Jun 2026 12:16:19 +0100 you wrote:
> Hey folks,
> 
> Another single patch PR here, this time with a binding change.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip RISC-V soc drivers for v7.2
    https://git.kernel.org/soc/soc/c/3659b131999f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


