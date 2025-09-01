Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A5EAC7
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724354; cv=none; b=O9jlPS5qAwwadWg/YDg6Vd16FNIsYWprB0toAUPcu6YumuMpiiWE7sEXHxrLJpzCvqnX7gcU+PD9Dzm4lg2syQXUEkzXsr1EOHycx1W2qhNSvee0dTlr6K01uYs1RNOQeUsrPKhfr0lVgL7AVcTfQFn5cEo9Dxl3OlcGJY8jw6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724354; c=relaxed/simple;
	bh=y5/MtGYa5ChpLQdiL1nxAeQoffR2+sjFTqPMNup5oV8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=IyJ0JtlXJVMRbMcTKWaT2m6akGknzAjZO3VMbY6eVt3akcODFccR3/nxwaOGlI+XXAET8JSfGnV2CxkyDGi7xRw3ZIjA5moGGiyMiQOu1tR8JzLnaofFOPE5vKnbXRksPHyKLsQtjmzpD7okWFvfyMWC0iVLO9TukP6h6426dCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zx9lYXIN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zx9lYXIN"
Received: by smtp.kernel.org (Postfix)
	id 4F512C4CEF7; Mon,  1 Sep 2025 10:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390C0C4CEF0
	for <soc@kernel.org>; Mon,  1 Sep 2025 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724353;
	bh=y5/MtGYa5ChpLQdiL1nxAeQoffR2+sjFTqPMNup5oV8=;
	h=Subject:From:Date:To:Cc:From;
	b=Zx9lYXINmEQ29gKUoO6TopxzL5sPG8JiO7c7NDEHuMR+uaGeTlRfBKRiagKSaQMGd
	 M35z5yVJuC45faiHtb4616hafKsj6yQ/F9vCtCqQlTwUg+fEL9Z7acM4yeRUFjs5zE
	 uSANY7q7LylgZ0glO2RrHmUwV2BdDNeUQkS6EIpnPRtjtY/6vpJA1AhriX7llDyXTW
	 1Tjw90KGrkEtly14IOSNrdLFlevNj/tUlm0cB8Zj9slCfTl5k8j28ZsHm3FfN2ehv2
	 Badp11LRTiGjY3fW/QF/cGNIV09EimF9eHeeZMlD0YMpH5Q9IJ5EyHlz5r97h5QM3W
	 BQsVFe+KHSUhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37902383BF4E;
	Mon,  1 Sep 2025 10:59:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672435878.3681523.6803148358630941732.git-patchwork-summary@kernel.org>
Date: Mon, 01 Sep 2025 10:59:18 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] nuvoton: early devicetree changes for 6.18
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=995005
  Lore link: https://lore.kernel.org/r/5e7e5d2cedb3bb232420ad720c857b95d8c02f21.camel@codeconstruct.com.au

Patch: [GIT,PULL] nuvoton arm64: early devicetree changes for 6.18
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=995031
  Lore link: https://lore.kernel.org/r/bf3734aab62a5fcc8959261551bb4b1fa636efbd.camel@codeconstruct.com.au

Patch: [GIT,PULL] aspeed: early driver changes for 6.18
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=995001
  Lore link: https://lore.kernel.org/r/2d122b5c4a19261148993b66e4b98371a684ba74.camel@codeconstruct.com.au

Patch: [GIT,PULL] aspeed: early devicetree changes for 6.18
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=994997
  Lore link: https://lore.kernel.org/r/cb634cffaf0db9d25fb3062f0eee41e03955321f.camel@codeconstruct.com.au

Patch: [GIT,PULL] Apple SoC DTS changes for v6.18, part 1
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=992195
  Lore link: https://lore.kernel.org/r/20250816171501.31944-1-sven@kernel.org

Patch: Documentation/process: maintainer-soc: Use "DTS" instead of "devicetree"
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=990478
  Lore link: https://lore.kernel.org/r/20250812104154.42289-2-krzysztof.kozlowski@linaro.org


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


