Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93B235072
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826215; cv=none; b=C0usjSwmiO/M7WqtdqZgxUUAhVDKzyUBCjbnw5i95oiWDZw4+ETWbixmeroH9uGCjDb2TIMiSywky1woZKHz7odHIby2nPNtabhWwHtphOpYrFC/irrbmkuA0P0PaLkjqbuPADLO6yRBLHIrZl6buiY8k3IK9zvFDUS7l6gNqbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826215; c=relaxed/simple;
	bh=4/E6wlmLGb4/6Qsfy5QW387J60y7hwKKTCwJtwDzJY8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=sO+UtyeMCRiuxP77ppL+w26mqnB9kl+zkCVYPK/A2zXnUYHXBKwmmtiSlq/zJp5jleYomVXPry7/8DCUqWVzJRYIlBYN1xXGKGvYKUkmCl1lO+zfvcTdQTa0OhuyW3DI70QUv+nfhBgbRpjYR/B/nu+bFnSRILLiE+tuetQTQTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAsXrqQk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAsXrqQk"
Received: by smtp.kernel.org (Postfix)
	id C03DEC4CEEE; Fri,  9 May 2025 21:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0F4C4CEE4
	for <soc@kernel.org>; Fri,  9 May 2025 21:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826214;
	bh=4/E6wlmLGb4/6Qsfy5QW387J60y7hwKKTCwJtwDzJY8=;
	h=Subject:From:Date:To:Cc:From;
	b=VAsXrqQkDzI9Auh0uxWwMJh2JfSIQ7gI6RCskSxI4fY1UDBsECpgMEyQAI8iwoRdb
	 Hc2dMsbG0wsbfDMgesQ//Fpwie4jK0SurPac2+gHo3bURFE2ey/3egyKXAucodqsFG
	 Y0kw6TDMceO9dpKpitci3OMZ7K7O98BKsnNbpdF2DEuwpRWGec29QbaM9Ei1dXtGbh
	 7cHqwHPSmtBufuFsifRUPZolTFhFNb208suW9ebv3NGnGUAsr2j1DGZQ/DukqOBXn9
	 flFwf9eeTHreXZU8QtkTmlWijX5keZCZw/xu/v67NgmvEHBxj8Q6Xi0WuU8p/Ekjgp
	 7DGQFastjMvag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3736539D61FF;
	Fri,  9 May 2025 21:30:54 +0000 (UTC)
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
 <174682625285.3817276.13535383900364989121.git-patchwork-summary@kernel.org>
Date: Fri, 09 May 2025 21:30:52 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Apple SoC device tree updates for v6.16
  Submitter: Sven Peter <sven@svenpeter.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=960555
  Lore link: https://lore.kernel.org/r/20250507160827.87725-1-sven@svenpeter.dev

Patch: [GIT,PULL] samsung: drivers for v6.16
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=958762
  Lore link: https://lore.kernel.org/r/20250501103541.13795-2-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/3] Broadcom devicetree changes for 6.16
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=959699
  Lore link: https://lore.kernel.org/r/20250505165810.1948927-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/3] Broadcom devicetree changes for 6.16
             [GIT,PULL,2/3] Broadcom devicetree-arm64 changes for 6.16
             [GIT,PULL,3/3] Broadcom drivers changes for 6.16

Patch: [GIT,PULL] memory: drivers: renesas for v6.16 (for SPI and arm-soc)
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=960827
  Lore link: https://lore.kernel.org/r/20250508090749.51379-2-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] AMD-TEE updates for 6.16
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=961156
  Lore link: https://lore.kernel.org/r/20250509065833.GB4188600@rayden

Series: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=959925
  Lore link: https://lore.kernel.org/r/20250506091736.125733-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
             [GIT,PULL,2/2] MediaTek driver updates for v6.16

Patch: [GIT,PULL] hisilicon: driver updates for v6.16
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=961143
  Lore link: https://lore.kernel.org/r/681D9FC4.6080508@hisilicon.com

Patch: [GIT,PULL] memory: drivers for v6.16
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=960835
  Lore link: https://lore.kernel.org/r/20250508093451.55755-2-krzysztof.kozlowski@linaro.org


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


