Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102773019D2
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281603; cv=none; b=HSCDnU4cPphsN9E2pSXCK2SPn8SYiyoFBI9DnPNg1Wef0+Fes1ZQw/FJuK8GbsWpcIDeF5mtNnDZLS+NSr6xaocPLsDC77qoGM2Y24VPiQ9J2YnH2nYSRUorw88lIRzUlL44b22IF4dJst5N6Bgwhez0DDXv1gmaPzCqpxsDS44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281603; c=relaxed/simple;
	bh=cUJNqhGh8rYh9vRuDEcSooPYSqXujAGPYOg45zAwmO0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nuA5PM62JWdlZid4wdYBRQ2IL7KII7JNo0EA3yVwXCiZcuO+5yhROEFxksqDGYaSSHCN8aOknFYyq40yItQlrleUniN4OHNs8q+A3tsV5gCufQruwgD8x/et2Yf5rB3FY+i31wK4qeGNTGQx8p+otMdXcFKRlNbXEsTUrv/j4JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTka7Avc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTka7Avc"
Received: by smtp.kernel.org (Postfix)
	id A97F5C4CEFB; Thu, 27 Nov 2025 22:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940E1C4CEF8;
	Thu, 27 Nov 2025 22:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281602;
	bh=cUJNqhGh8rYh9vRuDEcSooPYSqXujAGPYOg45zAwmO0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kTka7Avc1EEWspKXe6fikt4AOsTX/GVZOskS4mGoEQjPOdHj1wujN46I0rcTpvfLN
	 3LSUH7RmXQ37QoV1q1h3W+5vV42GifAfFVWp65zPxL1upUV2R59gZcMKhc9DldU1PS
	 maoT8yyiL4n4xH4cdWCFxAXBMLWtSyjMCxi+oupRw2dUCOU/z9kdCzv8Jj9BbZ5b0l
	 FiwYZl4+nGz5Ki39IMnOrvtFbzP4vDaQbBY4U/o8xM+xl6vf4mYhrPpKxV+8jdgRu0
	 thuoqkIC/BC5Xuhrg/ZpqpTT7tcTgG4VXuwg5qe+/BOrGLsa8hBI+ytVZnsQhWIAZ1
	 0Tn5ElHzKNODw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B57A3808204;
	Thu, 27 Nov 2025 22:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V config for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428142477.55019.10630704723573920648.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:24 +0000
References: <20251127-saturate-slam-ab92576bcca7@spud>
In-Reply-To: <20251127-saturate-slam-ab92576bcca7@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Nov 2025 16:36:51 +0000 you wrote:
> Hey folks,
> 
> On behalf of the spacemit platform maintainers, I grabbed a config
> option, so here it is. It's the only thing I have config wise this
> time around.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V config for v6.19
    https://git.kernel.org/soc/soc/c/00de4ef9d3ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


