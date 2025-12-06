Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B172270540;
	Sat,  6 Dec 2025 02:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764986615; cv=none; b=VaKAM/FuEWlper2xytx9Rf5RrPCBSOGejet4ZV1trQ52MfodLOUzgTIlTxgY4+QR93lQpP138K3f9vCI4nt51sJFkZCzJ7Uq3W18yU7Pwth47MTCbAxJ5ETYwn+fCoxHO4YVamGW7bZfmnfVsub1tCw8GVewsDBiTbCapZ2hKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764986615; c=relaxed/simple;
	bh=PbA+1vMq3PQRddyKU3c+Vsns8bbeiwHFu9deTNrC+rk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Q+tZDRHtm4Qwp+cSF12nyWJbluOFNM8Ci2e2AvYd85l+IAxiRkZQlV0xyYygawydqs50Rpzaxqz3KRxikCaD5mzWrPUFVUiJ6ZB+9U4YsY5VwKUcgbRqUfsKcwEGsSsodQImuho0Jxn5ollW3ycg2tTRx6yx5v8ZuCdAvH50BjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYdrNK+K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYdrNK+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F68AC4CEF1;
	Sat,  6 Dec 2025 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986615;
	bh=PbA+1vMq3PQRddyKU3c+Vsns8bbeiwHFu9deTNrC+rk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tYdrNK+K2XPkk6ugWkjoFmHYEZ49jkaKahRHq/fxaN52qEPpoEbJCUV+0WGTS8R0N
	 3/rJDzWkBoN2kVGMxVgd0BebyMohui/5RpZKHdSSrEuZ3QYGn6CTvKCuujoye7CCwS
	 5MKpo50LLfDDDwDD5JtkpIzoaf+4aq3VU092CV1X+xKp/YAv7eqvFhFDE6Q5E3Rlbh
	 UID5HdkAQEPVVqtzj68e5ZfL8RXMrZtyqwite/d4GEaKCbxsGNJMkgjLhhcy1FKeca
	 uKcrs3XEm+YHnWq2EMcriUtzDfKuJ3TSCDqhc7wokS2h9oCK9v+5XQanOjETgwXio9
	 FyTnKUpyA3RcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F26063808200;
	Sat,  6 Dec 2025 02:00:33 +0000 (UTC)
Subject: Re: [GIT PULL 4/6] soc: sew SoC familes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <46536f6a-6225-4d5b-ba9e-5cfc64b414ac@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <46536f6a-6225-4d5b-ba9e-5cfc64b414ac@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <46536f6a-6225-4d5b-ba9e-5cfc64b414ac@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.19
X-PR-Tracked-Commit-Id: 9b418a3bfdd421c01002424958fbd86a1001c2c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 66a1025f7f0bc00404ec6357af68815c70dadae2
Message-Id: <176498643269.1925836.17201281819804899057.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:32 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 05 Dec 2025 19:28:42 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/66a1025f7f0bc00404ec6357af68815c70dadae2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
