Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB6C329E79
	for <soc@lists.linux.dev>; Wed, 10 Jun 2026 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781130015; cv=none; b=cdYVRwsjMSlCYY9BdZEF7W1Lh1IOd3ujjQnO98igCfoSMT1tGzK4vmNZAWv2ygM5V5ny7BP4493nOQ7a4GEKYSw24YDzjC/CNi0Q/CLbaqfEcc1yVp+QJuK8sDXpGJOV6f6Q6/eebQdPlZaD+TeCmwm4V6UoqjMKhMZCWz5JjP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781130015; c=relaxed/simple;
	bh=6Gi4JkPcp7rih2LCHCcOQ5e+okmoSaOV0rYSXB0KOIo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=kYlG6jCzP7u8ZRBlL43SI+Dc+ZbZIwfQKESHZTIsf7g0Wn6Jm8as+e1/RUAQLIFg4uMta+DBeJoKq2FMWv2bUZaai+cQPHxW1JXJmMy4/YlPy17psyz2uExpoMDcpCL1IJ0Nxy/71JJbEB+MRL/xJtFzB9O5nqkkGJI8gXNiRV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bctKeu8+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bctKeu8+"
Received: by smtp.kernel.org (Postfix)
	id CEF211F00898; Wed, 10 Jun 2026 22:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CE21F00893
	for <soc@kernel.org>; Wed, 10 Jun 2026 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781130013;
	bh=DABZofaY+u1SyuYNDQTHiQ+zdupeHIP3kaQkTiFeSYQ=;
	h=Subject:From:Date:To:Cc;
	b=bctKeu8+gc+fYUUXgY9S6zvV5o3RiqDmkWDqkYO3LIYGt0cjybAA0nDxNmaiWP8AV
	 C7JCxW5tqgRl6DeUV4OcgMHqk9cOVp35gfvvWv9ygdbiqUTQUHNM9mDXh+q7XR62JR
	 qn7FhbGzmsjsGy/l8l/zpzlWVymIsyW8KFO08w3T4G7x/DGJGXmQCGGP0cY2TyRu/m
	 Du5tf05vm62U3dzx7yzyp38TpM2FVKVN7mhKlPxROnRjcprUmN/S2xtyKL2oVRIj5b
	 l42uGp451MW5Iv3392u4Nlv/AYFLp1gpvbj5ArTGaGUEbsQkF5sk23nYbslLtUI84C
	 1eXZFssj0yseQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 963C43930DFC;
	Wed, 10 Jun 2026 22:20:12 +0000 (UTC)
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
 <178113001117.3654873.513148293021255264.git-patchwork-summary@kernel.org>
Date: Wed, 10 Jun 2026 22:20:11 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] i.MX arm64 dts for v7.2
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1107995
  Lore link: https://lore.kernel.org/r/20260608155731.2323181-1-Frank.Li@oss.nxp.com

Patch: ARM: remove the last few uses of do_bad_IRQ()
  Submitter: Ethan Nelson-Moore <enelsonmoore@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1108956
  Lore link: https://lore.kernel.org/r/20260610045626.248643-1-enelsonmoore@gmail.com

Patch: [GIT,PULL] i.MX arm64 device tree changes for v7.2 (part2)
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1109406
  Lore link: https://lore.kernel.org/r/20260610154001.609755-1-Frank.Li@oss.nxp.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


