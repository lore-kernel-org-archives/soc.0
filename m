Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649495;
	b=McPFRPxsYdyFLmtjx5Jj4lU1q/I2hs6B4Fx/KPtE3QBk7X4wmCM9/slQzpVCL3Ea+OMl
	 QUdg/ugXsMBXBR4+lTJX4WESQHY/c45lav9ji/S5e/EFMrR4jFm8ZWPNVPWAKOsmDA1B1
	 /8GH5NJGjyotcWlxlRP89GabghszC/WtoX1FaDHPD1Yem+xPq4MAFreMn2ElGCv9GmZqJ
	 7WPbCjvJoVcUI21kCrA5jdXI3unVapSZ/xb/A3kL+82y4HEH5BJbwFYuv8B9QivsMh/o1
	 pERTrcFW1VloiSwBhG7UyQ6vCRTbtjypXjv3watIJOmwvixn+XOq1RzyMqTxCTPiNQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649495;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Qj4x1lyEyj7Jumg5qZ4XSpZg2qWinCAOR8115B3hQs4=;
	b=BqNHgx2Ac03L0v+aYdFlswA8vdfmkqv+uq2WQxE1vml/qn175G5ELUyquWv09qDTj151
	 O+P0+T7CVsaF3Q312sqf/R4JWcvk6T0UkRJ7/iHF5OjnDfNVK5Hn5WaV2Y1uLZWONczTK
	 dqAxdAWWFZJNwX27zWWVGAfF+Gug933yY9wk9zeZeZUvAQScl/B9l6+a8bAQeRmr1UIHd
	 KMPaK+rzypIBU8LS0WkFLARGTe8b9bWKQ0FgoQOnLgsRAm+C9yZ+tuvVMp4YATZ36NyBv
	 MSZyr90SzmqphOWqRut4pzPsWZpKx8peqcX36TC/LXu2Mgt+Hsi3Tc5rsonYhq34kWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcuxFppJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6490606A684;
	Wed, 25 Nov 2026 23:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcuxFppJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092361F000C0;
	Wed, 25 Nov 2026 23:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795649495;
	bh=Qj4x1lyEyj7Jumg5qZ4XSpZg2qWinCAOR8115B3hQs4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kcuxFppJ1c3gQ4ZZBXRsozye25l0hGpu+svUvyBJmMYkX3I9nGqrqTL4eGRw8on4p
	 a5noIIoWasEbPAQR+TkUxrxnHLXKtx81vBWmgK8CAnWfA2yUwT4Ec7rGFZ2+bOJF5N
	 ek0PU0F6a0gNudXBXzj66+II4Btsbifh8uRCT7HpIrRAZK7KqWDudpc1tDJolU/CfI
	 bOgjv1b7luyk5i+tPbSEwIJym2O9nMqD4Xy4k4STnDIFyeasATRgFc/tGkZ+Y+45Xq
	 3NrvJjv89HDckFxN7oRmdCXwjO5rs2gc/8BnigKqCkdUYtHwGPpXznXqXluUKwU2Rs
	 iD7z5ejEFnIxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14BD3809A29;
	Wed, 25 Nov 2026 23:31:34 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <53b178d5-27b2-4718-8630-16f83a736227@app.fastmail.com>
References: <53b178d5-27b2-4718-8630-16f83a736227@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <53b178d5-27b2-4718-8630-16f83a736227@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-7.4
X-PR-Tracked-Commit-Id: 30275e284469c6f8bb2e1bf7a666b065a81b46c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebb7a8dc1e74c705daffe11c2faf38ec2628f838
Message-Id: <179564949376.1391833.10675768396938450994.pr-tracker-bot@kernel.org>
Date: Wed, 25 Nov 2026 23:31:33 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Wed, 25 Nov 2026 11:40:08 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebb7a8dc1e74c705daffe11c2faf38ec2628f838

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
