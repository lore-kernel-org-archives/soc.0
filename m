Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B8F19F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644344; cv=none; b=YjjowguMJJrKxk6kfjrXs5uVDzLRMoNEPUVWE+bu4aelf1XGO+5PvtmtzSgCa3Oqqjl+QUak9rpxYMdExNo8JfYXFU4YrUldIcNaA5IVbEw5JgKixPOdVr9YTJLFD/50pgLmh4o3mXyPK6ZciItN6pI+TDYt/p2YJlhZ7QIFehI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644344; c=relaxed/simple;
	bh=owO0KfavZkEcMimpTqIpv0Prv59lo182WTy5fnCgFFs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Xr5CJwk+sh3MKqnOHYD11VOWDXKTihJyr+Z64W/XWBleJlA0+/yfXYILDukKWyq3i0hDNeW+8cbQgU10nt95HRZ5/FPcxz5XdJR4x5Sqx0d+WkQTKlKmVB7+XDxzUvvAhoe+5hvrkOfVQpQfcce7dxE8510xrO0gciKCIzO4MnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bScGYl7W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bScGYl7W"
Received: by smtp.kernel.org (Postfix)
	id 4839DC4CECD; Fri, 11 Oct 2024 10:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C9AC4CEC3;
	Fri, 11 Oct 2024 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644344;
	bh=owO0KfavZkEcMimpTqIpv0Prv59lo182WTy5fnCgFFs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bScGYl7W/I1QHbAd4MzK3i7lwB3bbdunqTIczYN9CmDgLjVx/4twQlShiMUsN36XY
	 ZH8Rn+SxMLVhJ7YnJvKflVLTrG81/42yEXf1hPJGzsBqq13PPOfPp+6qqBxJ/KWBP3
	 Og+M1y9GZhoLw6Wwa37sD/xUIKipbuOV8XqA4a7auodmP3p03owR5fsLlMJx42ZYwZ
	 MX+CPWUZ3m6ooNnjWD6bQmlwTic74MyjBfgP4SncvSH0pdB8deWdxrgI5BTrl6frjo
	 2SkTGp/Ttjjb3gSi43HehUKNXLLBiKiYdVGWpM7f1klCSiAe/OGiZuaa3MqA+TGkW3
	 AjeSb5M9MlhRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF183822E4C;
	Fri, 11 Oct 2024 10:59:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 00/16] Updates for turris-mox-rwtm driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864434848.2676212.16801778199740341205.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:08 +0000
References: <20240831092050.23093-1-kabel@kernel.org>
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 31 Aug 2024 11:20:34 +0200 you wrote:
> Hi Arnd,
> 
> this is v5 of refactors and cleanups for the turris-mox-rwtm driver.
> Back on 15th July [1] you said that I should separate bugfixes in
> another series, which you already applied. I forgot to send the rest
> once 6.11 merge window closed.
> 
> [...]

Here is the summary with links:
  - [v5,01/16] firmware: turris-mox-rwtm: Use macro constant instead of hardcoded 4096
    https://git.kernel.org/soc/soc/c/29d258542f90
  - [v5,02/16] firmware: turris-mox-rwtm: Use ETH_ALEN instead of hardcoded 6
    https://git.kernel.org/soc/soc/c/c3358e101741
  - [v5,03/16] firmware: turris-mox-rwtm: Use the boolean type where appropriate
    https://git.kernel.org/soc/soc/c/b787a6b89284
  - [v5,04/16] firmware: turris-mox-rwtm: Hide signature related constants behind macros
    https://git.kernel.org/soc/soc/c/99ed7980b5b0
  - [v5,05/16] firmware: turris-mox-rwtm: Fix driver includes
    https://git.kernel.org/soc/soc/c/671d5f68698b
  - [v5,06/16] firmware: turris-mox-rwtm: Use sysfs_emit() instead of sprintf()
    https://git.kernel.org/soc/soc/c/97a9c5b3e0a4
  - [v5,07/16] firmware: turris-mox-rwtm: Don't create own kobject type
    https://git.kernel.org/soc/soc/c/579e05ee1bfb
  - [v5,08/16] firmware: turris-mox-rwtm: Simplify debugfs code
    https://git.kernel.org/soc/soc/c/1b649ec180d4
  - [v5,09/16] firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of driver .remove()
    https://git.kernel.org/soc/soc/c/fbd48bd8cf0c
  - [v5,10/16] firmware: turris-mox-rwtm: Use dev_err_probe() where possible
    https://git.kernel.org/soc/soc/c/869b1fc04356
  - [v5,11/16] firmware: turris-mox-rwtm: Drop redundant device pointer
    https://git.kernel.org/soc/soc/c/ed09d6d4f593
  - [v5,12/16] firmware: turris-mox-rwtm: Use devm_mutex_init() instead of mutex_init()
    https://git.kernel.org/soc/soc/c/db955e084748
  - [v5,13/16] firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv member
    https://git.kernel.org/soc/soc/c/21733f5902be
  - [v5,14/16] firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
    https://git.kernel.org/soc/soc/c/8a4853a65b88
  - [v5,15/16] firmware: turris-mox-rwtm: Use ALIGN() instead of hardcoding
    https://git.kernel.org/soc/soc/c/82944f65a0a5
  - [v5,16/16] firmware: turris-mox-rwtm: Deduplicate command execution code
    https://git.kernel.org/soc/soc/c/a79f256fc99d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


