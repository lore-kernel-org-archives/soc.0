Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BB41EEA5D
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 17:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973400; cv=none; b=fN8JmfS+0+xbu749u2NNvGj2GFgNA5Bn7WP10sZ9LeoqbI0fdc/mpf9xZ04AwVyqhOnot3GDtCJzKkGkMcrFSrSyvutoJ5BtcQxHoVggddMmbyOakSxO20srPatvLrRNhRN7sS5c75dtypwmJortmy6J0oaeGhFqOnA1Z2JfeCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973400; c=relaxed/simple;
	bh=ksMpOFRg4P9OOK51+AITQUb0FUtgGRz6R6e1GpBjfO8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gw5xAWqca63v5MptOqtGdKsWtseZCnMGnOoxMpZSd9iItZc819uxZgYAAGDSagbIrJ/tL6/8qTPR48ppKaFSMSGanweLUQjLeblgCvMpSFkNlN2GWTjGk57TlacU2pqUfUwMBgh0phtaAVR2Idhk5qRldEw/jpfDbh+d6T/q5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEE/VMdu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEE/VMdu"
Received: by smtp.kernel.org (Postfix)
	id 1234EC4CEE9; Fri, 14 Mar 2025 17:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B90C4CEE3;
	Fri, 14 Mar 2025 17:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741973400;
	bh=ksMpOFRg4P9OOK51+AITQUb0FUtgGRz6R6e1GpBjfO8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lEE/VMdujwWlvpulWy+FNDAYMa7woi3Fsad9HwgNHF54M5P/NpMh5gZ0x5wufa2NZ
	 TufNNb3bxvYyf4jzfiPSz4xv6AzFOR2vDj6nBF06DKZg/smUHOJ0nC2FcaZ2qBhmS3
	 ZiYvKihi5ThuY1DXjQf1k0z5c8NBeVEJOetSp7KqQEfgADnUn7KdG/DhyfxaU/z80o
	 tvVKMBz9S1QYEBqPPwUYVe5J4Ff7HKq3Paf6saTHt3a1S4RNyS0vJuU5+0mOa4tFfN
	 6+IxBUP1eFUoZHo+5zYTEztphTS5n9nLD1tcyY5eUCiVcWdKTxHUogI8p5KrUH2qOB
	 W2nHywEd427pA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBC78380CEE2;
	Fri, 14 Mar 2025 17:30:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174197343448.2324103.15326902359938019082.git-patchwork-notify@kernel.org>
Date: Fri, 14 Mar 2025 17:30:34 +0000
References: <20250314164401.743984-1-p.zabel@pengutronix.de>
In-Reply-To: <20250314164401.743984-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Mar 2025 17:44:01 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.14
    https://git.kernel.org/soc/soc/c/5c81649d7042

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


