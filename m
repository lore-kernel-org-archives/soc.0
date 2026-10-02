Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4B83A718C
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977817; cv=none; b=ltEgnapImtM16scVTkMBjYKsW3Hpb8SMGopFOuh+w5h9149Mz100JvlyELZzEs8iTAw0nqAokslLNK27cHkYbq1rA0n8zC/rOX3PcyH+BASksjRbTp1qDJAIk/55arqLbP3BGTlotremnaVxVRt00Tek10rMeR2TZZXFj+AdLNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977817; c=relaxed/simple;
	bh=kadoWkVXXb5jZ8RzPyHawsfFtw+zQGmvoyxqAENWWxw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=rdpU6qKLHSPGEgfM7nXBQd66i5pK2P4+Xg60G8FGyzshge+A5Tggrcg+tdz42TQZcmfAYhK2MH58ca93vcGJUsJbHlksAfQ1At/UndZ5vDvF0aPKbJOB0wMaVmlxHM+ck6KBOFxZl0l/HemA9SAHaMk6Yr98PH48Kze+CkC0zVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcOrJRNQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcOrJRNQ"
Received: by smtp.kernel.org (Postfix)
	id 9726F1F00898; Fri,  2 Oct 2026 21:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817911F00893
	for <soc@kernel.org>; Fri,  2 Oct 2026 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977816;
	bh=52jFNcu4lygee49/dXU8BQSg+gK8l0KtVMytHs41C+g=;
	h=Subject:From:Date:To:Cc;
	b=XcOrJRNQKyxXHSTIkj3O83xc40mdmYo/651PDMTCWoq5xYa2cRd1lnCdmPLLuHZJO
	 95NKPmmNPUa6RdPDAfc7loxc5g5iD01+5gyLyE20/VsnE0k5zW+hmQQkGTQjB+nrlD
	 FssuWU3LUmgKL+WfFk9lF89GuVRFAREJ8jobkKuGWEOE4w0ZPT8uelA+Zqt0687W77
	 7Zq/LcAnjU8i2k5Lp9tEcUao0ZLAoIPH8EXO57iTOOakBMQsuoPDM/tw7FG73uSIWV
	 ONzmIiK3/9LMSexmsvuH3miy1DdJjOnyRv6r0h7Rc10bN509mj8mUaStSxhJYCmeIy
	 0Ycpuron/N72A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773553811A72;
	Fri,  2 Oct 2026 21:50:16 +0000 (UTC)
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
 <179097781514.3602058.1900061691168742431.git-patchwork-summary@kernel.org>
Date: Fri, 02 Oct 2026 21:50:15 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] OP-TEE fixes for v7.3
  Submitter: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1178405/
  Lore link: https://lore.kernel.org/r/20261002142443.GA778834@rayden

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

Patch: [GIT,PULL] Qualcomm clock fixes for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1171352/
  Lore link: https://lore.kernel.org/r/20260922131156.358224-1-andersson@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


