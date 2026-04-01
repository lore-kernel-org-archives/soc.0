Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9CA3264E9
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080245; cv=none; b=fI6i6f8ziBBBtaZhZTBQ4hr4EAabSp9NGTmqpAKTsKFImCxuS+nqf8Na0Tjcl4brlfKNrvDmHNHsKPnU23yj55mRCqNPtqk9Mn+3zfPoZbLILYpmBSMO3kr61b6ySU1cLqIzwjNArQD2x5IIqBo4XdWhHRh3YoY9/Ja0JjoH2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080245; c=relaxed/simple;
	bh=gtJwNwMd477SBLh0oz7Iz4AqB2qdRsYq2SiEuu32R3o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AZpvJbmq943OKQrxHPXr3L7js3+4/rXjzB5lV7LLpnkqDcYVVpI20dL8DDdtctNGfj30X/z2l0smhl7SAKjaUcS/lqxqR+m66X1brgHJcnTtfCtf6nAGsXRm96+Pu9KUN+kx1ndzWTOA8PZdd0lcF8stwYgNsQLUZXHbjFQ9Vfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFKTJ6zd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFKTJ6zd"
Received: by smtp.kernel.org (Postfix)
	id C4F3EC2BC9E; Wed,  1 Apr 2026 21:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF675C4CEF7;
	Wed,  1 Apr 2026 21:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080244;
	bh=gtJwNwMd477SBLh0oz7Iz4AqB2qdRsYq2SiEuu32R3o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eFKTJ6zdFqYIr48P4kCywHl0ZcUld5yWjZJgcQb8mTVwuBmWoyxrWl6ep75Yun77q
	 c7HFsfpm9qHDDozU1X6kVyfE/Pq1BCph1Z1/EvEXkOnVoyYVWO4XkTBkcC8W1GBPEv
	 G1MbM3uFdZPGKVbfbRGOqpkBj1LLCSBcFzT3UcKL/4BQ5zgfaLUwHhY+AkHYAPJTEE
	 tmOEE2Lvv7DO+eVj3TkOqx8YCLbdjFjepUMl8ruN9fixFfahtdioPZP2xZdqlUYhYi
	 Ck4GhX3Diq+6pslNsgeiCxqb+/K3FavaYfhtP1lCw6tTubfa2YZnPfwIOfZZG86JAz
	 7Qn9O1r12vmvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0103808203;
	Wed,  1 Apr 2026 21:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] samsung: drivers for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508022728.3876275.5249099489273989293.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:27 +0000
References: <20260324125821.59728-5-krzk@kernel.org>
In-Reply-To: <20260324125821.59728-5-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Mar 2026 13:58:21 +0100 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] samsung: drivers for v7.1
    (no matching commit)
  - [GIT,PULL,2/4] arm64: dts: samsung: dts for v7.1
    https://git.kernel.org/soc/soc/c/2feb6df85c64
  - [GIT,PULL,3/4] ARM: dts: samsung: dts for v7.1
    https://git.kernel.org/soc/soc/c/5e9c551265f9
  - [GIT,PULL,4/4] ARM: samsung: mach code for v7.1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


