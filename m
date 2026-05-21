Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC6B28030E;
	Thu, 21 May 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380614; cv=none; b=BKG63U/oXE4GbN4OFk0sYa01psRPOf0/aNzsMMMd1HGbcmGKq3IlE5Ps8E9TN1HeZFMtcGcKSNimO5d4ArFO9Ge7hY+BUAeA8MBIy4Xe4KalOGT2rhWTSuFXF3YqGDQMqTNbYwJu+qvkXxWtub6fxR92IoPlBXCZ2n789ct8Cog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380614; c=relaxed/simple;
	bh=iwnmjT/Wu6mE77eIFcuLsxFTDvPfjbEtMfp5ypXTPIQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BsgB/oGOdAEfk4XFk3OnPqpz+0C+EX9FuXe+bI3Rf4v8X4U2axyn9GRAD1bGgsxFbZpDDDbXeNvN2Y099WyojwqjjucAFw2hf1f9uH8Oeznv+FR9k2W7FYv+hkoNMb6VTr1zpWjBuadMUhbkuRLLAb4K8icTV64aE+o5AwhPVSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJnjRqYg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJnjRqYg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855761F00A3B;
	Thu, 21 May 2026 16:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779380613;
	bh=f1Dlk7t3CGGAnHWGGA0QsKQQaeWoYRka/VURIXuvDtI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BJnjRqYg0vOY2U8MqPwjcGUSUJMke3BWQGRpCJ8Wp04j3Ew7QBSfu23dGm3f98Yd+
	 KZvxK3FOXhctSlY0KVHO2xQ6EUUiqMmfNF+9T7shzBOZg5CVuxQRz3T51BO6TM+AVE
	 nd7yFnZ3OnfVF9UkaJq0DOU6TwmNQG0nrWkqxOdJmmFLZti2355tJqXFIf+BbyNWUt
	 ABe2BqPG1z/EKWzN8TqoFByJO6PcGe6CXDAnMRyovxJSrB8JkByxZ0yjY4WqOPHqsW
	 QgIzxOtJldY4HOLBLo7bXRMwF65Mu2u7FXR4JDj9C2c051mXMiVRx7cr7GYsBQrRCq
	 PbbXElSl3eFSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B4D3930E0B;
	Thu, 21 May 2026 16:23:44 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <fa4afee7-8cb5-4555-b1e0-de376cc901e6@app.fastmail.com>
References: <fa4afee7-8cb5-4555-b1e0-de376cc901e6@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <fa4afee7-8cb5-4555-b1e0-de376cc901e6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1
X-PR-Tracked-Commit-Id: 1fcf4149418e7a8f8253dd74059d56340795503f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd3802fc4f6b52201a93330d44981a66bd6ef883
Message-Id: <177938062308.406099.7581855805759436158.pr-tracker-bot@kernel.org>
Date: Thu, 21 May 2026 16:23:43 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 20 May 2026 23:13:35 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd3802fc4f6b52201a93330d44981a66bd6ef883

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
