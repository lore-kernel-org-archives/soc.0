Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D960927EFFA
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753218609; cv=none; b=PxZP5ks386UEvN4SiA9UhwCmqcn+QmHA9/O5TmlEXxPIbsfSJ5lMD8iRQ2X5BVfPDJsvSkzCrKFT77ZnJJM6ZDjlj0/gL5dLpp9nYS+iJBbKhRn11CG88sSkrKm69Dv95BP0qUr37YmktyWUz04qmBE/IYu1SdkMQ/pvUfKd5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753218609; c=relaxed/simple;
	bh=pE7XLBOh+T+hxD26YxwQfT+MpIlHQJkOx8+pjQy+KEc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AZsJDhjS5eJNLbxhCZWnJ5HCDmyGe4fNVZJr/wF3liMIb+BTMyu/NidtpS59CHEOR32zq6XLmMNIhkT1TEApyybfucHqYRDFJUjEfRDVIBr1p++lRfOMxKUkFYmKcFGLGXJjFyBlpElMFkyV5zRvFtBmlJY3bWXugmc4VylPNnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwZtASsR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwZtASsR"
Received: by smtp.kernel.org (Postfix)
	id D0485C4CEF6; Tue, 22 Jul 2025 21:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAB9C4CEEB;
	Tue, 22 Jul 2025 21:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753218607;
	bh=pE7XLBOh+T+hxD26YxwQfT+MpIlHQJkOx8+pjQy+KEc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lwZtASsRnVVkaMz1xyB7PmwhoS4JrGuGPW16+40GWMn+L0G/tRHUKONnBpnN2YcB4
	 BhS2jKqJW+V3w7AGdohZn334AM4+1LI7vBYHBzmhi2aPV6WQ5en+EjI3E/G2M5diua
	 PAEhONp09irUy6bhvMEGnCiIwGayAvSRBbFhJRFO2lydjBlu+lSui+AY2jq/pFxHs8
	 HzQgy/cmwKUA+k44PYCVRFXgLoZtgRCLmV8iJofhc1QchwAjPjp//04olnhIpiPqKL
	 i333tItK+El7fxW/S03eUnCVQx4BhBK8rjC7l8Q+EqERFHWZJBVPSXIQ0QbpBs7zKN
	 9+c0Hr8QFw2Bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B1F383BF5D;
	Tue, 22 Jul 2025 21:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 DT updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321862610.955963.3852400945512508250.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 21:10:26 +0000
References: <20250721100904.568575-2-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250721100904.568575-2-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Jul 2025 13:09:04 +0300 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 DT updates for v6.17
    https://git.kernel.org/soc/soc/c/dc56e105c540

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


