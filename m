Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4768204098
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 17:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973401; cv=none; b=HGQz0K3BVyPCDn/rSPwcrPxQytEjsHhcqQ0NkwHYi9PeBz8rSsXJq8NarcF3lVZVp9Cg2oHBVZkBxjE8hAV5NO3I8XrnAVTkco5B0NmFyDqEqFqInrRD6W2Ie3zFMCmB8fD7bmSs4bZc9jODxx3zLYcrPDloyMB65O7dXqCuXX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973401; c=relaxed/simple;
	bh=5Bp3Ys80QAhr5/27C9Nsnvxi1rftA1T3rdoen21L8U4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=L+zV6N2vMQ5s3W3DAd956eF9WbGlspXXEQBbRT6aObDARoI+ym3NQAxD4FnHE/Fz7eG4mf+nKnOv5y1G3nf3qsHzEqIfsmJHeX1BDQI52HoKe1eZe5BNrtGm9oyh7fMQvJdCbprutY5lTSpY29AlupKv79WO0znmyIpup724PmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQQ5+5Iy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQQ5+5Iy"
Received: by smtp.kernel.org (Postfix)
	id 52410C4CEE9; Fri, 14 Mar 2025 17:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3826AC4CEE3;
	Fri, 14 Mar 2025 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741973401;
	bh=5Bp3Ys80QAhr5/27C9Nsnvxi1rftA1T3rdoen21L8U4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jQQ5+5Iy3khMdaEbKpz34cvCQ9j9DAA9tLIfAEnIV/+/CCh6Sft+1OzzWfKsgYWyl
	 Ii3FyXEQUvki73jqCskb2X8TKW1Jz6YTUEYSPvj+XhkuPrTRXvb6lXzh/7uLAy0xN/
	 KSmBj2GDFmfnDjcwvd5dSHrtTkNZ66vCaNjVxy4FLs0s0HmlcKPBLaxEzntGtFF7my
	 r93pwbzAh7Xt9ZsJrtq0T8LfzK+G4yi9WRudSs5yltu7eEI/81QfgKiuCG6WHbDM2N
	 t1CaQ7i3GHZnMYkvD6j1IxOggbrJTZfdCzFFHEhUBqDspge56lNNeAkyYDP3pGzBfF
	 +Pv1E/UoJA25w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345E1380CEE2;
	Fri, 14 Mar 2025 17:30:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] soc: hisilicon: kunpeng_hccs: Fix incorrect string
 assembly
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174197343599.2324103.13565962270396715990.git-patchwork-notify@kernel.org>
Date: Fri, 14 Mar 2025 17:30:35 +0000
References: <20250314100143.3377268-1-lihuisong@huawei.com>
In-Reply-To: <20250314100143.3377268-1-lihuisong@huawei.com>
To: lihuisong (C) <lihuisong@huawei.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Mar 2025 18:01:43 +0800 you wrote:
> String assembly should use sysfs_emit_at() instead of sysfs_emit().
> 
> Fixes: 23fe8112a231 ("soc: hisilicon: kunpeng_hccs: Add used HCCS types sysfs")
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> ---
>  drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [v2] soc: hisilicon: kunpeng_hccs: Fix incorrect string assembly
    https://git.kernel.org/soc/soc/c/262666c04be6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


