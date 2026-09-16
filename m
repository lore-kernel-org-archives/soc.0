Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33054EE848
	for <soc@lists.linux.dev>; Wed, 16 Sep 2026 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557684; cv=none; b=Mvt3rJY9NztxN/LADImyBPMWR3r6BJdmSlncH29E2VagQgOBnlqizq6QFPoVDVQCgMU7TQRD+14NXqIzfTPKzX5u6p6G7LEPm3Nz5moGGinhAwtUhQ33FyjGGj6neCVq8kQF2INVZPmKbYYhpzfWF9pUyp0d1BzxdzEFKeZPiRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557684; c=relaxed/simple;
	bh=yhv1wGsH54UU/15EDbuVkfMBdkKzgAqBXMqfwd+8ld0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=muj8YhSL7emJ0W0rb00U0ltNRWauYxJGKPKWev3pbTW60o0klq46fBnuWb6WcvqYiGjJIATpj/PlSEJ9LmOZjMcpYycBYT89tSSEhjncRZGJ81bvPeu2HG0DhdUycLA4VLg2p2eEWSIl7leP7ksu0HgIDRBYVYIu/dNIMtT6t0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aC8lUJmq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aC8lUJmq"
Received: by smtp.kernel.org (Postfix)
	id BD9E91F00899; Wed, 16 Sep 2026 11:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C7F1F000FF
	for <soc@kernel.org>; Wed, 16 Sep 2026 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557671;
	bh=4LS67Bi6CzLN9CsX806WWaJla1p+PW5ybWWmHzao1go=;
	h=Subject:From:Date:To:Cc;
	b=aC8lUJmqi1Nt+5vVqrF4qVgidR9FRLXylah1lct/5xTN32f5AEQyAH6lJXDkgyosr
	 zqy70FU2PkHYG4vLx+3uAOFZhP10xkzYV/MAd42r0i4zmWB0L5cAXajW41kAlsLbzo
	 nDeNnmWh/Rz9qIxtaFLxuW21BQeRTxb8fy3NuJNWDvXh84BreA/HDb/uL+Z3t7rvPT
	 hycsn77rNAD5Wbuj7B3lDHW9FwElu85/BzfI91PQNbKKvQcSafbbemFkIsnaueFpxz
	 oQ7Zj25AghkTrS9IO74TJiJNwpxnf5Pw4kJUyBDSAJ7GVwgOaOp6yz4UJFyyaOTsDC
	 AKDH0YjVS4oxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1974039D5FF7;
	Wed, 16 Sep 2026 11:20:07 +0000 (UTC)
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
 <178955760578.2572068.13434262399949522203.git-patchwork-summary@kernel.org>
Date: Wed, 16 Sep 2026 11:20:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] amlogic ARM64 DT fixes for v7.3-rc
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1166344/
  Lore link: https://lore.kernel.org/r/71b955e9-dd75-44ca-8eb8-90267dc70eee@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


