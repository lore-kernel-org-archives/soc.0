Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858983BE641;
	Wed, 19 Aug 2026 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108348; cv=none; b=ggprNt0qt5fJWEKly0MgqPKxK5D15xVL2JbxDPFfSX5cZJdHQAlZRMF7kYeTOLcefcZ2lCL4V536zQFg+JH7jcFGdWbmTewgTAGyOzitmh0yCNdmqBS+Y4t5hZcaiLe8dXJDoqSceZte4KddHGN0ndDmxDCfLVPI8XolugjZr5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108348; c=relaxed/simple;
	bh=Oh/W6loD1wThOvm8w2jCdo1S/VteK9JOz+Avx4tNYK4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=atnBFftP+jqRPEMDkZFRzOkFJhchLjIVCO1P61bI1XcE+tflRxzzXjOw7cZ+Z6hvQQoClllFB1WKcmfbsc1CpfPOQGmh6eQZ2FoFRNVwsQZpkPqwWid/ayjLvtWdFoMERsnduLwJx4DxiQb+KGqRYww/bpFWukRmziN4cYm6Kaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkOC7+MY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkOC7+MY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E31B1F000E9;
	Wed, 19 Aug 2026 02:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787108345;
	bh=bV+IwPbNSdjQh2V2r1dLNI2xIYGbED5IkX048TdMAF4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HkOC7+MYaCL9pPOif8t8pFwHcYw2nCp8qiOa2k7vJ1/vmMnjn0GPm2UYO3H32/BKo
	 kbgv40D3mmqQVSBcc2lCH+YwN5iECmpBm6CkurY2rVTuZSawMO7Y3aU6aimNTJL8KF
	 uZjO7ezBLJO0ymqlsy8hMzwlqZIo15ZaS1QGqW0LgimNUV2hwj2UQihI10DnZsXvI5
	 B1PKNrq87PnGqnSZLCBDpMUXQuHWDizYmXbDXFssFYquDIR7ivTZEtEugGBBD6qNXg
	 DJH+SqVE09c00dLP4CJ6ba8K8dcxSXliEfan7N8UTCw0s4EHHRFXYklnN16rXYCLly
	 xggnRV8ZytCEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F082C392706C;
	Wed, 19 Aug 2026 02:58:17 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <65b2fd96-9f44-407a-84f6-b42db271c3de@app.fastmail.com>
References: <65b2fd96-9f44-407a-84f6-b42db271c3de@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <65b2fd96-9f44-407a-84f6-b42db271c3de@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.3
X-PR-Tracked-Commit-Id: dfda289ad743d037f33f9e3796e3fd40ca23374c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cbe8aadf1551f3f4a853f24b3b96d9f0eea49c53
Message-Id: <178710829666.2816674.3279445762266943795.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 02:58:16 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 18 Aug 2026 23:16:37 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cbe8aadf1551f3f4a853f24b3b96d9f0eea49c53

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
