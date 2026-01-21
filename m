Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B31F1B4224
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011236; cv=none; b=Is+LpZLAl0kiEjux9rgk+i9UJztItM7JwVX2F9iMV95w69WyquiH0vzlLNh5pH2/gq/2jVNO+eb1Az9UfTSpNRAtOgfXcx6t6B6w5TvJM8eQmB8Ih9kZadzejJWAZTHuofM6FgoH4N67GQO+WcBKnJBXsV4QYRiSIaOEezuWw2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011236; c=relaxed/simple;
	bh=0GhHrV80QpcQ4v+lSA7fyK2tq9yBBCehenSEYJVLQNU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=P12ksf76texFqah0gcajBL7KGt8YXuGY65CMMwSWfp80+qCt0ATMXCyczUZQzmVjg1RdhhQi1txJlcgjy5fDNoCWr8V+jGxLtiWMIX935hphugXzqu1BabxhTXsFUwdrVGmai8pfzeql+8S2zVCvJs3BzGHnuVHC9+0gtm0//d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAToYVEt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAToYVEt"
Received: by smtp.kernel.org (Postfix)
	id D6DFDC19421; Wed, 21 Jan 2026 16:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C77C4CEF1;
	Wed, 21 Jan 2026 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011235;
	bh=0GhHrV80QpcQ4v+lSA7fyK2tq9yBBCehenSEYJVLQNU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cAToYVEtwcFoVvvrfIDFTzA2a7ePP3uL3JGj4A/H2BRW/ADKXeGPssbE8Gpji7wVZ
	 Ut8xH+UKy1RHGXCq4ETuh0/4eC/443YsLBdl3tgSZn1tcNJ+Q8ChoFMH8CvjzzKBVv
	 JpBmXe7cuy6o6iVLFv31swgsEjxrY0Aj7EMm46LFEUtkUsWYBvsyzUcFAFa9jWLsDZ
	 e+os/mVK/XouueSj/JTX9/PLEP/E1cd6aUWsh9gSRp9VeTawcNOHZ6mi/fnvVbSJiw
	 Iisrjb47CNGSMvbkTwRLANlJzxSl9qCLKU5AN4xI45IUDcKar9jYyoJAba94uXtPW2
	 9GmcpFClWZ5YA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11AA93808200;
	Wed, 21 Jan 2026 16:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMDTEE update for 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901123259.951664.4546522645990213.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:32 +0000
References: <20260117123522.GD255115@rayden>
In-Reply-To: <20260117123522.GD255115@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 17 Jan 2026 13:35:22 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch removing unused return variables in a
> couple of functions in the AMDTEE driver in the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMDTEE update for 6.20
    https://git.kernel.org/soc/soc/c/4b45c2f3f88c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


