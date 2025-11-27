Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CA52F39D1
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281604; cv=none; b=RUviDdOrF37UP6x+4oAXv8HL2cA8wbGpUD1144WEmveeavLUIOFdVbIaXAkPE1IlFh5sjXtorshnHyXsuJK+1DTNbMk23T0hu7CLIIsitALwBS9wNcBYk8LT6sYNXWlRNXy6pQnjDk9hu5FdGwwrD/WR6u1M+grHwYh7Hesxyn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281604; c=relaxed/simple;
	bh=vXQy/i0NoDVsKzUxUquJCM816FiCdOCxnXW7dvJNvuk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Y+BUhYEBga6sT+F6UBbZjZTtYJO5BSXQqloMH/g5ZDjNBkUGFWmXKgpHbuHDl3hSrM1yZcGp0UWMyCkw3seD0W4xfRpkhNvrAbv6+xNzAOYciTa/PmMbEV3HaWe/afH8CHaAypHTz5jGx2K6it88WU5TcPY871bexumlnIjXR3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcQ1Q1LG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcQ1Q1LG"
Received: by smtp.kernel.org (Postfix)
	id 330EFC4CEFB; Thu, 27 Nov 2025 22:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D615C4CEF8;
	Thu, 27 Nov 2025 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281604;
	bh=vXQy/i0NoDVsKzUxUquJCM816FiCdOCxnXW7dvJNvuk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FcQ1Q1LGhhRoFybIX8RgXZZT4musFEyr6Ib1Hw9DPMqAqitQBcqomAVB5I4UlNfDM
	 cYegpYKyUTSiw3sfZ8ABTh7HbBl78MLdYDPiDPzx93I1BIOkZzKHJ8CVgtmJzV+6lu
	 An1lx0HXw1ifDl6S4VwFH5UnVcyj52zI8B18LQlOXf9TSBWNA9kj0sUEPyZxMra/PZ
	 gzYehqfXkl5gwANvH/Ah3hmBtLqRxvOTKz/hziUkLTkI7Ws7nnA/bVjbwI4DsdpVJq
	 n6JLDThCPedu3w47MYySpzHGUpZmZ6LZMV1DFP+v+1xpNmCgZnBYfzPJWx+vVVaisb
	 jEA3HwEcYfPkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B590C3808204;
	Thu, 27 Nov 2025 22:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428142627.55019.13110504540237883444.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:26 +0000
References: <20251127-unthread-probable-75bbd4e737f5@spud>
In-Reply-To: <20251127-unthread-probable-75bbd4e737f5@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Nov 2025 17:21:12 +0000 you wrote:
> Hey folks,
> 
> Please pull my devicetree updates for 6.19.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.19
    https://git.kernel.org/soc/soc/c/3aa9940035a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


