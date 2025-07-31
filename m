Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D7981E
	for <soc@lists.linux.dev>; Thu, 31 Jul 2025 00:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753920596; cv=none; b=GEY5Zz1tLjWmGX4J+3wMF2Qfm8Cnp7mxcutPIXgo/z+qaafYJbAqA8AVuTtH6Zl2tbKx1OvbK1zIjFstnKKmz/CL+JpU+ZdCK74Dxmjj9JXoSWuNaOfQIViKoMpq13X47nHK9GCjtUFQW/Qi7h5KvQtCMCuKhOjeBjRNOvqJRHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753920596; c=relaxed/simple;
	bh=R1ed7J1ty4gQ+GLMd1/yf1rR0BNUBfek1dxJHT4TIVM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E7obFebB58otDX150L4qNWFibK0LzSl11RPr9ItB4LMA035bvZHJKNN7dCxfmdfUV9rLFQr4hO5Ct6Q/Jg49jfT2jytS5/zHsjhU6DUm+Vn6xd2KqVwIVFpJOOLVLQ8JVqYlj/mlN2A33o26+3y/NCAuV/v13oESzKz37J/txNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqUrkk4I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqUrkk4I"
Received: by smtp.kernel.org (Postfix)
	id 6D6FDC4CEEB; Thu, 31 Jul 2025 00:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F45C4CEE3;
	Thu, 31 Jul 2025 00:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753920596;
	bh=R1ed7J1ty4gQ+GLMd1/yf1rR0BNUBfek1dxJHT4TIVM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QqUrkk4IS9tjshqvyihp6fawI/pbQKLG1rNZcr+sA5fl3Mu0CY1HhFxFBP6irLQVc
	 zLtmTFjNDGONm6PjKD3ekRMJdy2XZipolqyAfLX4Hquq4CMXadWwCoEcxpjwKp2KeO
	 fFNsMGB6cavYvhFml6SOtWEJeca3qkHcuUWQAblWbiCLBYjEv/QeEeUKOoJ4+Jv1Et
	 3eGdH5wADF9s7DPjM96VrUTLPMi08+kQWUPI5Iyv5hkBnn6XdQxQ18wBsPzJKsXfK0
	 LT3LnGjecJT/sVVkHVeTbdZZssztXzM2dn796iSvFbmHJ5FO6ciKBOPfe0LbWCYECz
	 qdHDeqQtM3RFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B19383BF5F;
	Thu, 31 Jul 2025 00:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom drivers changes for 6.17 part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175392061199.2546419.8763300087798546467.git-patchwork-notify@kernel.org>
Date: Thu, 31 Jul 2025 00:10:11 +0000
References: <20250730205754.3465896-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250730205754.3465896-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 30 Jul 2025 13:57:54 -0700 you wrote:
> The following changes since commit e3ce7b897388339b407d57969acaa26063e38209:
> 
>   pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers-part2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom drivers changes for 6.17 part 2
    https://git.kernel.org/soc/soc/c/9f9d41d64322

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


