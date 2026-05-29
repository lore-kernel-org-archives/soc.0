Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905C7377023
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094424; cv=none; b=HRDrlOiyZ2J7zpkv6ir9uKDsE0eVBArh1QuP1cjacBlXESpAZmCIaYFUvlR4dkeiBNaKnyjGsqie7HbJgtm6/q93jm4H2YSG8aJhgbv288LmcOhqI3rahFlxpzogOqn9VO74RDkm3GFgQrwFI/oYXQU13HllG2xk4FAVwUl9N6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094424; c=relaxed/simple;
	bh=ZbMjWiy04NdZcRU2fPBiFh4Zq/jJ7YDZJJTyZvV+oiE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lj7/rXKx6jAWq7APRFQeMevJP5Ym4L0Tl7/8KnDWnlCywcNlZwszxUH7vjwijwZG0LpVGhAt3KfCa9jZY1nNsNiRdBGykFuL+Pi3p8HyZnrkl6JajQjl446QXidAf3cXPNzdKIY54L0gSHPP4DP2GQB+70MCTAhLhS12/AGPpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOUNyXy0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOUNyXy0"
Received: by smtp.kernel.org (Postfix)
	id 8C9AF1F00898; Fri, 29 May 2026 22:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EDD1F00893;
	Fri, 29 May 2026 22:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094423;
	bh=wamibl0ZhxDAQNou42mJKNf1Ofu8s4dLRhwWsfiKBpM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UOUNyXy0eurJWCjDhU8uCzgW0Q+/mshPYXiilLONRyLuDfj74126kpJbK9QWnZ3mf
	 UfYpEB7DwiKddKNlyIxRO7BGZ+aQy4iA3W9nWknecPkpDnZzUhVYjMJC7EhDtsOCWP
	 ZNgKKPiM66omnVuCtVXNmXQFfg4/Oz5KVVY1ElNLC8TVBmpjwvV/XLxUYZZc/cL2gO
	 mJvZgFdWFSp6R4ShOi8F8G4gxAFxQalo0pyTu8RCiHqm7iDVJxRtbVH90EW2V3HGqz
	 mU/i2htnNN6SpsIDaVYdoHQCi/8U3/8AMWn3oG7eBCUQXk7SfQsddHHt9IQaWNCvQv
	 1Xb34u2+tHnWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A9B39301A3;
	Fri, 29 May 2026 22:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMD-TEE for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178009442688.1985625.7406236625307760192.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 22:40:26 +0000
References: <20260529111153.GA2532355@rayden>
In-Reply-To: <20260529111153.GA2532355@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 May 2026 13:11:53 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this cleanup patch for the AMD-TEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMD-TEE for v7.2
    https://git.kernel.org/soc/soc/c/1e09b55daf1b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


