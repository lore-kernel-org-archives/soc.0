Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F023537E8
	for <soc@lists.linux.dev>; Sat,  3 Oct 2026 21:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791064210; cv=none; b=iqcwTPp5O8DZkZBeErUTU5TuqsmYc3kpjXIiE2/iCoXsNEcGr4+GaW8zuLMrYlFUe85a9nLCLIFEYJB26Gbe3/096DHhGt3N9Zx7ptrfK+pR2huRZsl/CBi532yKUUzdM6Gw8Net7FdyV6lSU0Dt7ftUrZ7WGATxsS6GfsC6WNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791064210; c=relaxed/simple;
	bh=LU+mdmskzNUYb2sowF9i/Gc446zEv07VCNQV23OWu2I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=uh304PAgrCKuq661eTPFVLDwHQWVbuqmSF+f/c9Z+s8O3ZZFrKhuzyeMuYK1Sj0JhZicSh91FO6D+EFxDzhKrTpSz3lWAaRuiQmA7QxOkOH+gUOOgOnKwgjRBKKWCcVs9CIpjsE9XWBv/SVA/WTgXNVe8FOYicVp5WVxNozLQmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9W4DPCP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9W4DPCP"
Received: by smtp.kernel.org (Postfix)
	id 973E11F0089C; Sat,  3 Oct 2026 21:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817D21F0089B
	for <soc@kernel.org>; Sat,  3 Oct 2026 21:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791064208;
	bh=jU5MCGwPlkoQRmpSAw3ZiT8NKvX+jUd1q+uYjlZ3Ttg=;
	h=Subject:From:Date:To:Cc;
	b=U9W4DPCPmeCTrb9k0gGJAT6YSHQtFxFlkju/oNwCNVf+qUhOmeMCFH3saPK2S3uc/
	 c1JGjFy6YmAsxDbpcPZaN1mKm/5g4OSSgkkfWJhrMR4zZXiKVvn8e4p0UllY278a1w
	 F+3spbCpBo8MH7Qa1JYIOuGANLVC1TsrMv2y2hJPFAiLZBvrD81UyGpfCEq6IIGC26
	 k5fWlRfCnyMfH5fcWN5fFSYHAT8zfSxnkg9LxGauWQNW6lGweHggIujuld1e53Ar4j
	 ejRpGrUf8cjRTOp6XdMyFr4BEg+HKbIX496f6z3gAHMGbGzo9uw3ynaRLjCoi2fDci
	 mLXmZ1wxC5qEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7724D3924A65;
	Sat,  3 Oct 2026 21:50:08 +0000 (UTC)
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
 <179106420703.228056.11708776264485350048.git-patchwork-summary@kernel.org>
Date: Sat, 03 Oct 2026 21:50:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] TEE QTEE fix for v7.3
  Submitter: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1178865/
  Lore link: https://lore.kernel.org/r/20261003143338.GA928803@rayden


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


