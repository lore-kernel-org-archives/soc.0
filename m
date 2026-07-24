Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F97F42BC48
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911258; cv=none; b=NGadzHZzRTDz+sc1XS0epNMQ8iaR97gVX2J92yCE2q6WQ6RcUf/ryCLTfcV9Q+7JTiMrz69hU1eImpFNdl3FYtQ65JPFzvBCQlssVhkjX60/ebf2+/WAVnxPFe9nrciA4Zrqs7Vmeab3fp2eTe+0RRxggsgpAdCEuYiEJWKr1AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911258; c=relaxed/simple;
	bh=vQ1TsK2daSRvcx+0ARNa88GH1R1Jv+IxX3vLUP/ZVRE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=p+qDyWbxe1MFRRoTGj+UOqU3bYxNPy6pC8XnJuMdOomk9FOEGkw29PzWHIZ90olJHKqHhjy6VokA+5MHE4T/7CYPFOoEXEpq6orDU7KiwE9SwlteyfBZ+JHpOAAv4ZhujxcAMJr4JXp/ueQWfmel8uEkdLFICNnLnIKyiYOgru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZJakXCx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZJakXCx"
Received: by smtp.kernel.org (Postfix)
	id DC1991F00A3D; Fri, 24 Jul 2026 16:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E281F000E9;
	Fri, 24 Jul 2026 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911256;
	bh=5v6RMxJtXgJOksncrPcRRbTOKxmmglS4tIkrX5w3Ch0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EZJakXCxQNAQgLMnxCFyP//gK4umgK0lXXNJXyeB5Dv9yDv8CBac3/4+XQHXRTnsY
	 fsbSSEtvpc58ZMpT7dQGuhfq+unDCbHwkkHUoOgOfs1uvxkRGEF8qKYSDT5s8jeMEI
	 3o/cVak0n0H34+Xup53rYEhiQ9IlN+xHn2jfP8NRRf+KiMXRN900eXycLxtAqTWNCm
	 aYueqf7UBKX/MUVXjA1YEfWuIlBNAv5fbT0yGXMXV+Dc/dtXC9sp1CLX9PQebafJz2
	 Zj35ci6gF8lxeDBIr6ctmdWL0no+lYvS0tlBKsZZDRrDVRg3nvF0S6ri8X//ffUJRC
	 1nNerCItwCtgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569DF39263A5;
	Fri, 24 Jul 2026 16:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 7.3 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491122388.3229915.5185707779266769386.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:23 +0000
References: <4283932.anssfa2V6d@diego>
In-Reply-To: <4283932.anssfa2V6d@diego>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 24 Jul 2026 01:02:25 +0200 you wrote:
> Hi,
> 
> Krzysztof improved the bindings for pmu+grf regarding the reboot-mode usage.
> 
> Please pull
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 7.3 #1
    https://git.kernel.org/soc/soc/c/8a88adb58b91

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


