Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091122F6196
	for <soc@lists.linux.dev>; Wed,  8 Oct 2025 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921070; cv=none; b=H0Zv58LJ/dwJ2RbEr+akA8I0QK3Mq7rG/p0Ihi1gt14FgHvAGzVXqkGeja06Mi1gATE0FXGGgXaT+HHUW4AjsEB/pdF72zN+kkv7FB+hamUJ3b34lQ8E+ebqtiYSMKQTnZJnmEodMbFJ06TCDuWplh9Wz7hrpz+KF5wZ9v+LzdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921070; c=relaxed/simple;
	bh=lLHIjzmc5MuIfmSzFLiLfbQg3tTTQchPUy+C9gd/wEs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fTFYdWMXwe37ZtR/IKw3eEXG9Ln22sXuvab1WrbqixhnOucX8c4f0IUUmPPdm/hDLOW7mqNO2jxxIRUfT5zqu0QcJo39VEfb/zHkIc1W3MMyisqQePZ1bOplnpcjplYnHfay3pcM7gGQHvT2cconyPcNQpMIBXPcw+2QEo88PUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBPN2yA4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBPN2yA4"
Received: by smtp.kernel.org (Postfix)
	id CABC9C4CEFF; Wed,  8 Oct 2025 10:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5678C4CEF4;
	Wed,  8 Oct 2025 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759921069;
	bh=lLHIjzmc5MuIfmSzFLiLfbQg3tTTQchPUy+C9gd/wEs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QBPN2yA4FIO+vevv9VKg/eBm4atHAO25N+vRBNozY3nlTU9b19qAiMB04VTlKYtou
	 LL/zMOWP6OaG7jRMMHm3a7hmJwvecP4WqnocfXyjxiU7eq4ZHw/LNzo20vmt1/zkm/
	 d5EkyMMzJMeu23IqOSGeZ/wNocqGRVsNJhq55UUrNIcBObPgnb/DLnXejaVY071ZY/
	 mUKbyYpZEq5gfZO0KfkDSGFJb92WSwBfu3/koXCM/YyHxWPazNljGVjL2EcKwEBZNq
	 Wcs8IRnsF4VsSit8F8Wuyh2eCpWy/tyzHlyxs5gE0MUUTuU97SfEty/cSfBhYXFQT3
	 eZjz83Xr+Xo1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE4E3A40FEE;
	Wed,  8 Oct 2025 10:57:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE QTEE fixes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175992105831.3011254.16581745695184346792.git-patchwork-notify@kernel.org>
Date: Wed, 08 Oct 2025 10:57:38 +0000
References: <20251003123249.GA1063437@rayden>
In-Reply-To: <20251003123249.GA1063437@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 3 Oct 2025 14:32:49 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these small fixes for the TEE QTEE driver introduced in v6.18
> merge window.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE QTEE fixes for v6.18
    https://git.kernel.org/soc/soc/c/758aa8f7034a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


