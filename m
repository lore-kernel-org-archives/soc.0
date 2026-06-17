Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40468385535;
	Wed, 17 Jun 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781721423; cv=none; b=KmTAUulwFe6znKUBjM/BX1PR+6V9mXxNry6fD2HeqyMjuVMJd9lmTzP1xFP4z1zt2JbOcp6gprItrU7FesaSNf8S7JKS+5DEro5Q4ksCB0W9JSxKKrEgrsIiLyV1V6cOm+73wI8+1MVxVZbtFRnepDpLNF+Xf0YkMWlVLZyZHZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781721423; c=relaxed/simple;
	bh=I7yJKmkSo3y6FWlbmK1AFIXtdeOlkHsrqNmnq/PJcrY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YDhIlUk6fu3Aamh6K/oTn9LFTd0FGFnlH5WCs9NOaDJR+bzUpLmzto3ckMraAAsUq967v+TmSTo+Ukz6Ks9DLsyfgu7Q0SOsEtXuZyJ94Mi9f/flGsDFm9ekymeBdVN6HAUZpaGY1/t7Vo8RT8OuZ/Bl7kIM1mBE9YM3C1u1Fm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5Ck61LR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5Ck61LR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217191F00A3D;
	Wed, 17 Jun 2026 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781721422;
	bh=vsXDRt1hcWEJc10VMPsc8Php2knvFLEiK0RhQcFO6Kw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=J5Ck61LRPVwTcNiNWxbvFhbWfU7f+geQM4x6rCDc3Y1a/J2hPsLsApboLalCsrg66
	 WBqtVkT72b9VVTFwsV6hpPHlcbh8BItC5HCOgdX8FgcG+4nHyKDDGVqec+CQ6ONAyT
	 IEwmJ/xaqbBcl5xlYmOCCC1r/8WX0grt5YpQHqS6F6oaihJDV11aGrXp0lQz5GEcfs
	 iB3tzGGVwgD9EsQh+L7WOcPaOu/la+BYbrpwqsaM40TzmRkL+wsWIcCSoq9mNatbcn
	 HRwmqN8jwvBnVTx2fu9bXy+uAbppEP9WwLPGRoL3x6uwaUFTuDHzA77TZ3jXPZyML6
	 gA9AXCvs9elFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A413930FA7;
	Wed, 17 Jun 2026 18:36:57 +0000 (UTC)
Subject: Re: [GIT PULL 0/4] soc: defconfig updates for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <287ca074-9329-4a51-a5f7-35abc0d977f7@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com> <287ca074-9329-4a51-a5f7-35abc0d977f7@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <287ca074-9329-4a51-a5f7-35abc0d977f7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.2
X-PR-Tracked-Commit-Id: cccde8de2c72068051ff8351ae6f1e2a12718aa0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 61cf9588108762323c4c186f94a0c6e7ce5cb9f6
Message-Id: <178172141584.1757661.12713285656299517077.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 18:36:55 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 16 Jun 2026 09:53:53 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/61cf9588108762323c4c186f94a0c6e7ce5cb9f6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
