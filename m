Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CFF39A04A
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352488; cv=none; b=GrXzey/4mHwvwXWD3kDwyOIZy8mEHdgPvWI+J1annnhUAy3tmW76lm4IyTWnBPNQH8x701S/XxlF46iBmhv6juhtDV4q1uEhs8DM9St59PjVo+SgwgRVnwaFbs0IsEY4lzBX2G8ZGEV1cpplO1QhMtkw3vfYaOZLacXUBRXZyk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352488; c=relaxed/simple;
	bh=AKYDQd9NwAHvgNz2uvcfUkmVn9WG/DdpwBybVmWUno8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KKGOiY9wSf+SlRY6QMtIg5M8yEWzzxtxGpDIcsWe/LAQ1bZZPpexWw93/XuOl21/STL2w3jDX8b9UjuLvb/n9d9CHjFQrPoEtQ0dZIieEsQzRNzn97QIUuGSbaWVVRDhMKtr8RUKFYyGLDJ/84NuFsazX8TbXLlLfGjN0EiFBWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNw9AD6g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNw9AD6g"
Received: by smtp.kernel.org (Postfix)
	id C63301F00A3D; Mon, 10 Aug 2026 09:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01841F00A3A;
	Mon, 10 Aug 2026 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352487;
	bh=4kcRtIScDM+GWh50sWr3t5ScWHwgg/LBwCY/nrXjwEE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KNw9AD6gsU1l9XveEVwTRsDfRVXXZ47Dv8eOQ+K0kJyiLtSvHjFUEETX+VZQZOr7x
	 wnly792RRcHRxonWQoNMIodk97R5/YMfPFfPyjgDWUGe3z8syK2PwrU0/X5y2mxC7n
	 Z4MIgossxKjUT3Q+TvDuE9UpK3kXVwqYC7KVWO6HnOu7YF2bMuXL0bcsm5awsWiwV7
	 G/r9LW/uOWvxpNwHWYNJf/DCjlQt8Awl+QkVPgyJNXMihNLxBw7awHPR89fo+rw+TE
	 xJP5YBm/X9lVdE5ShSbNV2QKd5IHAsdSKch95OOpXDcBc9ksaIIOs10KGzOM1Cf479
	 Lk4LhIiVEV3Xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A403924FC2;
	Mon, 10 Aug 2026 09:00:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: ti: Driver updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635244438.3658557.5578779909578689485.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:44 +0000
References: <20260805143716.gbr73pwvengxycr2@cabbage>
In-Reply-To: <20260805143716.gbr73pwvengxycr2@cabbage>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 5 Aug 2026 09:37:16 -0500 you wrote:
> Hi,
> 
> Please pull
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: ti: Driver updates for v7.3
    https://git.kernel.org/soc/soc/c/253ea5efea27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


