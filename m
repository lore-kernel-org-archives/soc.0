Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017628;
	b=JSh9kAllRxOxwQBTsvnpJkEnPo4whgg0Yi5GzAoJdz+8jlWLh5ZRkrHoCa0iQV35es8D
	 kQFQccSDhi2BgYpL2mXRjp1fM3fpDhcYCFX7ZXHVbtAuoJcPUGvsQ9oN6pDeD27ut7Cr+
	 B1S9n0B5mjmfz1YEXuHVnsWVuBscLqbKHUtc3FXiouMFqC6835RARHTeJ/74GUiws+EVo
	 G2wf157CGvPPZ2WvZupUhJ82JqGqWSlV2oU5szxbco6PrkSqFgwFCijcI58CdVDTJBCGV
	 FVIjZR3ZYhTq9fZSO+iGkfel6FsGC9Hlqp6euZXK2L9CC6s12lJECz4iVrfcbyI9cFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017628;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=CnzTdlOAFa9PoQSfAPx3vT00WalebAriiDW21pg6U00=;
	b=gMM+MISTd0ge43hPh008UYJhzVzMllVv5EZuLB5w6+h5IUbujlpIuRFimxMyTUrqmXdi
	 5ZgLmLjf+thhkAHeBHwF9S9kSChRLDjbGA2VOTs5n9TmwSc3SKLVY7OzNjbK5o5mEyyNt
	 B7E/y8q8RGmdsTt5pIVUtll98no1m4V5bjaLFtSlKXvP8N6V0bmyzASWaZK8qt0OmMQYN
	 p4m7tkWSL8JtgB572q6QC3Ok3z5WZDWmK8qJW+HMG+ix03VrGlZa0ySqSD5YJJYTlweZd
	 ggDuqnDW6oj4i273aopHRE77VgzCCasexC10wfGoY4rGwA0RIeWyexMfM/rRPuqwZKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nxg3IZTa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3676606A331
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nxg3IZTa
Received: by smtp.kernel.org (Postfix)
	id D628C1F000CB; Wed, 18 Nov 2026 16:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA5E1F000C6;
	Wed, 18 Nov 2026 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017627;
	bh=CnzTdlOAFa9PoQSfAPx3vT00WalebAriiDW21pg6U00=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Nxg3IZTalhb8qIr8bz8xO7mBg/rZLw/25Zx9IjqLX3epJSP9W/8VncZGLnSr1vuml
	 70PTcDJsid83zIiB8NYZNlOCiVVOMPPrwbb+V3tGmz3nXw4p+ndM7DZ3iYdYUMsqMr
	 V+fjDI0yhMYdKfpHFS19NQ9LzSp9Yx2fBRP6lYb8FxvoKHDPKZKw5x0nJ7qmFJnAo9
	 NuYTMDSCJAC5GIKWIECDg83NI/WBvsIwKfh9qMJAei62cvM/suEdyLYb0Mj018VN7V
	 w0dFnZCR4s1eATURUWYY8hbJiTw69kzG5pdH3IkXgRP5oyQjzUcZktno3qmMEmOcno
	 OHoo33rp5h7OA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43843808210;
	Wed, 18 Nov 2026 16:00:27 +0000 (UTC)
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
Subject: Re: [GIT PULL] firmware: arm: Fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501762627.1802028.4896908303617658936.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:26 +0000
References: <20261102175440.1063545-1-sudeep.holla@kernel.org>
In-Reply-To: <20261102175440.1063545-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  2 Nov 2026 17:54:39 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> I have included one dts file fix in this, hope that is OK. Let me know
> if you prefer to keep DTS separate even for fixes.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm: Fixes for v7.4
    https://git.kernel.org/soc/soc/c/0cd364ac0a11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


