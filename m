Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0B4377023
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094417; cv=none; b=ak0vBvxOs9GFAN032XP0hu9nsrivtDdeZW5JinophRikFf9m5tAdbrHPaZZE8YUjz/Xz4POrhVk0/8xPMDKcmLwShe2u+Ru+F/3TciykLvXozQi3ngOryW+ZrJoAbvRTxOK8MVwR26m52Dw6z4/8buiKWbDjnSwWrS+ZUhCZSNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094417; c=relaxed/simple;
	bh=4vs1Eyr5dWs/EOrOIfgWWifjWvvbQcaF/DhjYly36Z8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bYZgvMXhLc1RnAXLddx30InZCR8KB8HBo4j9/c3taKYaQaule24SYCMtsVq4P/wUwqCvlQzt0CPqKcGyoqXPXOQqib6ZECjlU8Z4UZ/lNkoYEuyasiGJ0TNUp2IbNwv72VRZN0e8EE3cCkP+YY5V0udAqQ/CVqxcivFZ0dml+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF9xgEwz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF9xgEwz"
Received: by smtp.kernel.org (Postfix)
	id 1306C1F00898; Fri, 29 May 2026 22:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14C71F00893;
	Fri, 29 May 2026 22:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094416;
	bh=o8UYT1Y2Lwr2xZrKWV6Qk33VDs1aNk5JsLZPjyPnh7g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mF9xgEwzPePS1UBjA2xYOoj+pGm26GNpaePLNtxhWMIn63qdDnv6c+ZAUJszaNR1b
	 9DAtM9bTnzx231RpyKLdoVREIcfcKhjHVoKua8PhOeJXTBjEoHPhepRAS2k7puHE/H
	 YlnBi+N9ZDXFE3HHNdjd6t5pAK5vqzPcWhLh9jKA6hf7mqMMrk6Rdi5WQyw9vgmrPi
	 xPOVNF6CS0qrgTZgYQ/0y0Ro48N3fFDEm8tP7T3sA0w5DoQTOhPKwq8jbaB6+GLHco
	 q3re5eDYVuxV8s/ppqFILyyWnTtiE0StuAeUDZTeE7OT3Sb4foQHQ0W56AGBtdNO5s
	 FqGs0fzXEqqig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C1739301A3;
	Fri, 29 May 2026 22:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] samsung: drivers firmware for v7.1, replacement
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178009441939.1985625.8806339075090163007.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 22:40:19 +0000
References: <20260529121757.13224-2-krzk@kernel.org>
In-Reply-To: <20260529121757.13224-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 May 2026 14:17:57 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> This is a replacement/rework pull of previous tags/samsung-drivers-fixes-7.1.
> I also dropped that tag from my repo.
> 
> Changes against previous pull:
> 1. Drop commit: firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
> 2. Drop commit: firmware: samsung: acpm: Add memory barrier before advancing RX pointer
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] samsung: drivers firmware for v7.1, replacement
    https://git.kernel.org/soc/soc/c/f5e70b3f30ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


