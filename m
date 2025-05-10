Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BFCB67F
	for <soc@lists.linux.dev>; Sat, 10 May 2025 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746870590; cv=none; b=MSTRBgwHo1tbtcHilHEqNX/b6ZFOQZOfBtJWB+8MTSBH304re/GNUoWQPyGfImFGcD6ceOHhJhoALc9feLcpkc0TWrt1bWXe4gvqdPRRwTlrcApXrxhi4OuEBSxTo9urnDNrcxDhYsD2tiTUCB9scyQUdXJkeRfMJt3/d/HtCDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746870590; c=relaxed/simple;
	bh=BQyjOfdxkL7GGMlkQ1w9MxRrtBDflY//A5i4LhYfcSI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dPBtHUCAPbxrxdi6wEH1YQyBe5W8KOs/H2l9maj8H3XF45h8kwhTNn7VapDDvWhVik3rxTjl2E2ddWGDe60PTv+nIVpJ3gLTw5pmy5AteFk2Moq2wOx9aqvN2sFYpgT1YYa8hBdcGbR+Sakg4A/0yEDBiM+VucC/la3dIyRCpXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYBxXlmT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYBxXlmT"
Received: by smtp.kernel.org (Postfix)
	id CA5E0C4CEF0; Sat, 10 May 2025 09:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E95C4CEE2;
	Sat, 10 May 2025 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746870590;
	bh=BQyjOfdxkL7GGMlkQ1w9MxRrtBDflY//A5i4LhYfcSI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cYBxXlmTn/oHdZ5sl3FKxh97h+U+lGtj0AAS5gGx3drkWAZ1xRGYMCXVsuwEjY8x1
	 Qbu/SLi/ngg7X7YGNgMcjC9NXQK2vLDxmEjCg7F5jYR4iOVHKkHaSWg6xC2aNnQtrO
	 z034QnuNr9rRB/8wSCrRsYZ1CluhLc0vX14YD3/FW+IhWgXa1TI+7Dem9QD/fyf1+s
	 i9PLhvs5ZMWeRS9/4XceN60fYtkJjIH2lBtFKHPc2SYI4eWKRaIagikLJ+rz21dOeC
	 2EPrThxZv7Bz2ioTxwQeQ8UucTnUxR++FOmLxRgACc5ol37HZKZkZt7QtZS/4D7Q/u
	 HUTcFXVxcuvHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B063822D42;
	Sat, 10 May 2025 09:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE updates for 6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174687062900.3943501.18208316623034102925.git-patchwork-notify@kernel.org>
Date: Sat, 10 May 2025 09:50:29 +0000
References: <20250509065114.GA4188600@rayden>
In-Reply-To: <20250509065114.GA4188600@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 May 2025 08:51:14 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull two small small patches for the TEE subsystem and OP-TEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE updates for 6.16
    https://git.kernel.org/soc/soc/c/9477c3e68e0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


