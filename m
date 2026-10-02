Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFF23537FF
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977813; cv=none; b=vB2E4sv302/V1Dc6YiPujj6wMcDVUwHQmkSSdFKwu6zjrs1dsMn0xQdmbIdAm6uvAgl0jUdSatMqDob2VDFN8Q2uNjYdtc99naXew7VaC1HYWX6G6wLIxm/JqWoqq6OFg9Qv7YXk5NrgtAncBK9xMYaz4AHpl151wzi3QawSP5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977813; c=relaxed/simple;
	bh=A0OxiNWA64zx4gr6cTdlHfkvjYFQ+FVINhe58DQ0x8I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QziQE1YLYOGqbTIo4A18LaVNAszaJnu+LG+HaAPPwI5Jn6Sf6Y2hYxSHLvZrr9xS0DCOeJcnlIYKOO2Vy/kpf2sGuFui6981u1oL0Og5IHl7HRWgfA+Dn7GCPAKE3+VodlLXuK60N+8785cTUW0Y18WhFcgTNC1c3wyHJ/ji1PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTy243ql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTy243ql"
Received: by smtp.kernel.org (Postfix)
	id 1C9C61F00898; Fri,  2 Oct 2026 21:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063DD1F00893;
	Fri,  2 Oct 2026 21:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977812;
	bh=rUhvtsBoFcbYZOexZSsscZOx7Eu+lsL4oJfQrFA579I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JTy243qltmvnJ0AIH2sk2AzLLysEPRuNnjl1KEajdf15gAiNG5Sqz2tifjXnGunuT
	 sHaIs/aj/tnkxR+b2goi7hvHU/jicivumO2KZevFbZ9g3+UgTMjcfxVdDzn/GtNqmx
	 M47Hut+6GGD2vFu2XsWjHLGoTJ9+fNJsR15z1e+YdD0lLEjKDyrTw8demzDdsT3IKQ
	 PCOCm6P3M/IRI05DgLtMKBzsJbPXZ4cimeb8EU1tgrLLSpTSxYPZtRuFE8MpXo8Z3W
	 oy7YDZ1x/orW9NHMuXKcBhqaIq7viHDBKRMsCGb9A7+wM+vAmHbsCtz4IDaOsm3N/T
	 Fja71JeODyC3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F154B3811A72;
	Fri,  2 Oct 2026 21:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: update my email address
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179097781052.3602058.4004512460562472303.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 21:50:10 +0000
References: <20260924101245.5011-1-kaloz@kernel.org>
In-Reply-To: <20260924101245.5011-1-kaloz@kernel.org>
To: Imre Kaloz <kaloz@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 24 Sep 2026 12:12:45 +0200 you wrote:
> From: Imre Kaloz <kaloz@kernel.org>
> 
> Switch my contact address to kaloz@kernel.org and update .mailmap.
> 
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - MAINTAINERS: update my email address
    https://git.kernel.org/soc/soc/c/f2e695a6c272

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


