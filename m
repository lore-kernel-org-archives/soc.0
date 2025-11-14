Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA3C22258C
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162563; cv=none; b=eqR9SPsfOHPAMmkuQVED0AG47ecaF3BuFJqs0AtcvVnmdRls+SoQTj9Iqte4t5fXPyfMcsVCsMnrbvxavWPthYsrXPCVEYwXrQKPGh0RcHZpKoCV/503LwtVnnu/Vt4B3pnT0Qz37fRT/qnHFPOskzFQYHvb97wgEZKDJEiv87A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162563; c=relaxed/simple;
	bh=urnrpsb6yhZbBCnr3Z6Unacy7faRprlrYG2ux+jhU/k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bth8cGqn6P5Orqpm8cYB1Xo4j06wDh1nV8Lehvuo4oYFqYsP60wS0bvNh28YqnI5ggZmbLENVJ6DHL+hH/KkrZekf2ZD+UdZeIlhIHbYBlJTTgBo4ZsoaQt5HOUa1T7dAE8fcZKdH35pllVzEbZWIqgy2qzZJUOmk6q2QS2zel0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSRK1/TL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSRK1/TL"
Received: by smtp.kernel.org (Postfix)
	id 98B54C116D0; Fri, 14 Nov 2025 23:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833AEC4CEF1;
	Fri, 14 Nov 2025 23:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162562;
	bh=urnrpsb6yhZbBCnr3Z6Unacy7faRprlrYG2ux+jhU/k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iSRK1/TLLTHvgsri58/ax4qotC+9UT7er3Uy7OnCuMcNpaNbiZaAwqgbYiDNc1Di8
	 xaQ/Nep1RvEyH7tFPu+o86UCDFgcdJ0jm2UurWKyU8hodn4ZShJjc6fykye6+y/YW5
	 TRLlH+ougMubJKam5Nsk15gJnI7FwZ/oilzqqGKN51AZDCToJMGhwf8+CNRG+7Gfuk
	 mQ1RutmckczJy8xk6Br4qGEmLpaKJadgvmbWqvIq3OUTcfnmDmc5gI7ixuTtHKIeZl
	 TOOT8W6JKe6+YClvnmstcmMhmgiYQk3ZN/rw4J7ETSXYi/ymVrhrNUKver1RMzDp2/
	 TC5cy7by1gS/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B473A78A5F;
	Fri, 14 Nov 2025 23:22:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom defconfig-arm64 fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316253074.1867843.8464158675693079731.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:22:10 +0000
References: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
In-Reply-To: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  4 Nov 2025 14:28:10 -0800 you wrote:
> The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:
> 
>   Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/defconfig-arm64-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom defconfig-arm64 fixes for 6.18
    https://git.kernel.org/soc/soc/c/020e792ca39b
  - [GIT,PULL,2/2] Broadcom devicetree fixes for 6.18
    https://git.kernel.org/soc/soc/c/7b52117eea0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


