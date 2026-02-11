Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F83334EEF1;
	Wed, 11 Feb 2026 05:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770787116; cv=none; b=M8JVJkOjKo8mmGXMvukCDEVNonDMw4qxZ1nA1VqlHaJnSFXXCwTgvIli9cxcUjSGkeKbwXgmD6ZY3lCUZUCP4C+HSwC///t7fzKto5dKM/CiiyTgZ4jnaDlHCT1jsrn2JCRiUXqDOHLBTzXemia4NMUT4ATQHZkbCnw22umNUWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770787116; c=relaxed/simple;
	bh=gatPfKzn6P1pNeuog7ca9NEDlY7DRIhZVUjzFTPEURU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mClSne1hcBgq4wig7lOgPKt6uvUqbvvhDsrFo8goH8mIoYE1eS5WZ+1L1TVj+4azywxvgPDS8TcMMHpf04lcmi5jzY23tJnT9Zjng8HlGRHPm/JSztvSLa+If5Cd/W7BCkPG1LHVOyw878WAKWz+VN8IgMvL7+GaQsiAMxP3r60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buqx5UrT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buqx5UrT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DA5C4CEF7;
	Wed, 11 Feb 2026 05:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770787116;
	bh=gatPfKzn6P1pNeuog7ca9NEDlY7DRIhZVUjzFTPEURU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=buqx5UrTyeyN9fiYHQD02jbtBZa9OYPMq/HUyy4VWxB7Bnu6xiHu6N9p9FNTYOXWH
	 T7akkCZGfFX45/a0lmS+y15tI6/aypSuLZIjshrBIRVvQn3WMkcaYP7guyNqPbMet/
	 ZgvN/PBdrIvItjfjVI5v3Aq23r6PvM9vnp97/ZfSsGhaXpVdCIcL03VCmtsn+9I9ci
	 nYJaFCSqc37M0pD/xRCm6A/rbb+xSbdYk969yoRePJ9Js1Wqi1mxtNnBBK0L/+6efU
	 ALqdv3fUaotIg2dcknxiz/00ZCFQ8HOg9HG+k9GHIz9BKl5iGOQrmV4w58yoKSf1ng
	 QU9Mc0IVQT7lQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 84FD3380AA50;
	Wed, 11 Feb 2026 05:18:32 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: driver updates for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <0f7a14cd-de06-4b7c-b29b-cd827f688cb4@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com> <0f7a14cd-de06-4b7c-b29b-cd827f688cb4@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <0f7a14cd-de06-4b7c-b29b-cd827f688cb4@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.0
X-PR-Tracked-Commit-Id: cfd00b7e26c8331e3bb0f03ca770888866c15ff4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdbddf72a2ab1cfea699959795d70df3931eefe7
Message-Id: <177078711120.18664.11712890111989648418.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:18:31 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 10 Feb 2026 18:07:27 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdbddf72a2ab1cfea699959795d70df3931eefe7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
