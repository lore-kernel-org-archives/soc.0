Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6E189
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758751811; cv=none; b=XlIzHwrdYQf2+0sWbe6KiyV3Cp+8tOWjkRe1McrIdFzndsrrMfn3GKVrXRDYAf9lRblQdfv+XuRa2lbA+rhOoSKLNg3dCDka7kk8decDIWgIKS1Kgry1JPORwvQYtkyQ/d9xeL1g858u4A2ZdKKRpKM3lmBQ8K0alc+rE9m1hPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758751811; c=relaxed/simple;
	bh=WS25LO6bhxW3A7NL0xFPPn02CwznuXuXwFG+dEoZbbQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=H3GNR7rrQ2Uv4UDgZgDXc4iMxrfB5U1RevjNVZ3CSQY7tls/4aAt9BNKzyZcuYDZavH9SWWMckEFUsV3qa4NEDJAax+HWjZv6qpWc8QygZFEHY8oXA1WfBKv22rwalGw5BfKfLJadsO5NzVUcNDXBaE05WOSq1ZoqWNxSuTBmEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5qlPyl8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5qlPyl8"
Received: by smtp.kernel.org (Postfix)
	id 16FAAC4CEF4; Wed, 24 Sep 2025 22:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05C4C4CEE7
	for <soc@kernel.org>; Wed, 24 Sep 2025 22:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758751811;
	bh=WS25LO6bhxW3A7NL0xFPPn02CwznuXuXwFG+dEoZbbQ=;
	h=Subject:From:Date:To:Cc:From;
	b=l5qlPyl8guxPc24BODAXBLa7toIoP6NPMifUsDGJNhdarraAUZ0xGiHRi28xDvUhZ
	 3d7GPx5FpOlaLzFQRgh4GGQpyx6STZJlleFlaXWyWbp4bkXVBKfxZfZqFBNRxoDlF5
	 8BGqVoxXvbKsVk7hklJiTvN349U4m4wDi5EufBxwqbXHzPVHGwl28c+u7H59lgHUip
	 Ome9WiJQyRvWP/3FlNm4aFFzJihi/NUyKIqyU2UuhuMRr/ccv1zCUqWQFCt60eMmq5
	 +supLjA2DmIyhMPLO/6XYHnDEYVoqqktEl6CZGRlg00wWZKZjwBFDrIi6zRvf/Hz4t
	 IUDHKLszJUtSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7471B39D0C20;
	Wed, 24 Sep 2025 22:10:08 +0000 (UTC)
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
 <175875180705.2716298.14883299258284422085.git-patchwork-summary@kernel.org>
Date: Wed, 24 Sep 2025 22:10:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V cache drivers for v6.18
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1005790
  Lore link: https://lore.kernel.org/r/20250924-relenting-aqua-a4a93b89809e@spud

Patch: [GIT,PULL] RISC-V Misc Devicetrees for v6.18
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1005783
  Lore link: https://lore.kernel.org/r/20250924-frighten-magazine-ee2f16e64638@spud

Patch: [GIT,PULL] TEE fix2 for v6.17
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1005552
  Lore link: https://lore.kernel.org/r/20250924083404.GA3747732@rayden

Patch: [GIT,PULL] SOC FSL for 6.18
  Submitter: Christophe Leroy <christophe.leroy@csgroup.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1005759
  Lore link: https://lore.kernel.org/r/26615a15-3494-435f-b0c1-861122b4b5e1@csgroup.eu

Patch: [GIT,PULL] RISC-V config for v6.18
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1005787
  Lore link: https://lore.kernel.org/r/20250924-unenvied-armful-5fcc80c23d19@spud


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


