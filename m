Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8153429825
	for <soc@lists.linux.dev>; Fri, 17 Jul 2026 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298035; cv=none; b=E2BdPXrAvxd+2fRVFQbF67w060WDmwJDCmRCoZXJ3JN5irsRiTVrwCcEdXteISoKV2gr9cI7/5iiBEmO6Ge95LGjpmC4CptB1+aMYDRQnyDVFdEIwfnyD0rB46vgOkYWtE3cISWO5FktMGeWASGC1zTbOeY/QtaCT6vjf0NV3No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298035; c=relaxed/simple;
	bh=CaG+pOLxKA6vdyh0s7cbR23Y/yScu+fU/Sznxr+t9wc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=diFtFz1NxsLXLaBqZ56D3q3WnCLcD04R+Inv1D+dtjkV+miN80vyKoEp9Es89se+eVQZKUOzQAqJXFV2VZBDaCrvbsDJTEuXwTeZ8TbS2h13ilL0e9aJYbEUZYg6F18+BP4U3Gk3exBJdukNCBB1rmKKC5p29j+JsmdPTOoUNmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lx4kK8YT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lx4kK8YT"
Received: by smtp.kernel.org (Postfix)
	id 8F29F1F00A3A; Fri, 17 Jul 2026 14:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CDF1F000E9
	for <soc@kernel.org>; Fri, 17 Jul 2026 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784298030;
	bh=+wYTyQv2e1iugnnTE3eW7kDgt/kSDF5GKpEIipUm8x4=;
	h=Subject:From:Date:To:Cc;
	b=lx4kK8YTivA2Wrq+DVJEL5uQhxS2CtJ+gK2BW6YrRXBku5MREOi9ZN4O/W6eJd4V9
	 3F3TFOtBVfV5BhTtuKQQ+/5A4VEKyM3pSh5OybSI2wiF9O3AoYzryhfuud0ngTLQrZ
	 0qiAR7/6pp9kBcxaorzwvtaLeBcLvZLtYF3Hm//VWLMeSuq5Z3AiyXe9JGs6j1lInj
	 woP37h3MNIwfp/9GqKlMw+LrErDTpWcuqz6PfXSB3fNRbSkYBCe9pINN28zzgvdTjw
	 /dO1jqSSiXZhYO/KRKHSYpxkH8q9Zg5Bc/BkJfGxdxKFe8uu86AMllqxVdW1PbyU9i
	 Yb/vWaellHp+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C457380CEE7;
	Fri, 17 Jul 2026 14:20:04 +0000 (UTC)
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
 <178429800270.1738088.294118902677900607.git-patchwork-summary@kernel.org>
Date: Fri, 17 Jul 2026 14:20:02 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Renesas SoC fixes for v7.2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1128688
  Lore link: https://lore.kernel.org/r/cover.1784193843.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


