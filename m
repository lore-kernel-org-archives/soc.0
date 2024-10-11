Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB82141B5
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645268; cv=none; b=pceJqNAEdjnYWzn4t2pBayZnrxqqPVZMHeOJfY4ZRkUOO5HYYmS5FcsEdbCjZ03HKrv2eTelcTGf8bqiyKt5HVNOIiJsTvGsXfZ6C4M92msrwqOwVig/ORDekdLrNo7eWSBLzzQgEATSo4lPX8C+Ls7b7t0hdZh7/yF0T8JBiB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645268; c=relaxed/simple;
	bh=7clhKU2/+f+UzV2XmxVJrsBEDtV/SxskmzZsp9ZGuY4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=U8YI5zCfKsCW0QVUe8G2SLpYLe7NgWkF1Bab2uc3U3HVTai9KgMGyGylnZlz8PQNxsh6/SsEZIe+V1oO6kuumMhvhauV7zeH0O5q9gr7886h6CjZeXio0BkKzIbtfRV0nwDV1/KQLt0ZPnn7CveuVTLW2EeLBffzZ4aHCMaeUCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRfWN4G/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRfWN4G/"
Received: by smtp.kernel.org (Postfix)
	id E822BC4CECD; Fri, 11 Oct 2024 11:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2802C4CEC3
	for <soc@kernel.org>; Fri, 11 Oct 2024 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728645265;
	bh=7clhKU2/+f+UzV2XmxVJrsBEDtV/SxskmzZsp9ZGuY4=;
	h=Subject:From:Date:To:Cc:From;
	b=CRfWN4G/LHh6DmA7SfDudILaGNGBEAHbnMoqJ+fn0SpzRAzMRxW480lep0UuRMvs5
	 gHjSYEQEuwFVTr4LZnr5CAu59PhAunPM3tnfIFzSwRBZg6EEzsxyUDhzFid+o+RNpF
	 1YuG6nKbm7BZBNwH2bgPa7WLjO+EXfLOcOPUnJOSmupissa8elnncv2zan3rh/LAu6
	 /G6vpFJF5SiazmE3Y8MbrIf65o+Og3crGpmxUeEWffn2pj8lLvQz8zuTkubVRwoVpX
	 nS9TZ62/sfO0hVMtw3RXXh6YHrlaQXXuyB++tgtEahvVadTrol95RoV7VkAgvv0vir
	 RePDyGUcWDrqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 76FF63822E4C;
	Fri, 11 Oct 2024 11:14:31 +0000 (UTC)
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
 <172864527010.2676212.6238641393191356956.git-patchwork-summary@kernel.org>
Date: Fri, 11 Oct 2024 11:14:30 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] SOC FSL fixes for 6.12
  Submitter: Christophe Leroy <christophe.leroy@csgroup.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=895079
  Lore link: https://lore.kernel.org/r/c954bdb0-0c16-491a-8662-37e58f07208f@csgroup.eu

Patch: [GIT,PULL,1/1] Broadcom devicetree fixes for 6.12
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=896885
  Lore link: https://lore.kernel.org/r/20241008220440.23182-1-florian.fainelli@broadcom.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


