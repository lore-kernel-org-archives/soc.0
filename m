Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB822AD37
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281591; cv=none; b=Pia/GVCFQpEMqFIxmen2zLFlqriLCbUfG7ZQEGH9Qw1nDGT4L2vmi/bhZi7SEP7CJaRUzXFQKtIfpAM0SLr6tZqHGvl9uYW5SYyQB0JwpK+OON4Y/PdTQunjdCHiW7pdQ/QcZTiZPa+K+JY+vjgIWnBCVAX4mteKXpIkZhzAUtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281591; c=relaxed/simple;
	bh=Ab3tsNt4//sDToWm7ZyoaBV6aKerto5SO6PUSHVolDE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=C4GAjpsUFw3tZ1cMLhfhFQB+gpVferBFy7xWLCBNJEiqbqMQmVz/YurdlYDgPds1Tbb23CWtOpdel1f6t3HyBtLjhYyuOQaN4O25OpykbqxkrNhI8TU7fCcBOiVWEPOoPwPwbbna9Zg5/7nYG0iXs7ngA0zrAz9/+zjeEtJ7AYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrmBHSZO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrmBHSZO"
Received: by smtp.kernel.org (Postfix)
	id 60091C113D0; Thu, 27 Nov 2025 22:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF2CC4CEF8
	for <soc@kernel.org>; Thu, 27 Nov 2025 22:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281590;
	bh=Ab3tsNt4//sDToWm7ZyoaBV6aKerto5SO6PUSHVolDE=;
	h=Subject:From:Date:To:Cc:From;
	b=UrmBHSZOwG8yV42SJSCUOPBj4gIA2gOG3yCbfJugYrXc3EmBtpacMtOrgVMTDoDd9
	 2M2y4B0sdQ2M96Ue3jAy2ngpD/BtX8SDnZzkGhqd1ko9akruYV+BFji8x+huTw9uyn
	 r7R7zErslZ+gIsmV2j3WzTf6NTyiO6dyWhf587Ql+HWMhEFoS/x9viDKMddbSGghz9
	 OyDyKh9sJZaOoqKeSWlvRrYcruhzxmkM+W8V0rg6dUnwVL3PK8aZ4Y9umsI3UjPErd
	 Z9r5FxTxYX2Kk4uRpW5vrp31nvZ9C8FkqHUpEnT1YPE3f2x4V8zjGo3jkyGDgusJvV
	 hD31y6QXhUShg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BACC63808204;
	Thu, 27 Nov 2025 22:10:13 +0000 (UTC)
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
 <176428141221.55019.1992443123584837272.git-patchwork-summary@kernel.org>
Date: Thu, 27 Nov 2025 22:10:12 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Apple SoC driver changes for v6.19
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1028044
  Lore link: https://lore.kernel.org/r/20251126211634.8864-1-sven@kernel.org

Patch: [GIT,PULL] SOC FSL for 6.19
  Submitter: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1027984
  Lore link: https://lore.kernel.org/r/bd0f1a68-7e0e-4cc6-995c-f46561b71c52@kernel.org

Patch: [GIT,PULL] Amlogic drivers updates for v6.19
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1027712
  Lore link: https://lore.kernel.org/r/9e0a76ed-8eb5-4820-b64b-a0efa0f91170@linaro.org

Patch: [GIT,PULL] standalone cache drivers for v6.19
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1028385
  Lore link: https://lore.kernel.org/r/20251127-facelift-revisable-772b117a799b@spud

Patch: [GIT,PULL] Reset/GPIO/swnode changes for v6.19 (v2)
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1026397
  Lore link: https://lore.kernel.org/r/20251121152802.3619853-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] RISC-V soc-drivers for v6.19
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1028364
  Lore link: https://lore.kernel.org/r/20251127-wish-shining-300e8fb80599@spud

Patch: arm64: dts: mediatek: mt8195: Fix address range for JPEG decoder core 1
  Submitter: Chen-Yu Tsai <wenst@chromium.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1028209
  Lore link: https://lore.kernel.org/r/20251127100044.612825-1-wenst@chromium.org

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.19
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1027716
  Lore link: https://lore.kernel.org/r/8386665e-b465-4efc-a5c5-72354397623a@linaro.org

Patch: [GIT,PULL] RISC-V config for v6.19
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1028375
  Lore link: https://lore.kernel.org/r/20251127-saturate-slam-ab92576bcca7@spud

Patch: [GIT,PULL] RISC-V Devicetrees for v6.19
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1028393
  Lore link: https://lore.kernel.org/r/20251127-unthread-probable-75bbd4e737f5@spud


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


