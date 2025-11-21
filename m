Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB5E2D77EA
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756541; cv=none; b=e4czQVu8atKT5nVE12qOaz4//1wd0w6XGAWh3FFU0qsx2GjsZN7D7qiu9iCHnEiOLBjZv5vUBykvPM+2mcZkNWWgqckrSSr0+AxW2uRqYHSV6wRolu+eNPu32Mc+gvPLocI5QwmL+UfIvlF32jmUDsx3BrtdXn862J2SEbqV+QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756541; c=relaxed/simple;
	bh=N0fWqoDNjh2afFeHlxsiytex3eNonZprxSMxoI0fRfQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ertKKe/PgduQ9UaA02Lr/kI6t3zlv8+30wye0+fhwptX9iBLQhTN8KlX6wR1NaAQSjblFK7jVuixpLuMEQUrzQmGt5yVxHFYL+37spOj7FwvGIFeoITBpjOhCiW1qMDP6+QeevPGVN7MRSIvOTWbAbbCEedt/zhL7YBgesQfcpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pw5nUv9a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pw5nUv9a"
Received: by smtp.kernel.org (Postfix)
	id 6F885C116C6; Fri, 21 Nov 2025 20:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A77C4CEF1;
	Fri, 21 Nov 2025 20:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756541;
	bh=N0fWqoDNjh2afFeHlxsiytex3eNonZprxSMxoI0fRfQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pw5nUv9a6NKHxJPYuumoUaFfcpv68A+oMSNNaEoRUE1M5gC+DqkYoQCrLaaJ0bche
	 zdTo9HYP1f1YSinonzRiew7cMnvzXXlDZDWKRQemKP/9kGnR68aQDZEkHUlclPItlO
	 lcFrYhBZ74t3flh7zWBEnBJ8BSwceZfdPTSQ9oJ5oS0t2o1Qz+p0wApWHruJUbEtQ9
	 /l+NOxPfzNrTGo6Ya9ekhx7s5gdJFqhfE5udatAu78yCLMipgXJqMiI2i8BMOVQlGJ
	 JpzppddgCcY6qkmlYDA7U5AKDNhXvBRi9t7PpiMVU9Ms3UcowyP9QlT1ME1OUdvRp0
	 KQnIT38NmupHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D553A78A68;
	Fri, 21 Nov 2025 20:21:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/8] syscore: Changes for v6.19-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375650574.2571237.14139049319747524199.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:45 +0000
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 15 Nov 2025 10:00:36 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/8] syscore: Changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,2/8] dt-bindings: Changes for v6.19-rc1
    https://git.kernel.org/soc/soc/c/5d5b665e3e12
  - [GIT,PULL,3/8] amba: Fixes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,4/8] soc/tegra: Changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,5/8] ARM: tegra: Device tree changes for v6.19-rc1
    https://git.kernel.org/soc/soc/c/17aaeb67e115
  - [GIT,PULL,6/8] ARM: tegra: Default configuration changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,7/8] arm64: tegra: Device tree changes for v6.19-rc1
    https://git.kernel.org/soc/soc/c/252f83d5474c
  - [GIT,PULL,8/8] arm64: tegra: Default configuration changes for v6.19-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


