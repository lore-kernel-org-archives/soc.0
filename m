Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E31F2D190C
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162567; cv=none; b=BIGpm0v4wcH6Gh3/BFBHQw1ErIV+koaHU1FP3x/Oewgw7qElgdH4fHxA0IgJjs67aUxTcyngz7tzP1evLL+27LPg6o8rfKiFbK3L9Iff4UYtZKYOoUyXRCAsFPHTEDplk3chQ15Goo3Xp6EQxwx9Hr/vlWywiMXAKmmm199M7No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162567; c=relaxed/simple;
	bh=YxOGW+hMt9tfQVQrIzJLx0KCP5xl8MhzsPSSEfL7JbY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=m0WOWU4/4h4geQuQWcoWk5leKtsLK2Ikppv9EHTNnkE8gOUBkRtYglyRJJbgtlIqvps2uxf9bcUIHr/868O6dTDCc2B17mCs3M29cn7xDylnQQNGq6/wZ5KZyZ0WuIPaB0wFvf7xABlTJalQaghfNTmia4wMmD7zmZzAPpEafe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyLrvUUX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyLrvUUX"
Received: by smtp.kernel.org (Postfix)
	id 13C6AC113D0; Fri, 14 Nov 2025 23:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26DDC4CEF5;
	Fri, 14 Nov 2025 23:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162567;
	bh=YxOGW+hMt9tfQVQrIzJLx0KCP5xl8MhzsPSSEfL7JbY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cyLrvUUXrHKBoIOQhOLtwv3NI28r/MR4Me8kk9KqEGL/SbI3jPPKr1DeilItvBj15
	 n0dJpKFQ+4tdmnVAM6GVyVzEJq33Dx2AI8ecrFkp1mxdy6GOy9F8RlDnN4hqRyhnM6
	 VGIhcC/4gGmld+/CTk4dL673Kw4Qbd31k3U+rFSqHbUBH79VXf74zgEmySazbK/r0+
	 10hUVMFQXWHyD2jDcMKPo+wwZoDHzrhcCDK/PUq31avTevGrhAZbSWVVOn8AZviIk+
	 tPl4fVcaGOk/gtPigwcq6JdpNCD4C+xoP+p1GhZJ9/gJI5ZG6vjMKTzn74lF7IzOmo
	 vE2LkdIt2oK2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFF73A78A5F;
	Fri, 14 Nov 2025 23:22:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: First batch of fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316253524.1867843.122115700232816955.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:22:15 +0000
References: 
 <d79a0c80cdd9e2c45e6a82fd8c78219b6d53f206.camel@codeconstruct.com.au>
In-Reply-To: 
 <d79a0c80cdd9e2c45e6a82fd8c78219b6d53f206.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Oct 2025 09:12:40 +1030 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: First batch of fixes for 6.18
    https://git.kernel.org/soc/soc/c/dc00a9fea282

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


