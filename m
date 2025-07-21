Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C518DB35
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111910; cv=none; b=FtdPLxAAXLerD6mD2MxUr7Sq2vVEKNYdFVHBHoUphW1rQXA/5MJjk57Zbrbw6+/H3NJDMh4pgHT7KeLoV4wV1+A/4vGQ9UUL+sFu2SvWDIfpjuhzpk+wne0y0rw9YXb5ZfnDTkS2JMc63up3oBbt4073nom3nG2xvPGySxemDlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111910; c=relaxed/simple;
	bh=Q8O4LTvwqXPT/NnZ0kqVghCS375PUukUMfECRnPbAp4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BzhEbdC8UXrDrrDwbrclsxwNgJv653QkW+OCyfiP0ynPipiot0HzWBFesnTTtYADrRSwlk2TgUqtvJ/Fr/Wj5Urw72KUewFathRgwh3BfzJaM8+KyVbRvslYOfRtkguu9H8edzhMbCvc3VG+orXKPaxDLJ9rvdW4jRUVKrD9qpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRgiokK6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRgiokK6"
Received: by smtp.kernel.org (Postfix)
	id B2FE6C4CEF6; Mon, 21 Jul 2025 15:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D79BC4CEED;
	Mon, 21 Jul 2025 15:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111910;
	bh=Q8O4LTvwqXPT/NnZ0kqVghCS375PUukUMfECRnPbAp4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FRgiokK6s0NQwRVCJ3AnK/jxJDvdq9KiuQ40WAJ17kwEx7YEWCFkdLr2Uh7Lo/Ejw
	 DNeohUY5sC+EQDeT3rQjK861DnT8KaRzq4YOF4HdUTuF+kyktKurempiA3SJ1qcqvu
	 7sr4qZXsTMZPTa82CqpBlC0LDm0YF9nxNXikUxcJmeeSrCMY1BAPIcflJHtJLRgalN
	 67M8w1X1rxDPfo441vuqjxoR2ZXgnXQdhgXv6p02xpBhPWcjL7ePPt25lwjrMsYDGc
	 /eezAViJla8GvfNayH+2qFynyEVErMPPZihQFDvlUNQywquH4hJAG6uN3vWcZl6Pc+
	 wtxQa9KKDUOSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF4A383B266;
	Mon, 21 Jul 2025 15:32:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311192949.94241.10389037030262842953.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:32:09 +0000
References: <20250710152513.1346298-1-p.zabel@pengutronix.de>
In-Reply-To: <20250710152513.1346298-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Jul 2025 17:25:13 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.17
    https://git.kernel.org/soc/soc/c/ed82b8d6574f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


