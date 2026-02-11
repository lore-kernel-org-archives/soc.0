Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C491334D4FA;
	Wed, 11 Feb 2026 05:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770787114; cv=none; b=Glxc/cr+9SMSB/aKYwKDD+q+6As7RuToTldgQuCYaudUGFD64m2UYkkj8qPtyz0xRMf8k8NfRuZF3CXpdL2U9MEExVLIwjFLbdEF0eVrFpdMQ0QyPEh31ctwa9aTqCNoJ4atUmndB4Atux6S3wsHhLQiMrV5+zxCyfI94sKWGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770787114; c=relaxed/simple;
	bh=MhUShsu/dTKL14u2OVm3LEaaQ/U+4tNtbT5a6zgavlU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GyrSZkJo+1emlTYBMiFYZ1NNume2BPJocJs8UplKKWHIODhfcb2bWGjl2Lr9Z4L88IIUu/bhbHdbGpC+R4ymAHSMl2Pb/bNBKtXDeV7PBiVesOc8WZk0rUUFANIXAIE9A5O5tpa0VWqrYNrvWqWeXGaEFpWfknEMsUrrSBezyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRSKmE9B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRSKmE9B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9730C4CEF7;
	Wed, 11 Feb 2026 05:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770787114;
	bh=MhUShsu/dTKL14u2OVm3LEaaQ/U+4tNtbT5a6zgavlU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dRSKmE9BABhwQDG7Iyc5lmgvogzxeTTSwIqc537YnPbX/wvIQZfynJwJGNUlGwvQO
	 mxvPM/4N4MmwccKPhU13Pw2RSUU6vDQniOmK4+m6qHxh30Kw9UNZr/VCTPTkF8sfWY
	 EKzZkbfXIELUl58jZKmsf1pbTQqpGi8IGg3aUvzOH33xhidDRcbxdll44BaDQGsyN+
	 p0v21NDR+L4gJGXekTzjhcnomhaWhzTefeq4CPUxTKTAy92v12Xf7hrADZznnFDBRd
	 kWroxmgpnCr3N0g7GFYdh77FqfN4AvkfJiFdrlb8/Jlv10GFDe6n2cUIz+u8ueF+Wa
	 X0/nMjHA0/GBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0AF94380AA50;
	Wed, 11 Feb 2026 05:18:31 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: defconfig updates for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <21a0711d-fd08-4c06-9de6-ecfa089ca723@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com> <21a0711d-fd08-4c06-9de6-ecfa089ca723@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <21a0711d-fd08-4c06-9de6-ecfa089ca723@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.0
X-PR-Tracked-Commit-Id: 6f3f1d83e511c8dbf36021805070caf08498641e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7fae9b4d38f0c52489640c9688e529c4a58e1b6
Message-Id: <177078710973.18664.17210034290587696768.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:18:29 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 10 Feb 2026 18:06:28 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7fae9b4d38f0c52489640c9688e529c4a58e1b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
