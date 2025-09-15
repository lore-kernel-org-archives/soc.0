Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789532A3FD
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946615; cv=none; b=h/TEivozVmw+nJ+MQYzw3/nXQcYMH2D8D6XgbtFVMAfO+qugQiASmSRptsM4GwgIDQ3AO4bcF9donvmBBRUQV3uRHeU1L4sGJO75NnuTaW04FxYlUIBcECSVHZ/z+pPRIDun9GyizLUAv4RBs+DpluRcrzbAeBFJ9NvzD5voC7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946615; c=relaxed/simple;
	bh=APD9kcOBoyW2s9MBzDWHWa28VVKgNzvKqJPVaAJHEnA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=STImDBnrgDyfbxpjUHjUQ6mjEZSNjy+bDbRTzWI4CZIpWdwOmZY8VsLJFwu2vATMBfLSU3w/tQl4300nnmb3moTSpvZUMgun9OxZc16cKhoX1jYr1f8pHlsU9FAUJQVVLgZmwPLCrxMCpNq6VPTjzD+Pk6+6q1CS940twK1FjQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Momwf+Hc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Momwf+Hc"
Received: by smtp.kernel.org (Postfix)
	id CE781C4CEF9; Mon, 15 Sep 2025 14:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CC3C4CEF5;
	Mon, 15 Sep 2025 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946615;
	bh=APD9kcOBoyW2s9MBzDWHWa28VVKgNzvKqJPVaAJHEnA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Momwf+Hc+iRHnTI70t6D+xPj+hf8EvtftLEjHxONHAM9nPbTCebq6KB8srYGN+11Z
	 iqdplNAtsfJGb6IFiql6VLEU3zIelhXBFsX9t7FbLL2Eq/T8zA2OfQ7iXqN2JrOq1x
	 LBGygsZGEVNKQJj+d/8kpagnDSmG2W0pMfz92Xu59d0JKoEhtPK/mdJMVwJLRpbtpz
	 ImQNzXokg30EQpiVkn0vK99Tv/w44Wd4eKMxbLq8ck7aNiBJ+LjmHtbEX8pkqgIP7g
	 NM1Y+iIEv7kWBwwC/S0HqEp0N5lDom40r7mdOOZUQF7Gn33s2psTjZHu2oGOdU9K1D
	 a5Wy2noKXo0dw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B2739D0C18;
	Mon, 15 Sep 2025 14:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE improve sysfs for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794661723.4799.2100251901384785896.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:17 +0000
References: <20250912091000.GA1441709@rayden>
In-Reply-To: <20250912091000.GA1441709@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 11:10:00 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch for the TEE sysbsystem. It updates to use
> sysfs_emit() instead of scnprintf() for buffers passed to userspace.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE improve sysfs for 6.18
    https://git.kernel.org/soc/soc/c/a97c004c9b8f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


