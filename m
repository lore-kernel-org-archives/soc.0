Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F33370E3
	for <soc@lists.linux.dev>; Fri, 17 Oct 2025 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712511; cv=none; b=jggnW2zshAFBCERvI0yufneJNltf8zN3yvRPoZAyx3WbXNDZzfj7c4026gRUPfj9HaSgjCbOdHJhYQiid8Ed/aDryx2C6jGAk6HvGh4Aj3PZ85M2RRGgHjePupmjdZBFsY86qhN68xby6HDX4T/foIp7yPhESg7T2f4PQf6FYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712511; c=relaxed/simple;
	bh=oL1ac3kHyKICXrYt+vfLHex58jESlJ6NZhMgNQQzzJs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=lRvRFOfzAWNVHD4Sipev4tvHtRdPuz9oJ8tbuOeXAloJuJwsrgy/Rxl+Xt3XOineuaMLOQC6qmXX3Vtb83wQNvRFERe0flF6d/zNys2kA5NczYTnJ+yFHLw7/XMnVqF+1p+UX6t0vpfGnzjmxWsAUVLFZHEXu5NAZYTlnKNEtVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzC0C+9E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzC0C+9E"
Received: by smtp.kernel.org (Postfix)
	id BC265C4CEF9; Fri, 17 Oct 2025 14:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CAAC4CEE7
	for <soc@kernel.org>; Fri, 17 Oct 2025 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760712510;
	bh=oL1ac3kHyKICXrYt+vfLHex58jESlJ6NZhMgNQQzzJs=;
	h=Subject:From:Date:To:Cc:From;
	b=YzC0C+9E1+ksYrp0jUHBjeFC+KcOz9UH+phXEo8xrlUG9shPc5VPiI5CpGQm2LToV
	 deJdEHOdxDQ8/k8CuihoujncIR3JFlu/eO78qKbsHkq0mKv2MbSCoRFnuIQYXJgzay
	 BbbAUO5uQGYoCa1g4Jy7Gw2MvOuYyIX6CbalHYeAeoCYr8Cue9r84tcmXJlc5Wm51e
	 PbZmSHbgyGnDGdp9GTlG4Wniw0HkqLLRvw01jpyPXn6p6s8JwcSkmCPx8XGeg/td04
	 bslD3HQs+OaMv1FmDlGqEGudUiEdLIPw1Qqkla7DZu/qg9cMUMeF4Dhq3IHWwMI5lY
	 K2NR1paF+9pTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7446C39EF976;
	Fri, 17 Oct 2025 14:48:15 +0000 (UTC)
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
 <176071249415.2229063.1091726663564448439.git-patchwork-summary@kernel.org>
Date: Fri, 17 Oct 2025 14:48:14 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.18
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1010872
  Lore link: https://lore.kernel.org/r/20251013173543.2489346-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.18
             [GIT,PULL,2/2] Broadcom devicetree-arm64 fixes for 6.18

Patch: [GIT,PULL] firmware: arm_ffa: Fix for v6.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1012245
  Lore link: https://lore.kernel.org/r/20251016093346.945036-1-sudeep.holla@arm.com

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1012246
  Lore link: https://lore.kernel.org/r/20251016093448.945198-1-sudeep.holla@arm.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


