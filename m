Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE873A4528
	for <soc@lists.linux.dev>; Wed, 20 May 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273061; cv=none; b=Rl6f3efeWvTkDuSkD45igJRL0HTwrxO5EjnIZCj+FMJdV3m8o11NCb98vDWXMMP7jx82Envw+YMqiyvoPtAgbTSyT7JSa82o05WN0dIz7wkiH1hoPCooKB87DNPdDsLkE9kZbFdRvDXbEw1a98eEGnI+Lsf+dinxzaiGfLgSzc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273061; c=relaxed/simple;
	bh=mouQT0mYBohqmy0SCwQQ6pJfDNBsAVpRcOMNJlhQbMA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=fANcBewGgliN/gqW47a9ToWFk/r7ErYKobgq/czF2dRv2fyOOffRisc9Ro+eKHzbESFQZvjSnHrPM+EYGq07DEFniEeBUyHQpwvCQANraxBvhulqTklyU2MHnKfezqTvanaO7CKt3qU7JnxF9pyp49YygnPeQ4HgiCZWLXgnYCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXXTDHUV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXXTDHUV"
Received: by smtp.kernel.org (Postfix)
	id 2BC601F00894; Wed, 20 May 2026 10:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CA21F00893
	for <soc@kernel.org>; Wed, 20 May 2026 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273056;
	bh=lmEbERn4YKgNTFeWlBQCF5ygtK8TRhB6pOKQDKHTsx4=;
	h=Subject:From:Date:To:Cc;
	b=kXXTDHUVNokJMtnthyGd5YtfwVeKwaroq6IVvVBUKXPMvyfCC/7+3VLzfW3Tt4iIv
	 z9ejOEHUpxF+Hmy5MTKeaJwAU+hh1rCrsuxvrzeJpMYOpdvtzL0Q7/o5d43SuW4Vsb
	 e3nHRagVeLT+8e1LXto4nprvRKi+RW/dP1JixjGp1r64ql1aCaDzuZcmXVOEXh9/Ji
	 WNkJkDADixm+RKSCde9FJf7nX9/sBk+leDccr22V27aFym7wWYu+A7O4r+rzmU6Cn9
	 n/X5WDngIpNOWEXPySECpNDBtLmL5rR84BPtw6+9bw4Qg493Q7z1kEBtHN2+4rrpd8
	 tPiZBU7XkiOjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D34243930A0E;
	Wed, 20 May 2026 10:31:07 +0000 (UTC)
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
 <177927306642.3101306.6517365172311722598.git-patchwork-summary@kernel.org>
Date: Wed, 20 May 2026 10:31:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] PXA1908 DT changes for 7.2
  Submitter: Duje Mihanović <dujemihanovic32@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1092003
  Lore link: https://lore.kernel.org/r/KimLSS9zQ2O_qT5luvFs7Q@gmail.com

Patch: [v3] arm64: defconfig: Enable PCI M.2 power sequencing driver
  Submitter: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1094618
  Lore link: https://lore.kernel.org/r/20260514065017.11305-1-manivannan.sadhasivam@oss.qualcomm.com

Series: Renesas SoC updates for v7.2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1097277
  Lore link: https://lore.kernel.org/r/cover.1779185457.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas driver updates for v7.2
             [GIT,PULL,2/2] Renesas DTS updates for v7.2

Patch: [GIT,PULL] SOC FSL for 7.1 (retry)
  Submitter: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1081386
  Lore link: https://lore.kernel.org/r/310b65ba-1d73-4ce0-b332-00cde70acc69@kernel.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


