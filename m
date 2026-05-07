Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2A23F23B1
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159212; cv=none; b=kdPpZu0QXm98q4GsyGugDakYUI6qOU0rt/RsBrLaCpf4l++O+9WHh/SsXljBwysM36ReMkZVbQkMTJNE0ybNrDu0GhM+TJeupJ/iAQiReu+TKeNWvo7dSQkCeqbKFgknmxx7fjEvayva3feYXqgeVgvI/0xjPR6WeaHN1Zvs2Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159212; c=relaxed/simple;
	bh=0aE6GctgXXzCpLgi3jpTvqSh/U9M9qSXy2B9Y6zrO2E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AaRF0Jjntwcxvs/cbhM76wsVxAQRpyUXR0VdnxNHV+ETILhwI325aCasrERLIwfSs0B3QNA+AZNfXWgUHdMk8b2uIE8t8l5QBkwKLukUkOjunVhmNY9f2R26ZKCOCog0bmiXXYUOXDZ4WKk4xRRO6xskUoy8cIc1/bVBPlWi/BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDNPMaMw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDNPMaMw"
Received: by smtp.kernel.org (Postfix)
	id CD4B7C2BCC7; Thu,  7 May 2026 13:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7881C2BCB8;
	Thu,  7 May 2026 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159211;
	bh=0aE6GctgXXzCpLgi3jpTvqSh/U9M9qSXy2B9Y6zrO2E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gDNPMaMwFykQyZXFgd67kiza41qI3ze1BEIH6mLl1+kF011uM9tdUb7UgaOvbYFte
	 eeYmbvJLf8naL4DHfce3+bvblS13fQepNhylCUU3Tm4n0cH3c7IPbpzoNPEvVU4UeK
	 CPzQUET95LyU5oZFsY7kXP4cT1wxYgl12j5Z1rluEm1V8H6Ib+bddt5z41Wm8/wrCm
	 UYiDGtfNq0N+PHysxTVHSBkbwUFjTKne2lPN0ljZgpH8z0hY/1/H+ZRPIoQsyGL5J4
	 JAConW2K0J8vAnkjJPc3CxuQyfnBqS7jj8mxHeCZybQlsjiqsM40Tqv+EHp8x6LuvC
	 Lp+XsTtfVNdtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDA039308FD;
	Thu,  7 May 2026 13:06:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] ARM/Realtek: Add maintainers and pinctrl support for
 RTD1625
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815916104.3933061.3885174769645682246.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:06:01 +0000
References: <20260505103955.1010130-1-eleanor.lin@realtek.com>
In-Reply-To: <20260505103955.1010130-1-eleanor.lin@realtek.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 5 May 2026 18:39:52 +0800 you wrote:
> This series consists of patches that have already been reviewed on LKML.
> 
> Add pinctrl support for the RTD1625 SoC and update the ARM/Realtek
> architecture MAINTAINERS file to reflect current maintainers and include
> the pin controller drivers.
> 
> Best regards,
> Yu-Chun
> 
> [...]

Here is the summary with links:
  - [1/3] MAINTAINERS: Add maintainers for ARM/REALTEK ARCHITECTURE
    https://git.kernel.org/soc/soc/c/856540ac9b44
  - [2/3] arm64: dts: realtek: Add pinctrl support for RTD1625
    (no matching commit)
  - [3/3] ARM: realtek: MAINTAINERS: Include pin controller drivers
    https://git.kernel.org/soc/soc/c/79524bed532b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


