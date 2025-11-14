Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9162A2C21CD
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162646; cv=none; b=Meb15jWQsR4Z4KRLbRV3H0jjoU0Pw8PfpNqY/6HOLO2HwLJTk12wL9ENiJkWfFKq1snP2pCOJ76dgGwD7zK7y/8GeWpN9oH8HdBnmipiy/Qjfr4IeIFZhGDLUyOzKYTmWw+i/jIkw7FoEunJ/nrX7bM39AMRADqDzynxBpQmwfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162646; c=relaxed/simple;
	bh=vDy1+ZMeJQdGptU+ecqT3ZjaOfZEumtqUnD46lie+Vc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=C9HaG4X2h1GYqN99Mb1M6MudMl3mZ8zGVa2DQrrd3sj4ZTZEZpbBXbBi19ztRfF3VhjLkEGK/O1rQCqijJD0IiUjPhibVZ9vuVG84cYGDSqFU0GQaqRGSAkvarNq6s57bMYE3mNj+xJqYCZCO3HU5a+8jGfDSm16RXRIPN3F888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQ2zSMks; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQ2zSMks"
Received: by smtp.kernel.org (Postfix)
	id 20D48C19424; Fri, 14 Nov 2025 23:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBD0C16AAE;
	Fri, 14 Nov 2025 23:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162646;
	bh=vDy1+ZMeJQdGptU+ecqT3ZjaOfZEumtqUnD46lie+Vc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tQ2zSMks/jIn6f85uwe+SO95/pavXhA7sjC5V552HEaQ0/oj52//rj9bhireVoich
	 BkIbTTeBpK/W74qwtTYnmMi+NCVFU+lHAvC2syCroSqHeU6x7U9XETV+u30Ui3xGAA
	 rDL5cpUgvHM3E5Rxt+eOdLiATZhFLu6sEnuW8F/sxcjnkU1x9P2W0y7LGdJgS2hdX2
	 CD1DtOZvL5k//fWcVNX5lMwXbY1jVfLxMb+M5+sChotnLqdy4ME0b6nITQHbIFQHi+
	 d0cwHZaMLLoiFh0PL7yFchbaAE6QEy46SFkYIqRfF9JpZVKuFxvbzqoja0Dag50mYx
	 VUL4HD3/QEa7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDEC3A78A5F;
	Fri, 14 Nov 2025 23:23:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: fixes: dirvers for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316261424.1867843.1012521358828548540.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:23:34 +0000
References: <20251031134910.78436-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251031134910.78436-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Oct 2025 14:49:10 +0100 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-fixes-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: fixes: dirvers for v6.18
    https://git.kernel.org/soc/soc/c/64bdb49f2dc9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


