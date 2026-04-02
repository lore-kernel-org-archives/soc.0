Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527783CAE73
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 22:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169055; cv=none; b=RriliXQglX0VnJ0v4JZUy0i0NwsOG0SdQy6XfFotrWhoebonIPHqPjLgqj9rscOjAuDRLeBW0Ih+uBcTL0HmAIttB27SD2vMNS7nugEplGdva4bEiRs2FSSYyEjmljtD/LnJATWDDiQ6/WVzil6w6FuBCXd3pBCoOvllPgEnBzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169055; c=relaxed/simple;
	bh=vhVrfUnL2LJVpt9VaiNoAz3aULahTZdvxxeK9ZyE2Ew=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=D8tRUEWgWpU5EJHHew+RtDf62UFJ/d5gpVJ8Xff+jmX0+5FX8QykDVHz1LaF7NGxzSAF9odwxe/RNygHsLiE4ynU+zS3x5PmUL4jIoH45b12SLwPIqzX209eRWzmFklhtswA3oOIMfNTaeB7j7h42fHpJvB22aFkYpRgIQOnL88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv+cUx2A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv+cUx2A"
Received: by smtp.kernel.org (Postfix)
	id 0B0DFC2BCAF; Thu,  2 Apr 2026 22:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9500C116C6
	for <soc@kernel.org>; Thu,  2 Apr 2026 22:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775169054;
	bh=vhVrfUnL2LJVpt9VaiNoAz3aULahTZdvxxeK9ZyE2Ew=;
	h=Subject:From:Date:To:Cc:From;
	b=bv+cUx2A8V4TFqqsiHLcOB4JdsvMidxnKIbZGPBCUGl0z9gkXKyy7nZsp0n8MMPj5
	 Y3EkCKIHXGBOaGN5XQX1Z2SvChrgLPc9iBQn4exjRgD0lx70b4UAsV6vC+2OBQKxFY
	 zrAE6KgJjW0g3HM5yKbldm/HHfJ+XwVbpq0SWyjOdZlk1Eh0C08+35ynTOu4coe/9Y
	 liU/jeATEcuaNSeq41Ze4q7823tEjwFYv3QXu6k9OOF/QtmC0fDuT75Wo9uvW+mL+g
	 yR55yQFyCgzNfE2pLMnRjeyO4A6wod20WOw6h4chj47Qip3XSA/+CxNSkLd69/XlDW
	 GZGC5oj62bORg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 429CF3809A09;
	Thu,  2 Apr 2026 22:30:38 +0000 (UTC)
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
 <177516903691.642994.15916553780689084250.git-patchwork-summary@kernel.org>
Date: Thu, 02 Apr 2026 22:30:36 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075894
  Lore link: https://lore.kernel.org/r/20260401142242.1068620-1-andersson@kernel.org

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 updates for v7.1
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075974
  Lore link: https://lore.kernel.org/r/e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 updates for v7.1

Patch: [GIT,PULL] Rockchip dts64 changes for 7.1 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1076065
  Lore link: https://lore.kernel.org/r/2902697.BEx9A2HvPv@phil

Series: dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  Submitter: Gopi Krishna Menon <krishnagopi487@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074173
  Lore link: https://lore.kernel.org/r/20260329123449.309814-1-krishnagopi487@gmail.com
    Patches: [v3,1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
             [v3,2/2] ARM: dts: st: spear: remove undocumented thermal_flags property


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


