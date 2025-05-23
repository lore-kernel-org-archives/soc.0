Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD64D1F1515
	for <soc@lists.linux.dev>; Fri, 23 May 2025 22:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748038311; cv=none; b=rffb3ZcYbYxOKf/7Vp5lVfun7aqfoj+IGX7BWwt+K5eDdE8bCEWgMEgVs3G4iAP4v0HE0oIZZJqPYhhbY02Az3TtOBMq25dTQxdL9eAtNU/vPwWPhZBOEKnv9/QReWnVDPMOiGTUIOiYzgz+d/STnn1iA3zH4pOJHtv9cWTRW5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748038311; c=relaxed/simple;
	bh=uUXZwVN9D9sxXGHZBHN2TvtPAv5hsZTjIaDQ1FgnLYM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=R/oViRe7RZuIiL17xeQCGqRERlYoOG4CzqL+Mapdn0prh+a57F5oqa4DYkCqeBBbWv4/pv0EMuFNtP/XxrwXlPmWj3H1g0s3r6VrsG3Z5RZbuLy9ri/ns0s3CT9irxglZljL42GlW1MDkrZuSs+nkfapQs2vMgwsX4TX5uetSMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aa8ck1DN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aa8ck1DN"
Received: by smtp.kernel.org (Postfix)
	id 9CA25C4CEF1; Fri, 23 May 2025 22:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872E6C4CEEA;
	Fri, 23 May 2025 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748038311;
	bh=uUXZwVN9D9sxXGHZBHN2TvtPAv5hsZTjIaDQ1FgnLYM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Aa8ck1DNInHDtCyQS3AH21gnJXUYECd4EksRJDpXqJwLzz9Uuh1fs/l7tfV9o3+6c
	 1MTKdsk5CpznIpSNsJhVNJYUq5cLkfQ0A6pRPgGOh75w17C2QdFCDPXcYnPKQ3++8E
	 9LMkYa5onjd7LtPmpIaqQhhsDdF2jwWe8FcKdYg1+5nYK6Ew4TLEVGtoj2+tlBCRnO
	 oPVR3kmZhH4BcGXFawZ7J11M8Kx6wbodHDWoSgP1yfymZlVZtgXmDMRi9jerHboQfh
	 bj1c7pHF9qvJA7Hz7jSm84TZ11W+cgt9Rx7jnpDTSkBBR+OMyRQXkzUjIK6Aq9Xpud
	 cY4XykrklSWQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADD3380DBEB;
	Fri, 23 May 2025 22:12:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174803834675.3742914.12586448566370506020.git-patchwork-notify@kernel.org>
Date: Fri, 23 May 2025 22:12:26 +0000
References: <MA0P287MB22622FA23ECF9B9216735FA0FE9CA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB22622FA23ECF9B9216735FA0FE9CA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 May 2025 08:54:42 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt changes for RISC-V/Sophgo.  Hope this PR is not too late
> for you.
> 
> In addition, I also sent a PR for sophgo/soc last week, listed here for
> your quick reference:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.16
    https://git.kernel.org/soc/soc/c/9bba618694cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


