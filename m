Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE2A1EEA3D;
	Fri, 24 Jan 2025 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737760205; cv=none; b=ShTRfLrEAAmgxLFsB5cB+qbeFgWEZ+4IBzv6jg+fUA7a4hQYgvbQB/2rCzjA/qeW5tWN4cOMSGTOaQ+RCp0PQ2HLy3eYb1OOsKFHP7DpIDotJ4fMy8yaYPtM21otrFHF2ZOfarWaCh/LHwgvlAPT4g6dXNS9a9vkZoD0ADwnFBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737760205; c=relaxed/simple;
	bh=psal5TeyyH/P1IOmxYc0hNvF6xTwlmznaKSkvYXLboo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VvjvXjp68ZEryxsF+1nguVaM1KrFedS2D2IxBXpeOAuM2wgTNOMgiP4xlQ1LhwU18dcUezEnPZBELYzyNmwUqtftIUGhTztFzEX8xhn7dx/mXBtwtpdVdLMCd3rR5f2Ne9IrRBlfzqxMCFKlojwBTh029kRf7DrAMgvU6HoRNiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCE7q8Qn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCE7q8Qn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0637C4CEDF;
	Fri, 24 Jan 2025 23:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760204;
	bh=psal5TeyyH/P1IOmxYc0hNvF6xTwlmznaKSkvYXLboo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sCE7q8QnjUg37RP2Gsp7+0pAH/dkfMCI1Mqh3YLImhoUpR2BeH7PPOo5gCyZgJg/l
	 s2LFZeZFZ5yRAzubFCS7rNWMrtIHDpSrI4hWImFW/Yi6xojasrvFCqWKHh6MDaI/yn
	 ccYe7IJS/dtOVMWs3aWvRyH+OTnZXyxHisXzyrKKBGm4wbBy5BSsgaBhLMfnmRa/Z+
	 aaQdHoEeTBEGDXqVwda2TffTYhkPIDx4qM4AMV1cv3tFu0o58iOnDOKXQYkcOapnxx
	 VSDiV+adAsDKG46xFt51fPTbSF7Tggh6svx2MoEEil8beimxbVi2LMKEDtf6HKreKW
	 3AGTVOi06ldoA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 08774380AA7A;
	Fri, 24 Jan 2025 23:10:31 +0000 (UTC)
Subject: Re: [GIT PULL 3/5] soc: devicetree changes for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <a31f0a31-8c70-43d1-b2e5-6072ac5d8b53@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <a31f0a31-8c70-43d1-b2e5-6072ac5d8b53@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <a31f0a31-8c70-43d1-b2e5-6072ac5d8b53@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.14
X-PR-Tracked-Commit-Id: 3c9690f76d66f45f727e00c838faba9a3ef4e295
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f10203927097ff9e5a251f170038fefa38e274b7
Message-Id: <173776022990.2196000.9156649489225251981.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:29 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 24 Jan 2025 16:06:32 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f10203927097ff9e5a251f170038fefa38e274b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
