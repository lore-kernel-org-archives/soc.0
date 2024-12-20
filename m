Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4D12BD04
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 17:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714628; cv=none; b=IBxlC8nR2giswMBPhUtJxo/CuKl371Qk5wiZZrQAoVxwYYNBqh7PQtqkSzEWuvoGIzi3Du1C45iVXrA+3sULPd9oX8lXjw5sQ2+PRj4DXLRYOf+IVsMRVLFXI60/S+D4aUcyo0bQWlEKmDaS5ivPFem5vFHuE+y4CuwXrd73+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714628; c=relaxed/simple;
	bh=8MSHpbixhR73D1xlsTWhK9ZWeQbht+vTSOgJJ5BQdx0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=iA3JLgLz51ElM2Jjyt7KRJr2NFq4E7GzcxGea8zQrQj7Ryv3gHWPxn7BBScQK37Bm+r+sR9DBMOAeC3aUCpiuF1PHwwMFYagqEG3lohPVKUIusSq6YBYAVIZyVd/4Mmjrh+WS4sxfw39ZZ8L7Nn3x/5mIqto9Mne40vHkjIXo0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdidbjFn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdidbjFn"
Received: by smtp.kernel.org (Postfix)
	id ACF9BC4CED7; Fri, 20 Dec 2024 17:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AFFC4CED3
	for <soc@kernel.org>; Fri, 20 Dec 2024 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714626;
	bh=8MSHpbixhR73D1xlsTWhK9ZWeQbht+vTSOgJJ5BQdx0=;
	h=Subject:From:Date:To:Cc:From;
	b=FdidbjFn8ze7suRqqDMJUhgGueh2hnF3rYdgdlWvJKK6fvwGtf85cuwTDVfo5hq/J
	 hcxtbnjA6bBw/I+Kt2SjCynibaLvBPNQ6q/A8Q1G2yiEuAdCyiNke+g9X7d00YP3HG
	 Ag4pZKg7esi6mdonI3HmmjZLveoLr9/koFkS7eDUh2ek0kzmD+ONKREzohNRjQtS8h
	 EyvdcHKEiNDBdstgjK2nZCc3bbysnWbjUAIlXvFIJ6MsZUQOXILnxv7Lc+WfbUnMct
	 Ej7vLarb2du8Thi/xM3OavRsCN7RnbKfon/GPngjiT7yzGrTs5h0lFz69MM4YJqZvR
	 lIftZ57BVzISg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0543806656;
	Fri, 20 Dec 2024 17:10:45 +0000 (UTC)
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
 <173471464439.2963436.15065621544143733368.git-patchwork-summary@kernel.org>
Date: Fri, 20 Dec 2024 17:10:44 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 6.13
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=918799
  Lore link: https://lore.kernel.org/r/20241217190547.868744-1-florian.fainelli@broadcom.com

Patch: [GIT,PULL] RISC-V soc driver fixes for v6.13-rc4
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=919195
  Lore link: https://lore.kernel.org/r/20241218-suffrage-unfazed-fa0113072a42@spud


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


