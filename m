Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD72A1853
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714629; cv=none; b=R8logR1M6dLiG0tf0fYIkKOroLZbGuEAI0pD9zoFnvr/dKSQuNiUG9klqgvv9zp+I7uuPz2+KaQ5c1Bd8m4I9gTlocuAIinu4VCkR1Xzvk2o4QM67eAtdM2ZPxaE9Io38deN5z+s+HiGzbYZccJtbEyCqfYBAvEOelmJ9qEVljU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714629; c=relaxed/simple;
	bh=Q/OyDJiIKlmrD6FoQj9yv0t1mXM/lqp7sOXfSejOgGw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bggm6406krCNZH3u/3+m+QuSpURMsBC84E9QUH6tIaTakhgu0NFuQ5/Bej51EHzuYMT992+VOXMKeo/F3d4/mYUkwkZDX3xBPC5WC4nol93Sn4DKN5tzbT99isbeLhTCZyck5T0teF6C6s6YAOEEJdxAsWc4yf65b6K+Nndo+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rb9jr0Ok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rb9jr0Ok"
Received: by smtp.kernel.org (Postfix)
	id A864CC4CED3; Fri, 20 Dec 2024 17:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93095C4CECD;
	Fri, 20 Dec 2024 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714629;
	bh=Q/OyDJiIKlmrD6FoQj9yv0t1mXM/lqp7sOXfSejOgGw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rb9jr0OkB84sZdP+hYxg2Uo6S/DZxhVLCQ5wr/smk5WjuCakCo60JLFCg1IZ3jE5e
	 cunlZaTw8o/5VrrmpAPgcMB1BrHhOstpfnrPGPf13B0Nd8hN/4TlTIqu6rZa9gRkvf
	 +nfgyfhes+jCy30/YwGp1sIyIfBOfJPpMOXfAkcK8cKIro+gfKwv5Yt/SSxjrgu1PO
	 kvP2GKMbikeNuh/AaJPL/nS5YSuNjqh6SEyTTZ4/J5T50tfp5Q4lK9D6rMruFcuIQ2
	 SHmABNIdbxeHY1LjW4aOnUsN2zeXGW50c5pLsB06IGfQei6oafIyBF1hA+zu4Eojeu
	 e/GrinGzfmrSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE45F3806656;
	Fri, 20 Dec 2024 17:10:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc driver fixes for v6.13-rc4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173471464724.2963436.10133748248942850361.git-patchwork-notify@kernel.org>
Date: Fri, 20 Dec 2024 17:10:47 +0000
References: <20241218-suffrage-unfazed-fa0113072a42@spud>
In-Reply-To: <20241218-suffrage-unfazed-fa0113072a42@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 18 Dec 2024 16:01:41 +0000 you wrote:
> Hey Arnd,
> 
> I know you sent a PR already this, so whenever you're sending another
> here's a patch for you :)
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc driver fixes for v6.13-rc4
    https://git.kernel.org/soc/soc/c/a61dae110138

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


