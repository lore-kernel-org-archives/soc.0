Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940F3702EE
	for <soc@lists.linux.dev>; Tue, 18 Nov 2025 21:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763502647; cv=none; b=BHVcvoilYyuNtH6sABXZUpsIiuO5UGIhh/j5kiTZl8UMKd8HicI4Si65KMlE2zSJQVqFMx2Ut1/mo7dAP5ZXOB0a+AK7S9vCi7o3I4GgXgN+UsUOBCYnNzTlWGNYeJOfZ7vvvnAedHsBdwUYZlY6npqpDn0H+zo9HLQiy632Hsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763502647; c=relaxed/simple;
	bh=ML76Iy4wfuCGRXMxNhYr+8mVt1PpN+np04NjRm9LJUQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WE1Ky72ialFyjJdMu4fVdhb85vLPs1Dcva6jxeNpLX9N7u97bwqIfZqKrxCYSzUx8j0NscDDdtx6pmm9Ep5jFti2cIFP3r7AIeqWgrsojhJKATh/ZFWTcnIZVTqthjAmhcjfnIrEIj64lsq2rb684xpKU/uIHoYw1uLUF30WOE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZgJtj0X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZgJtj0X"
Received: by smtp.kernel.org (Postfix)
	id D016AC2BCB6; Tue, 18 Nov 2025 21:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF58C2BCB3;
	Tue, 18 Nov 2025 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763502646;
	bh=ML76Iy4wfuCGRXMxNhYr+8mVt1PpN+np04NjRm9LJUQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SZgJtj0X5KwaYi4CQNiZfnfgJhm9f6AY7ZW01hNmkjKKvRifvJepJGbFZzs2luZrT
	 Jl77fQV3F5xfH26y26bkaJ9+XljDTFR+cMqmMC+FLJdA/jjy7i9DPtqXLXOxBcI9UV
	 l2jIFLP9zHUrsE7OMiV+b5twHV8X1oY7GtIb6hqRgdPmdAQQoAXplBiQ6371+kwESH
	 YmNrtRIVZbc8+vUlIGoSaNwVuc2Q8B9qsiEXPycrmJwpcHlPUMb5kAPnk9deWq18LN
	 gsaI0Y3Dy4Ib/8C1Xyq6hiQVChCFaih40l3ONJCfaOZvptK+HAaoDrmcJl5IZ65gRM
	 aU0AXCfs1ICWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD8A380A948;
	Tue, 18 Nov 2025 21:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176350261249.116847.7000817649998013495.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 21:50:12 +0000
References: <1901272.VLH7GnMWUR@phil>
In-Reply-To: <1901272.VLH7GnMWUR@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 23:18:32 +0100 you wrote:
> Hi SoC maintainers,
> 
> please find a below some Rockchip fixes for the current 6.18 release-cycle.
> 
> Please pull
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.18 #1
    https://git.kernel.org/soc/soc/c/c10519c8c886

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


