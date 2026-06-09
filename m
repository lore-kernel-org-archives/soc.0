Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87603352C2C
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989606; cv=none; b=AFcI8MOgVf/2TwFwwcFwm46m7Y8kSDVznyp628C881BPs2A+XI36M6c+vMUrGXdZw8dNHFSI346dcSDiKb7t7pcKMyCyzsTEGPUnXJO/rRjSe+/eETD7Eh+B7LMibkwkhqU9D+MVFlwopHXKIRfj6ZnsB5XPoFpZ6K24eYFJM9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989606; c=relaxed/simple;
	bh=8duXETrYUnBmOkj2Gh2SnRXJAa+mHbxnA2en1XwMgus=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=A/7DYnOe2H7X1D+xmaLrRZuXxy6phOSpcuyuruQdHKhECHc91WxXIdQ+mT2zFob0jBqnzrnXSDLa/GNsQDBKGVcrMYGU1H5aimWNTSm2+kL7YEx31UhZeBOTBiTUaI7+cyKOEpUDScNvjhpxShmD+IC2d59Qcx33IA9UW+ZygrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+w9gOBu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+w9gOBu"
Received: by smtp.kernel.org (Postfix)
	id 4072D1F0089A; Tue,  9 Jun 2026 07:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD751F00898
	for <soc@kernel.org>; Tue,  9 Jun 2026 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989605;
	bh=pVweVTcnG3CDYg0iob2YHYcztm/uZIhNRF1sfoRuXWE=;
	h=Subject:From:Date:To:Cc;
	b=g+w9gOBuios0xaIy5QUqhXuPljMmuh+zO/aooWqNUbsk/UNmAVleEgM9yGAQekvVj
	 VOhWIU9Cvjtehv3qT2xBSW+vhphqKDPXDCf9x8XQNN1IAGuQEYAMvrV1cB19fImoir
	 RGsHxe+kbLxjKYVXQ9H4G95ZGRfxPWVCO+3rBkpcd2uvXInsSD2gYUGl7eZj/qf0ib
	 9I+jXOLld7vpbHoYayAs0jgYKk36xVA0qHh2AAHro/5OC/9RizwZuZi1EIIV8VzCxT
	 BLpSFzOEBK0DeagTLEVAUdV1T6nwg3MmDdx6d591sLdaXUzB0yaQzXwwsKweIcIfGC
	 Pgaj4yT1FJAOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D33943822E08;
	Tue,  9 Jun 2026 07:20:04 +0000 (UTC)
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
 <178098960334.1848550.15615893426813528894.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jun 2026 07:20:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip arm32 fix for the current 7.1-rc
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1105836
  Lore link: https://lore.kernel.org/r/4474108.o2A3GueYyp@phil

Patch: [GIT,PULL] RISC-V soc fixes for v7.1-rc7
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1104513
  Lore link: https://lore.kernel.org/r/20260602-brought-impaired-e5cc81043a9e@spud


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


