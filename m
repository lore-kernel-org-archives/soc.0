Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FED48094E
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398678; cv=none; b=EEZpQo7qFn/lNaQqHWYqSdDL/t1y0Zz7wPqg3CKiTbB05nQfOiHw4ptexvpHwy28oaZa5JwB984injIcl9I3Fa93vwYKDKhoCfpUDK7ymn20T5x7qBo5h37uE+mvphmop/YbC8JqWz8Jt4/14RjsWu5NLQcg/s4srLWYtUsWKlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398678; c=relaxed/simple;
	bh=nsHt9AU0UYBV4YM4SqROQJ/xrda+pAv2ZIk4bq7GP3M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=RO+uWJubZTyZybvuTu/RuxYiyPfzKLCDaS9c9UxqxSj25x5K5aRY3tBQV7f4Fugzj01fNDu+hrZkROpVF7sj+YB9FeDzlhYroVcU/sPXn3exhEucoNWc5WfldFq4wI0SiUgTd/N1m9aY1eQox5twxFYHs040Wx9dL7ZApS1/mgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOae9M2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOae9M2W"
Received: by smtp.kernel.org (Postfix)
	id 0C9331F00899; Mon, 14 Sep 2026 15:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB2C1F00898
	for <soc@kernel.org>; Mon, 14 Sep 2026 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398677;
	bh=gIy1umcHsaawVI8FGQwgfZYO7FngFWBhyXw6A/DHj8E=;
	h=Subject:From:Date:To:Cc;
	b=AOae9M2WM75gelmN+H/BpPMsDBoFhmyEOlsFGCOxo4D72k1s57Cz3EdNXAn/zlYJM
	 Gbk/UNslCew7daRT4+8dMLWsgyIm92KMoJWQtK1zfW0qsf0iNxCOSqKDKhtqLd2EaR
	 As9I5ZcbtvCvQtO4bJ3TBPahw+A+qDPnZmd0Po3dm8CEZXQtEA9hSYpFfP371Q0ITA
	 EUYkIdrdP8plSFuFCALHyEGxCGEOE3kl3OaxyfwFWprCiuTOaCwIWmDriKXlWiG4XG
	 dRpqFFGItyMY3gCYsT8cCNBIzHgFS9BDkg9dgioqBOCUs9lKYORm36U27h/t6NhZH5
	 wstG143mfx/JA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569873924A6F;
	Mon, 14 Sep 2026 15:10:13 +0000 (UTC)
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
 <178939861207.630437.8157084605815724162.git-patchwork-summary@kernel.org>
Date: Mon, 14 Sep 2026 15:10:12 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm: socfpga: fix PL310_ERRATA_753970 Kconfig option
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1159902/
  Lore link: https://lore.kernel.org/r/20260907161952.1148669-1-dinguyen@kernel.org

Patch: [GIT,PULL] firmware: arm_scmi/ffa: Fixes for v7.3
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1160823/
  Lore link: https://lore.kernel.org/r/20260908201216.2993544-1-sudeep.holla@kernel.org

Patch: [GIT,PULL] Renesas SoC fixes for v7.3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1158100/
  Lore link: https://lore.kernel.org/r/cover.1788527983.git.geert+renesas@glider.be

Patch: [GIT,PULL] arm64: dts: socfpga: fix file access permission
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1159903/
  Lore link: https://lore.kernel.org/r/20260907162016.1148705-1-dinguyen@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


