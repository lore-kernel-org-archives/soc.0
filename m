Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579CF23E336
	for <soc@lists.linux.dev>; Thu,  3 Jul 2025 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558392; cv=none; b=GEmp1ydxPXLRdzBKysOYbrXz4sjAvgvTSq0xFD00zJiV8D6Hb0iBFXuGHhNnU/UYcSuXmOP8X/3U7DmsZjCocn5HG7l/w637bZCIdszkw06ZJMpeFqTo3AH0CgUxeNuLKcX89mXkUIk4AlZkgoSoYZF9tnc4GddCTNf8q8ChC5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558392; c=relaxed/simple;
	bh=Fvcvlzcjx2K5HyOp+MxYR9F63DKwHp8y2JbJ2Q9lgl4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=B+mAxMFTnZO0o/794x1/foD/k/J97nLokfwiAhJOxLfmkarLf8Gglw6iV82lr8whFX5oj29Iqg5R+6MSEpeDdYGt8/GRIRHV5IfGd+gZ7ZHmHsOr5s5KaKVOkkPYovFXUUFoag7cWm9uKV56Owgoc9jKoaBBD4CHlhOFKVX7bwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2UJo4eq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2UJo4eq"
Received: by smtp.kernel.org (Postfix)
	id 4C85AC4CEEE; Thu,  3 Jul 2025 15:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3706EC4CEE3;
	Thu,  3 Jul 2025 15:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558392;
	bh=Fvcvlzcjx2K5HyOp+MxYR9F63DKwHp8y2JbJ2Q9lgl4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X2UJo4eqsG+8vHRxTsk2DBaEq2nwdcqI++GxvbFD07Az1YPkHQk5YGNdi04JoBu/s
	 TruLdh6EJ62ee7A0P9c8qMBjlFzA9R6ZFlFYk+1Inbsq/CRV0cOVeCgYtta38vt4Jd
	 blOjF5fmWW4CV+f/rEqc9UXNMYkBy9/cI9LyI7vjskrhd3VARsPlsSJUdBP4wauiw+
	 efAbqTsN95CpXspPTJwQtk28+zkdPYPeluyNG5lSCPdh/TPx6Ch2hUgE64fY+JRQcs
	 pzSJeS7pfZdDvqlv8JcLvKrdRXDC9W0nmKZpzJ150yZlo+gTMdrBP2wl2Tw/8OgfYM
	 eE5fytmGBSOzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE363383B274;
	Thu,  3 Jul 2025 16:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL fixes] ARM: samsung: soc fixes for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175155841624.1537604.13311183610420213188.git-patchwork-notify@kernel.org>
Date: Thu, 03 Jul 2025 16:00:16 +0000
References: <20250616094538.33256-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250616094538.33256-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Jun 2025 11:45:39 +0200 you wrote:
> Hi,
> 
> Fixes for issues introduced in this merge window.
> 
> The defconfig change affects Qualcomm SoC, but the originating commit came from
> Samsung Soc tree and it was not yet picked up by Bjorn, thus I am sending it.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,fixes] ARM: samsung: soc fixes for v6.16
    https://git.kernel.org/soc/soc/c/f31824a60213

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


