Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F52054EF
	for <soc@lists.linux.dev>; Thu,  9 Jan 2025 22:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460718; cv=none; b=q0aBSI6Q9Fv9NuLD15zRu1rpX/CMROSujFHDgKJorV6wa+TdWh2qUKsn5gtuVaVn06dpD7e+yD3usi7x5VPwzeIIRGzX82PZBl+TUIUZnG+LzzSkKqVkPzHSXc0d+dvbgAozhIoVA1PU2T+daLgS5G+2c0B9GdvOBn0oBfzQJyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460718; c=relaxed/simple;
	bh=wVBuW2nyKPku3WCuB0Lw8mAGYcJFi1JthcnDWBCRYac=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ufJbO/bNAWbExLSM6sD2jf+0uTEse2Ant0HtRAL1W4teJuWEphZmUObCpcAHDwT/d/BCg6+xTuOmDYan0Ooumrryf/5M6n01DNqvoVO6WeOFziOkVAhEKAVDe8ahGQAx/FI3sGLMNGdfdMHawws+NBP3lBYYxbj94tPXJ4d01Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsvomWJi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsvomWJi"
Received: by smtp.kernel.org (Postfix)
	id BA385C4CEE2; Thu,  9 Jan 2025 22:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4723C4CEDF
	for <soc@kernel.org>; Thu,  9 Jan 2025 22:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736460717;
	bh=wVBuW2nyKPku3WCuB0Lw8mAGYcJFi1JthcnDWBCRYac=;
	h=Subject:From:Date:To:Cc:From;
	b=CsvomWJie5X7d5v0OhuROt3XKPEqY7IwNSlwNhp8fJNjtj0/rKPdl29e31J/Trfqi
	 j56VXXLbpPKvUVwW8+58VelqhQFtlPQriq3wS/wVkSqq1XCCQj5jO9etMlodFSimKX
	 Ko0sy4oqgOfoStHRIaQBGawVEZ7HTeET7pqI7rqsUCMN0mf4pKi1byYfB8RUESEkPg
	 vr5kS9uJEOWh25nBSI8NJYoZ2AWwBY2MclzNfg1ysialsAyQWN6k14TrlvjjjGXRDu
	 qA2XGpXfr0hbsL4xhKpwyM3xFxazJWyKPPkHMAZFnFl+0AvFm2cKEV8Vw5FjHQeWSE
	 qsowe/JSK5PZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 75A17380A97F;
	Thu,  9 Jan 2025 22:12:20 +0000 (UTC)
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
 <173646073910.1523525.9060999073669663645.git-patchwork-summary@kernel.org>
Date: Thu, 09 Jan 2025 22:12:19 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: firewall: remove misplaced semicolon from stm32_firewall_get_firewall
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=919770
  Lore link: https://lore.kernel.org/r/20241220083335.66350-1-alexandre.torgue@foss.st.com

Patch: MAINTAINERS: Remove Olof from SoC maintainers
  Submitter: Olof Johansson <olof@lixom.net>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=921789
  Lore link: https://lore.kernel.org/r/20250102143003.169611-1-olof@lixom.net

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.13
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=921917
  Lore link: https://lore.kernel.org/r/20250103024945.4649-1-andersson@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


