Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F919F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644365; cv=none; b=VV7/U2DPsHeMpl8wo7UVPqDUuWAbxf3fQg6fK6vCIVSse37yGzD9R+9KzP3YXLXoYNy6RdMNjMM4XY3htx6dNqrUHcYiZ1MJJeV0gtLgtmxv0wjHNWzUQhm2292nHTENIJLTtoEVQhm049oBGmtAQAZJH8KeWdmLCoLvhWZfeoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644365; c=relaxed/simple;
	bh=zBuvzi4CD9glmVKr1qdv7rUpAwgibGb0apoGzeDHVE8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Sk9vbPaaaBR45K+jg1Odzy33ZIOV4SRf+OBN0ZMcpTsIfpezVWBh87ErF3+aYjn+vc1JW1IelqgeAlE00coqgZ/zMcHzOcRP5Sd5/axafPulz/cqEJgDN7uFXqnI60Jl3yzfc/SOHPwLGi1AYCuMThcama0FKLHAqdm7I3ZClBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhF7RIen; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhF7RIen"
Received: by smtp.kernel.org (Postfix)
	id 44D44C4CECD; Fri, 11 Oct 2024 10:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA72C4CECC;
	Fri, 11 Oct 2024 10:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644365;
	bh=zBuvzi4CD9glmVKr1qdv7rUpAwgibGb0apoGzeDHVE8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VhF7RIennCTlJvcSR3/pndw6QsZUmO/e068D8fFEW93lmXQ7wSLuXMBAattPgIxfl
	 pXQyNMLYNHaVlfycQYPzhfiO0TgSMQJsRFuEs99kdzyCRjKhM1rdhNjnxgSXnPeVwT
	 FBUz1hoAyVJxAWtF0Zl/kaTIZF8J42iGGZ4Ay8Kj+3gAzahKcVYLCNFz6Vagft1cFC
	 DgBLZ3RBAc6sa+DQjRnxRcK1TnVc5A96b+RBMVAIfkA7ZGsJQk+Aw9bnXuiWm4W7Oj
	 IyCAWE2rmeDc/LnY0ZrmFfkf7TdKD/tTsVhs+HHBzyovR6M8gGWzJVq6GDE8tCxdkg
	 Ofv2/yTlZhXbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7DF3822E4C;
	Fri, 11 Oct 2024 10:59:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864436948.2676212.1095791458260310983.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:29 +0000
References: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 27 Aug 2024 14:16:33 +0200 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers for v6.12
    https://git.kernel.org/soc/soc/c/8f99d776b940
  - [GIT,PULL,2/3] arm64: dts: samsung: dt for v6.12
    https://git.kernel.org/soc/soc/c/3b8b1ff762e9
  - [GIT,PULL,3/3] ARM: samsung: soc/mach for v6.12
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


