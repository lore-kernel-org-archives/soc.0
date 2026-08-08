Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596271A9F91
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220504; cv=none; b=SdJh46N/QtlepxSlgbT1HWLD9mpBEZex5IM4+ZqXhKfeCLGxwjlO35gkQ+IzGuCJ1GnlAcjZWQNmqQy8FYLApHWd6Drhjw03HENqbNuaA+gcyUn5iPSl9EmlBvEKJD6UviP/MfBeH8A0softlLBC0A6hhuLNoy1W1DxaEovYDkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220504; c=relaxed/simple;
	bh=8xLeiSjxxU8tHS5os68qgEnDkuyjsamJxn01VVROTZY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cKSYAabdWzZj9liLnt4/MbWd0iOMnfKtmhI2sk8jjEhXz5KiT+fDjaWVl9eLLrLs0WNoCkYCbOtLw/UTwfzcrw5ZBjO5Dn6FOXKvrSJsIdDXO/DadsR/s76cbHZzvySsL9tT+ghD9lxwMWDC72ERQV+i34gfAiYvMcMOVWyp850=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jP7JE60J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jP7JE60J"
Received: by smtp.kernel.org (Postfix)
	id 0F00A1F00A3A; Sat,  8 Aug 2026 20:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4D01F000E9;
	Sat,  8 Aug 2026 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220503;
	bh=r9qkXCS4JFC6Ec1xLyoXhhmhKwn7s5cd88eh1+EBIyk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jP7JE60JzjsMIwInXDCS7V5oxlic4p/syJy0KLYVYy77HY8i2rMTnqF67X8nfa3gB
	 HMV3LphlpfOBjt7q+UaTNJeSq2/PzSr2r7Au21Sx9ni0AhBYitt//cwm+00JwmblAK
	 ztCRaL43Hr/voevuKR3xgKINa1cvxp3Hx/geTe1Q8ZU3YvqykVLh4pSRN6CeHMlwbZ
	 cvkNcJCodMvgTrqwy4+BSI3Pw2f1pZzImNTvX9XZZcIZNLjW9FiaSYZElGvCdKcPz3
	 gNP6RYQiIgSnCTOiPTPa/mUrMj+RgLj/CJ+d7hXC0c1t1fVJBB2bqbIK3xcUdXgUhc
	 O84TCInPLJNAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197C3380CFFA;
	Sat,  8 Aug 2026 20:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] nuvoton: first batch of arm devicetree changes for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622046063.2748994.9436312466729002110.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:21:00 +0000
References: 
 <47b845574cb6242d0ef08de910943775f150f67e.camel@codeconstruct.com.au>
In-Reply-To: 
 <47b845574cb6242d0ef08de910943775f150f67e.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 04 Aug 2026 14:39:14 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] nuvoton: first batch of arm devicetree changes for 7.3
    https://git.kernel.org/soc/soc/c/ef59e0711492

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


