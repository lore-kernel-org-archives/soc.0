Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC5D3AA4EF
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352474; cv=none; b=G7WMXudu3clnB7YynwGZXQzlAk+PUwfvTaub19E/4XiQWa/nI3bTPxybVepYXWA8Pg0Nq4Sph6j14RZHKONVriHTtyM9AzKEofjL2NiyJt/hBU4NOIaSB3lVVQ0b1GZDju+7BYOvrcWhBqj3EZOhz4bX08d3Top8OAdvKRHVd2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352474; c=relaxed/simple;
	bh=vIN8zOKVwYPiCdVwtBomVd/f5oQ2qvBAqZJuzz6BSrE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=R0bkCnDMc2FlVg0tNgDOiaWOHxnOo22oQ4+t5oorJ4+OpqylXtNjv8VZ73DhrBAeFxY0KCNGkazojh6gZMCrizqY0UsD2ZMTwjf+mlHV4LxIwofLDeOeEQXUv1BH+S5b7ba5FqtKgNLpLwv01CWoIH7we+zWITgycwQNTrLSB40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kN5LHgrF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kN5LHgrF"
Received: by smtp.kernel.org (Postfix)
	id C552E1F00A3D; Mon, 10 Aug 2026 09:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0461F000E9;
	Mon, 10 Aug 2026 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352473;
	bh=XdGcYAByEDGo7S2pvXae4b4s+Y9jBP+56LrMwkXAmGU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kN5LHgrFrOcdKnVoxWzKgcQrUH4prZ3+1VTkgQmIrtYka/euWgbYk3DqPvdHUc4Vy
	 cGhwgZxQFIpkFClLXSHT8NXbEpqgN9J5qgYHPU8Oz+F/tbxn9gO1RTSEUxLegAqWJj
	 vc/qevOLi2Te6dBv+fbT9kt/l0BRIJkt352ftlLsALUZkMUQ+r/xIzOA6+nC4p/adC
	 dsUzJvB+GzReQITge7tPOuP61Vv5zn9GgCMe0TZGmjlu9ciC/C6nIoR8ldeUds/bwY
	 M/I7ESQxfI5AqIgqBvTAygWGNDwi58lGU5tEeNPW8sb7XDflUdK8FVILGJuE+9UIJi
	 8jXGndeMyvueA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D093F3924FC2;
	Mon, 10 Aug 2026 09:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] arm64: tegra: Device tree fixes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635243039.3658557.5629615689358970252.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:30 +0000
References: <20260802163936.1257450-1-thierry.reding@kernel.org>
In-Reply-To: <20260802163936.1257450-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  2 Aug 2026 18:39:34 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:
> 
>   Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] arm64: tegra: Device tree fixes for v7.2
    https://git.kernel.org/soc/soc/c/e36c0670d5eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


