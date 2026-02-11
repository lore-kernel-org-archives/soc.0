Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADF8322A00;
	Wed, 11 Feb 2026 05:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770787133; cv=none; b=SmrLsXzf/6rtR4fIS0gd6Oi3dX1banfyL2zvwiFLnro7uu1ytEmAqXdiiAopuacQR2o2mM1JEcdCqUKQROVRsY0DRUCmokl5bYatLgxeFFLxsKrOfwaCpnSSC+lUHbWBHwr1cTTTrdtQi4UGH6NEn2Y1/Cp70MzbtASOLgMXMSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770787133; c=relaxed/simple;
	bh=doziiPU4GaF+MOSaYoYSMDV/GysXWiDL2SF/9lPR9WE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tNEIwKGU5EPACAeMZPoyy2o4PDpzcEqGWSzK6GujfeeveYC9AdXm+5MXm/c7DomEltj4SQBq9tdMfBDJe1woDFKSbBOg6o8k8JvZ4gz0eqCHfrgnw1YqvsDUA8zNO+WwGY0Z10V6l88jNpLKATlWxhbzYCiTPHZLis6IkWra2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2aKME2P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2aKME2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76685C4CEF7;
	Wed, 11 Feb 2026 05:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770787133;
	bh=doziiPU4GaF+MOSaYoYSMDV/GysXWiDL2SF/9lPR9WE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A2aKME2PD90cq6OLA+1t09f7BE/PmS3BiLQVAMxw0/c5+acevVhu04Sjx9u+htrZJ
	 4H7tBjq1pbf9/GI/orWZjfOdHF+O9fx17VgyzFCy5+XtyQYpwj1PLUFg1DVTfUJ4C3
	 xLPbB9ChxP2fzp0w6mya9pA9arK0glkjjZaQXtgvRVUMKbseIECqSXT9pcNsGFAdTR
	 I/uXN4Ff0ZffP2mojkCPR8SLPlUeOKUWXzPSbMt6I+CSBmWyPICZ5nQ0tTypzwaRD2
	 4TudLWDptd7J+7bPZV9U35mxCUyZFqbztt/pp71nVbZ4WTMaV3U3fX+qzSC4h0EIfj
	 LdshbKyUeNFig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C2192380AA50;
	Wed, 11 Feb 2026 05:18:49 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: devicetree updates for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <a9a6b840-5a4f-4d27-8b34-da82657e5c9d@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com> <a9a6b840-5a4f-4d27-8b34-da82657e5c9d@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <a9a6b840-5a4f-4d27-8b34-da82657e5c9d@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.0
X-PR-Tracked-Commit-Id: f51d34065de4f29fd237276a49cad06ac7356a55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6589b3d76db2d6adbf8f2084c303fb24252a0dc6
Message-Id: <177078712837.18664.14238075137899174735.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:18:48 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 10 Feb 2026 18:09:21 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6589b3d76db2d6adbf8f2084c303fb24252a0dc6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
