Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EB7388E60;
	Mon,  6 Apr 2026 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775495346; cv=none; b=hOELhCwZVy67p+jtIpHaKpVNPElqDUI0FcfMjfHrIw/+pjzstc7K2qQrOFXwkyKauzLKVulY8v2yPRr6C+Ixgb0OisCGYftQP42hFliH1a1hR0ar9bu+H+O1fyHR+eGTwSNdFvC6/3M0U2vrAE7ErYEEsFOyny9YNjgyLcF7d+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775495346; c=relaxed/simple;
	bh=q6gKp785JxKchbmVLWw2lzXRSHeWFhSO6rZ0e3KkhRg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XU6WQgrsG1Yv4/+RpiK1IP7bmD77yLAY0jBAO0Ik8ckjw3ZzrUY9PtJPa32I580ENx8YIDoA7uoRrxzxo+evgC1D2yR0yHvHMnQHqNP1DvbhMQwBN9leYM1uN/jTzHTkUorAU7Z1cNmi5sRY/DzK7pvaGQaYgf3/YO4z1RQAQ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yszqow0S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yszqow0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBBBC4CEF7;
	Mon,  6 Apr 2026 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775495346;
	bh=q6gKp785JxKchbmVLWw2lzXRSHeWFhSO6rZ0e3KkhRg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Yszqow0S10EDbtSVWrHM1agNPCadMSsQttmi8+d/hcX+L0BQvWN9zqnOSkH2gUprD
	 v+DacecAAoDFqWV4/F1eJkOxqGtOHHVZiqWZHdmWPbAMeuylMM1Z3edh9py+DaiOIm
	 BxngS4cJUfdx4BKqYi1GOrqEpFNq3r3k7wQVR7A0+e8xBiBuh5RDAs2EwIFbc0D8Nr
	 gpOiJX5X3eM58AM+YgchV7VtwzD829PeUm5acHQXM3MaD3MdDPfudJgzUyF2SydGyr
	 1hqm/qnfTn/Romv58R7Glvod1M2aie3FtW32B8lk2tiyxdc1DLbcwHHY1CjRu/6Uke
	 YMRL7mr6IQmbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE513809A35;
	Mon,  6 Apr 2026 17:08:46 +0000 (UTC)
Subject: Re: [GIT PULL] soc fixes for 7.0, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <23df0cc0-55cb-4c11-907d-f4d8955c6aa9@app.fastmail.com>
References: <23df0cc0-55cb-4c11-907d-f4d8955c6aa9@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <23df0cc0-55cb-4c11-907d-f4d8955c6aa9@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0-2
X-PR-Tracked-Commit-Id: eaad992e3fa8086db47f2cf05498af518ca5edda
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bfe62a454542cfad3379f6ef5680b125f41e20f4
Message-Id: <177549532487.3192209.5710276572840287983.pr-tracker-bot@kernel.org>
Date: Mon, 06 Apr 2026 17:08:44 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 06 Apr 2026 10:03:08 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bfe62a454542cfad3379f6ef5680b125f41e20f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
