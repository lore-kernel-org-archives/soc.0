Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6022258C
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162560; cv=none; b=aEtsgLoKVlS4wXEj+Dt52c8l0p0rFuGQ7J9oMaXybxkftlokHBnVdp0hwU2xcwPDOwkzm3OrIwPBYQCIvNo0TivRrOc6y7aGqcPqqp82A0eh7t8MAkXV//UAO06Q7sWpkwnLvjuNauKGLb+7/0WNE4wDbX8LWMOpaJyhSHMGi/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162560; c=relaxed/simple;
	bh=9CwCYNbag7RyTjbbfAy9HeqlXMPb0sk+uCAr/DvkMOE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pu5lOK7CYcCW9maR/VjCxmfaT7hdh2GxeqJoiLC6hQ/6xI77T9yyb8r6VUaMf7WnqGgl5UUGtXPgL+Uk3B8CXLY+aEgikPykayRzZOnOdi4O1sRqkGLnbjMfStP7y3ZILoRyl3ms19vMIOMoP++gss9+2JP/jQS403WbAz7rieE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCseLnd/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCseLnd/"
Received: by smtp.kernel.org (Postfix)
	id DD640C4CEF5; Fri, 14 Nov 2025 23:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3956C19422;
	Fri, 14 Nov 2025 23:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162559;
	bh=9CwCYNbag7RyTjbbfAy9HeqlXMPb0sk+uCAr/DvkMOE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JCseLnd/ZdmeAaTBUVHhz7r0wUMxkIkI1RqYhlOStNwJ16QXK6BIpdTF/bn4b8cFC
	 LAiU9ofdBnuAT+68X/U6mftdI+RFY2rLq5uUHjpY/e2vlejKbSU6Y0tR21LRjoyhkF
	 osRrrIKWUnefwPNa14cyWD87uqn/qboiFs7xE4DRxopFaKa1GX4ny9k7ASIZtgZ6kN
	 nwWukjHDNktDXGWhuc+p1cKC9rI6a3RC24Pbl/SEE/FoicYeuBxMih0r81IDI+c5vD
	 qYG434zsq+HrxVD+j/W/Hk4vRO6BGxBLzFyxMTKeLwIB9+NSIBXQR0IFtHtZcFekW0
	 lZTpDrwrfnVpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CB03A78A5F;
	Fri, 14 Nov 2025 23:22:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Broadcom devicetree-arm64 fixes for 6.18 (part 2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316252799.1867843.8134453601328178678.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:22:07 +0000
References: <20251105183126.3923882-1-florian.fainelli@broadcom.com>
In-Reply-To: <20251105183126.3923882-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  5 Nov 2025 10:31:25 -0800 you wrote:
> The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:
> 
>   Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-arm64-fixes-v2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Broadcom devicetree-arm64 fixes for 6.18 (part 2)
    https://git.kernel.org/soc/soc/c/4e08ec0054a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


