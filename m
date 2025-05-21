Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85091221732
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848025; cv=none; b=kcJFeBSrYuarmgAq47crbv2HIXAi3ebNzTVca2e8oVJJPfMpr9xAPEbm7hRVL8utdGq4uZJ4ivIX+a/TK+xxlnjIG/f67vIpXZBhNE2WFQsWBh5h28eBe6RID33MO30KCwrQcrYnPoKUzXgzUUfdl3po/r/oWWFclF6qXPt/uKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848025; c=relaxed/simple;
	bh=/M7k0Mc22Xnu2lADoaacNqC5icHRJO8KxmbREUUNrvs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PQEQ6SIfB5tWbVRGfAqJAcDVkUm78TRQZ/4n3HO074FhVuuU5fYRBkF6ELGneH6DkPwpyWWgYHctLMUSKYdGgKYjk9K571EnsCvKcrhckt3DEwiiNFG09lxjCoxXapxNeqVDmyavS/PN/Fv+YkO4DpZRwxfLyz3+qf5IJ4l/h1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pvf+MNc7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pvf+MNc7"
Received: by smtp.kernel.org (Postfix)
	id 1F3F5C4CEEB; Wed, 21 May 2025 17:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EBBC4CEE4;
	Wed, 21 May 2025 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848025;
	bh=/M7k0Mc22Xnu2lADoaacNqC5icHRJO8KxmbREUUNrvs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Pvf+MNc75QxEKke0kOIzxg1a9mgme8dGc+88ijI1ITR1GhvmtdEpbYj91trJCiDmf
	 JEIQxoszzLXZa+L9u55Uc5/m4G2Yhj1TT9/xVS5w+zjoQ/T04hUwHTS2jgJX0WQSZD
	 eNGWaC3BoS0X78U6i9PomS81LiHSAkSIJ2HcAJpNjYC2hDxqDWNkMxEWjAEEwP1BR8
	 yKthgyaHncJ2w10HiAKC0wLQNECMIAFpZscvbgTO9PpQ+U/YqILfnQVJES4amssHxz
	 A3ca8x2LPKrnVlt0AnfUsCAJC4naoqYX+TN5QimbSsXIal2kwmepAJvWKAAfIYxijQ
	 3lrifjQK6bJjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF7C380CEEF;
	Wed, 21 May 2025 17:21:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4 fixes] samsung: drivers: fixes for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784806049.2163178.5050034088972569490.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:21:00 +0000
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 12:10:22 +0200 you wrote:
> Hi,
> 
> Please pull for current cycle. Both commits fix issues introduced in this merge
> window.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4,fixes] samsung: drivers: fixes for v6.15
    https://git.kernel.org/soc/soc/c/7c1bda099394
  - [GIT,PULL,2/4] arm64: dts: samsung: DTS for v6.16
    https://git.kernel.org/soc/soc/c/e04381e7b74a
  - [PULL,3/4] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
    https://git.kernel.org/soc/soc/c/87901f69400a
  - [PULL,4/4] ARM: s3c: stop including gpio.h
    https://git.kernel.org/soc/soc/c/acda1d3a0ec7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


