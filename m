Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019410;
	b=4Ik6kZSmuVcrJsDRPJzpBnd8aemgEnCEeb9bM6fA55+5iRM9hif+dcHdQahWC83bdMks
	 +VXaz728Zt2dx4DD1usVuTasKGhIYzMyO6HGnrzQZ8XsC+YcB8uNEa+5MadFilKW98d7w
	 VlqlvGHg4fpBRvc91Vjl8qYwVU93QMG6DwP0Fa7XlaaznQm65AXLpkBkAhElWeiV/0K7Q
	 oH9rGDQvWJ8Ec/ox1mJdM6ojwJfol0r07HGjoVwf05763sKR16kCZpDUJIvcVOxG4I0Rq
	 YvouNOxtmhkN+l3ocC7tbUAGwNgomY0TPk0qn38mjloFG3svJ9Us3aZtSjqBuai1pmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019410;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=DONrlBj2NtswDmsH/aoAZ8gpNmp88TBVxFMlC0VLAWI=;
	b=UsDhtX0FQi3F9LDVUxsVVzHqDT+yKCB2oXVhzh2XRFznca9aonN5kaHgjQNvqme3RALj
	 aQMJS11ZcALTlHYviJqh9kkUizO9330jEN53jxp5gALoCvJPSx0J87mlF95UVnNCBybpc
	 WDqJFXZ8WXcFidSowtTdzSVfUn6MHoOoVjETGEwRaqh2adFiWhgFn43lDLoJ/VnQ+VJrh
	 +iCBFFt4YfdZuFEuhwirUNBhHmTYSD+HFkx4e29xAGtNnU+VVUWa88Y/JR96qPDVcN8LW
	 1QY8wADg/Ih6koI6iVpTNS7y2B3u8c8zCr1huCtw+Ci10v2EMW7Blm2wOlquu0Nqpcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z+T23v/8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DBF60A2635
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+T23v/8
Received: by smtp.kernel.org (Postfix)
	id 9776C1F0093B; Wed, 18 Nov 2026 16:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800161F000C7;
	Wed, 18 Nov 2026 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019410;
	bh=DONrlBj2NtswDmsH/aoAZ8gpNmp88TBVxFMlC0VLAWI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Z+T23v/8dGiGiw/JNjFBdhHHv4FtGPs/4F8MfiPeCjD/ZgbhmCUSPGmDiuLJiui66
	 AuS7BJKh+1QIRKVQF3lJvBpSpB7MHmv2KzsDXtR5hXx/gcSM3iD2mdPfO3c7pnuUCm
	 HjRqZJyVHmVgFYfZCROenC1thw61MI0gi/c2fGbm9DB31+v00RsuT4JP3ZL/Hzx2NJ
	 glu9kO6vJsGES1Bdn4e3tSyN6KkdCYAUtgo8FLnYG5sXiGOVmkN1CFJZjy6Ba/+7X8
	 NFeBU00oUSgBMMYjdPXowHD77rKPBMME203W7wKzbKNlJ76+6N3xbm0FWV2/vyQlQx
	 lcgFA5Gh+pZUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773C03808210;
	Wed, 18 Nov 2026 16:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom drivers fixes for 7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501940927.1837438.150981374330398438.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:30:09 +0000
References: <20261114034550.878760-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261114034550.878760-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Nov 2026 19:45:49 -0800 you wrote:
> The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:
> 
>   Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.4/drivers-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom drivers fixes for 7.4
    https://git.kernel.org/soc/soc/c/5b425110d843
  - [GIT,PULL,2/2] Broadcom maintainers fixes for 7.4
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


