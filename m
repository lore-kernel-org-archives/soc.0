Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDBC3702EE
	for <soc@lists.linux.dev>; Tue, 18 Nov 2025 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763502646; cv=none; b=ReUXpxV7NG/Hubxq+7K9GOZo1Bhm2aXFSkc14Y15s/jk+mBDQNoCNE2rtHbAOtPv12AU6L/9ovsyvPKHamXHN6caiYM0u4Rdn0D4Q9Ii2A4oGeMJuDennU4KbdFE+z3hd5hHyGzo2KDmVDVeEUijG/rHcjMYHerievBCPZBnWjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763502646; c=relaxed/simple;
	bh=jLHd3r+gvba3Ir5lE7x7A0rYYWu5LlKH9b18V8NGNKs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=tykzOhEY2J8W5mLdldZNA/hyqgNXXP+iR0y6CdDcIOCX+nc9jTufry0uTMFFuqqTbEgenZ+L8ZoO/vDMB3HjBwLzScxfGMXmR+KSf/jTujvPUBZnLkQRAexcN/eOmsScFJcdJowwO6aMAX5Kg8YrvBubQs0TKIvqqAmm81c0A74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBbHxEGq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBbHxEGq"
Received: by smtp.kernel.org (Postfix)
	id C86B9C2BCB6; Tue, 18 Nov 2025 21:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDC5C2BCB3
	for <soc@kernel.org>; Tue, 18 Nov 2025 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763502645;
	bh=jLHd3r+gvba3Ir5lE7x7A0rYYWu5LlKH9b18V8NGNKs=;
	h=Subject:From:Date:To:Cc:From;
	b=cBbHxEGqodcrGnAuDf/w5KBFychusUWK2pFZIvChuwPDx9BKSDUEPN57NxL3EI2oR
	 u1aDQ4V+8MQNhibRkPqTnb9aAUxo5cxZoVRKSvzXAkBKkstyRMzooeF8Zhx1V1gVau
	 UQ9iUqpjvVuTudB48k6HbHhjTdV4mEOoO30438xJfsMyRmKB4JOwWyfnb6A+JZFjJi
	 ZMpPeH4rq3SR/SQ3dJSG6acb2vx8d/h9Oad7Onkf/nBGiojoelpxJjNxkzlv9opZT2
	 XGPGd0+gD7cvR7LaOutn3tZhP9ShQeQEOgM7LH/hT0hZXA3YQuvgsb3/g3q9CtqiR6
	 ChLqB1hb/Zs9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C64380A948;
	Tue, 18 Nov 2025 21:50:12 +0000 (UTC)
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
 <176350261118.116847.11316875811124693078.git-patchwork-summary@kernel.org>
Date: Tue, 18 Nov 2025 21:50:11 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Rockchip dts fixes for 6.18 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024547
  Lore link: https://lore.kernel.org/r/1901272.VLH7GnMWUR@phil


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


