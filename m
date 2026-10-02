Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC72248AF
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977807; cv=none; b=NDSrVrbAi7MPifxUhA2TLovKOhy3F/JzXMAMv9c1x3/a0iiXj3GQWDs6zOXJUm2SXblbAkbRZe4IgTBayZiJ3Ngbh1K5wCUwByvwzNWJ6ZPYED37XNqTORwcu5H2GJBl1L71jS8djs4ycV9B0+E/tx9jKmAwbtHcTZtO8cndnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977807; c=relaxed/simple;
	bh=rSdFhTC39a1bxH81e9W+DD2Ter8A/fI+xMkx66WAixE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=GOgEUh8DI6vkFRHOGuAxiWOlVBvqHHmVRM5wDdfy8CNG1o0dY5aVMxig+CKjL1XSOE0KJwh37Wv+T65YxJYO6vU/31Br6arDMuvRPhyEsUZ2HRXt0cjuBl7rZa1tdC+ubInq0lgLBUjgodZboE+kIQmBxETbLDOseyaLs29ManY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juC7Dc8j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juC7Dc8j"
Received: by smtp.kernel.org (Postfix)
	id 7B5A91F00893; Fri,  2 Oct 2026 21:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6488C1F000FF
	for <soc@kernel.org>; Fri,  2 Oct 2026 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977806;
	bh=YwM2LgcT+VwVjEivtg1bcxaa8uVe1yPgsJA7RIvr4k8=;
	h=Subject:From:Date:To:Cc;
	b=juC7Dc8jSzzQwYrUto7tunuFp7asSNJLcuc/+dX91+kv5RKeaxdX+9kaNO+DHPUkx
	 acTzAubakZUGgIUFkRYTlsB0uJHSGRdUiVG5OuQaEOSjLzCLTM4E5FILhQzZONX8rG
	 qF/xVdHNlNH2EiGyjHzKfcP+T1mHCut927VIiA0xG68yzWzdbpyYBH4vqMrMPIaAIj
	 9PQmqciyTQrCxb9jz+Ej7YV3uN3B7pTpcXNlAd/z7KoWRWtdaqukHQ2CVCx5vJOXbG
	 4UE0R6381qgR/CdNm59fDkqigodksvtEz/gWe+a0cykiGuzY+8qz5U9t6bFOLUzQye
	 icM7dTcVrdJTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3CB6D3811A72;
	Fri,  2 Oct 2026 21:50:06 +0000 (UTC)
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
 <179097780480.3602058.6940653795216976757.git-patchwork-summary@kernel.org>
Date: Fri, 02 Oct 2026 21:50:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL,v2] iMX fixes for 7.3
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1171433/
  Lore link: https://lore.kernel.org/r/20260922145600.2249087-1-Frank.Li@oss.nxp.com

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fix for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1171367/
  Lore link: https://lore.kernel.org/r/20260922132018.358932-1-andersson@kernel.org

Patch: [GIT,PULL] OP-TEE fixes for v7.3
  Submitter: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1178405/
  Lore link: https://lore.kernel.org/r/20261002142443.GA778834@rayden

Patch: MAINTAINERS: update my email address
  Submitter: Imre Kaloz <kaloz@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1172988/
  Lore link: https://lore.kernel.org/r/20260924101245.5011-1-kaloz@kernel.org

Patch: [GIT,PULL] Qualcomm clock fixes for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1171352/
  Lore link: https://lore.kernel.org/r/20260922131156.358224-1-andersson@kernel.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


