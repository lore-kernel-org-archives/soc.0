Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAA82BD58E
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863017; cv=none; b=psv/dCt989qjnQj14l6L3X2psUJlf3aJpWzDvZ+AK2NXL5VEFb2OxRbWBdPCkGdX/r1gdbOExll2MHlMQUE6hURsSZExo2LRlGHVeYl6xEjcwJz5tjbfVjOQo+LtJJ9fHFS/MnoGwP6h7tn2Ogghd0klTtp4A1G0mL1HLM7f3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863017; c=relaxed/simple;
	bh=6ua6Y8AsIdlQ5TV68BvEs2nqz7u8cfYroGx1I54RhvA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qlH1ErEuIchw4cWxP3NQzLMaydCw245s28ZWjBnKQAJnkHaiIJAXcvW7I7yZgUTe8gjtezL8vSDhm7+NHyEC/854EpG2Cm1eNU8vjrwtmUL5dpKbudJbyvIXeaZT0JiiZfJxZfDYJIBv5e0OWE+ZcpTwE1qabklVLjYtTIIau6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojivn8oF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojivn8oF"
Received: by smtp.kernel.org (Postfix)
	id 26999C4CEEB; Wed, 21 May 2025 21:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110F8C4CEE4;
	Wed, 21 May 2025 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863017;
	bh=6ua6Y8AsIdlQ5TV68BvEs2nqz7u8cfYroGx1I54RhvA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ojivn8oFgCM3lCkHCz4zLImoRe166y9PCIyDK6Mxnwx39Jynow6kLWVLjhLKwxY4T
	 J0uQUl2BHezktcKUPJynOUAVu40L7EwiQ51wMPFl2hnSoRekoi+m+qHuN6CVd8AIjx
	 dd/ZvsLX8qOTXbemHmqeD8AIjIdoIqUSa//0tRittrJKygQszJTZFtKOot4cHWNJwU
	 LP6SlZ6ekc6FtgTzkiT1hBZGljxZxaJKzh1xant+SXYTCoOT9+Xb2utrEtxGIsf/7f
	 Ne8wLR2mihPIE7iDfN+6b98InUnWbt9q5qN899QVReMAryg07h5GtkDsl8PWoZmyQI
	 bS8XnCPmXpH4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ECCC0380CEEF;
	Wed, 21 May 2025 21:30:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] arm64: dts: Cleanup DTS for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786305249.2284637.9133266705528096927.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:52 +0000
References: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 12:42:15 +0200 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] arm64: dts: Cleanup DTS for v6.16
    (no matching commit)
  - [GIT,PULL,2/3] ARM: dts: VT8500 for v6.16
    (no matching commit)
  - [GIT,PULL,3/3] drivers: soc for v6.16
    https://git.kernel.org/soc/soc/c/5bba2c467568

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


