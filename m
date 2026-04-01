Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50FA33D4E2
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081434; cv=none; b=aIW6ioxLfAydvSlqO7s6eT0905bJrDygfWONk7jYIn8wNo8YqXE1MpCRFrAjhzPo5JwqC3qvPnLwVsPf8YH/KSkFRlTH1cRmEX3nxy1r4MriMdfhvzEDUL1v4w1jFOCYKL4z5/IfDU5UPvSW+/KJhWKP48yZ9bGdXM8HgRONTxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081434; c=relaxed/simple;
	bh=0XvY+Nm67GqnIA9gmTVZfGcGAARLLERsw3NEdrKmPnk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=As9qynEkRaAQkrtb2Qzadiet999HQKbys5wJdrPiqKXoWZTTwnCQDliYbDnjIooNAqYpHMxZoVlmR8R2vrdtAACCNb7YtNwIEMCk8J80odfEgvwvN4rfnd9/Fn3uD2WUtiE66MHktrC9S5YHkqOvHiD8D1uD8jL6QSzSRmg3I8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coBF7h0Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coBF7h0Q"
Received: by smtp.kernel.org (Postfix)
	id 8F49FC2BC9E; Wed,  1 Apr 2026 22:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B2DC4CEF7;
	Wed,  1 Apr 2026 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081434;
	bh=0XvY+Nm67GqnIA9gmTVZfGcGAARLLERsw3NEdrKmPnk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=coBF7h0QzamvtW6O7oQ1bSSH4A//aCmwXz7wxl1CFsWk8YC97qEIyjYrWIHqAnlTQ
	 IGXinrx4QPh08UXibcYDGzm4m/6WVDQkkIU//8eOPTJwe37zQ+Sf36k5n3Ph8aXn0x
	 FToj/G/xjF5Q+a4SSRdm5MSn4UIwxbz7+JN5+LrNVXYbu8aXH2UJxGHTlnYA4Faxo/
	 0K/2MFG2bsag/NSKj3dFR//heCt6/nNlWkzNnu2MoIkm+ZyIi9xr39qZtUBaIGu1Mj
	 7U7Ew8+q+SAdlXuKnSJR1mkmb42Wf4ch7dqQ7ZB5XlBMQ7gixAZWuRrV5DbWHgatbF
	 bn+OOnfZfhSIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF173808203;
	Wed,  1 Apr 2026 22:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508141703.3882930.12048488281647418177.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:17 +0000
References: <20260324132028.65350-2-krzk@kernel.org>
In-Reply-To: <20260324132028.65350-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Mar 2026 14:20:28 +0100 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v7.1
    https://git.kernel.org/soc/soc/c/c7091fd5ebda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


