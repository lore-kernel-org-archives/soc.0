Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751F1F80DD
	for <soc@lists.linux.dev>; Tue, 15 Oct 2024 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729025430; cv=none; b=fabe1/JgfLwWsV3lD201ZfBcbwKnC+2yFpExWpSiNVbKg+qomKnPy/leaP6dwKpyEfFj5Xa+xfJGMBZNhL7iso6orx88urRBm665/ulFr/+2xLnvrdMojUFm5swPRU7JiLBbZYEy9DJ0yCRCbTQF39XMNtm+nGT00nanSmQTZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729025430; c=relaxed/simple;
	bh=bNGHXj0V6Wh2jx0I7e7RWgPfN5dHlC3yy2sQ8v90nwk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HFs1V1Su0FDvpVZAS5FVNRir8VkDaatZL4P0VZUBaOt1VZZbt/R1n2E8QLHAL57HNvFUPLNi1hM9s7e6T5hxdlZMNQaDiAhiBZdI1xTYcuKcD7EoHSroaGxkX3EefnuAagkjNv1fTTwjknNJkw83vIh9d4rRezRvn3HMqh5xjqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcLct5Bt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcLct5Bt"
Received: by smtp.kernel.org (Postfix)
	id 1EE54C4CECF; Tue, 15 Oct 2024 20:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097B0C4CEC6;
	Tue, 15 Oct 2024 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729025430;
	bh=bNGHXj0V6Wh2jx0I7e7RWgPfN5dHlC3yy2sQ8v90nwk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dcLct5Bttgc0nwyeCxXntAGNoxH6FERhbfmvRSS8is5Y/sDMJbze3wqPEMU8oTQw4
	 vmZyRfQVquLkK8LqC5dUQ8sLdFARkIYU1PM+5TNBsPuC+lLOyrdYpF/HR7cvkU88ok
	 xjP1LKIsYw0mKx85xuXA2HLK/0m4UVnZUXpxLlSjG1j4OfAX3bOKzynu05lxQlzu+e
	 XQJlI3jGyWP4AWs0Np9fJapOZfh7YWyiGc1Dsjtcv37CMytysZ1HPFSbI/xccKze+b
	 YzdINYUrwLAhOVcwXDmTJofhV02sVOHGjZOrqw+n6npeRkBBgnEGgvoKTBPrHiMjDo
	 C8FtRm1i+j5WA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CC33809A8A;
	Tue, 15 Oct 2024 20:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172902543523.1289026.6145729968893309361.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 20:50:35 +0000
References: <20240930165733.1541936-1-p.zabel@pengutronix.de>
In-Reply-To: <20240930165733.1541936-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Sep 2024 18:57:33 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.12
    https://git.kernel.org/soc/soc/c/76237ff95bf7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


