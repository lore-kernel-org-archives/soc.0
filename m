Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBBB242D92
	for <soc@lists.linux.dev>; Wed, 23 Jul 2025 20:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753303198; cv=none; b=mq6q8mIRpUvYZprY8zIIJwRm7SMyE+kKNCjreZDs+lgQO5uqB5T/Gd2/NXy2EK7xMbCCbTswesOYDbkBGMJHok+L5nkCq32/FMIe2doGFhMtkK7LT6gexzId/vXmH0phZwkAjqd3U1jp+qztlEDSNaDNrodRfovmh7SZxRWUBzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753303198; c=relaxed/simple;
	bh=dwrEmr1NU8mWy9OMgVdHwzsDwLYbtL8TX2K+ON/8PUk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b61R4ifhbFkZlsvHZ3Z1hMyB5Wd62x0DSufFRStapSCDKfJUpCSqPc49u9JC/gc+UGJaUa7eybLPVyFvV5kzd9VAP5PBf90PXrnFnnK8+h87Us/FuAJABE2bV95I47cKJDUvs+YF4I8PDfslqEy4K9QUBMDiVcxKhQDimtyJJzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h19/qUxt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h19/qUxt"
Received: by smtp.kernel.org (Postfix)
	id AC15AC4CEF6; Wed, 23 Jul 2025 20:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96284C4CEF4;
	Wed, 23 Jul 2025 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753303197;
	bh=dwrEmr1NU8mWy9OMgVdHwzsDwLYbtL8TX2K+ON/8PUk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h19/qUxtxZg0hjwlyrvPWXGxRADAMaJsQ3DQTtXA6FmMbu0uPZJSVQTUD39iHRHng
	 ONQmmWj5FAXGzaJQ2pzrPlmPuIlNvzCt+8oNBdckVcGp5TCshw7svb7b/YgO7+tWhx
	 BhAqDvMysPn3+sP6t/9w642TrEQrfldqqm8G1FIZooueE2tZSRhxxkCaBrE0yK9nMr
	 PjM5et/gWPPy1rBZNG7uR6n8/hgTzhc6/0C49x8ZZJ9j2MUgYBAwJB+pjsKWbv8hNj
	 baNXo6hs8T91mqYNpbMIL0qcoYCe49Hz8NLjmlRq9MabHw45DCf0aF4fs5ICowPKtT
	 tidPP+TG5sOGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB186383BF4E;
	Wed, 23 Jul 2025 20:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] samsung: drivers for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175330321549.1775141.2394086115358417372.git-patchwork-notify@kernel.org>
Date: Wed, 23 Jul 2025 20:40:15 +0000
References: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Jul 2025 11:04:55 +0200 you wrote:
> Hi,
> 
> Late pull with minor things.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] samsung: drivers for v6.17
    https://git.kernel.org/soc/soc/c/0e674132ddfa
  - [GIT,PULL,2/2] arm64: dts: samsung: dts late for v6.17, part two
    https://git.kernel.org/soc/soc/c/4ec93a80d774

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


