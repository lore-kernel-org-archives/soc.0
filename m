Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A37A93D
	for <soc@lists.linux.dev>; Tue, 25 Mar 2025 06:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742884797; cv=none; b=KpEjqVyj7GJ+teawzXms71uiqiXMlt93DZQ6jcbNbsLNmNjdTiZIQfwH+RSnXMooXJDgLZrf5XUSVNpzVWT0utEuuU6wrZ652nrEpf7I0GpSAAZsMQ9OJagXWPXMo6SBFBCqMgc087iL0sqJ0Y/dKSg7hXRxb0Og4FZ6M/2hyXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742884797; c=relaxed/simple;
	bh=2CssuKNQ22yC+En++SiwIXIlB1JDObfqCfZFEkqXLQY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=CPZnuEOPwPwoyONaAYsIXOXBrx3HEVuylHj0rdjDK4yNKMrT0kpZ06U/RQKWkWrfPJXnzr99QXiGWIGM9gmW8h8Rosdjjw5Y8FWj0WJOJMMON/FYY/DUaeutFbJJiwDZLibWmDlm/l0Fkx8ujcnVBS3nNKItrNJtwHEiQrix5mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhjPD1Tb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhjPD1Tb"
Received: by smtp.kernel.org (Postfix)
	id BECBFC4CEEA; Tue, 25 Mar 2025 06:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96C7C4CEE8
	for <soc@kernel.org>; Tue, 25 Mar 2025 06:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742884796;
	bh=2CssuKNQ22yC+En++SiwIXIlB1JDObfqCfZFEkqXLQY=;
	h=Subject:From:Date:To:Cc:From;
	b=fhjPD1Tb4prSbgXRmUYZBWnMjIWlq5LbAdDWKfPjrSe6c8p4+iUKZaVm8kViWYlQc
	 Otwy1MANMGohPkAxf6BgLWa1qeIiAtbExzKNILJ4YSZUVzT5C/bgNOUGDtOBrOMIVG
	 RQN4QXskcX4Y1c0jD4eyh41gKNqP1wl5lWu8BdZKrgT9aot4OGSyxJrLBgA3AvXbNY
	 UzgGKMnAwvyMcxO9LcuqgJ4j5r1ZpnABoj/jHBKR6G2uwNsWZ0F/Yni167WZ8lfvMG
	 XPS4eOnbqYOM7kFOTGrCadXQiJrCm3vpnrEDVoZL9DjAZ8diX+wXeKbQRyd2lwqSc5
	 pma/2ahzlTmWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F3A5B380DBCD;
	Tue, 25 Mar 2025 06:40:33 +0000 (UTC)
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
 <174288483244.118982.9250946600973913110.git-patchwork-summary@kernel.org>
Date: Tue, 25 Mar 2025 06:40:32 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] SOC FSL for 6.15
  Submitter: Christophe Leroy <christophe.leroy@csgroup.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=946222
  Lore link: https://lore.kernel.org/r/2dea9d3d-ef48-4799-b3cb-df4658ae6e29@csgroup.eu


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


