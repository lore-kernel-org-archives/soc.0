Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A62A2882AB
	for <soc@lists.linux.dev>; Sat,  3 Oct 2026 21:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791064207; cv=none; b=Pfxc2+QjNSbQwCvmy/KxC1j2YZ388O8Mzc3vaKZUe7XZtDrYUCdVZvWx0AOG5x7ir8RimK4HtxgRCNZjGMC4T+VHGEbt/n+Ox9FSbNe4yJvkkZekMvJfvCoiJlbBJQzxP05qOMXO687c7Od1ermvQf0j2St7j8eOY9cbZpHYBmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791064207; c=relaxed/simple;
	bh=gleKZl1KMFgk47B1aba3LG5IG4IvLQ1BqPDvaya/3zQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=C00FCetbhbhQkyAd8DGMKGRafHAvFOkADKjLdlXj/tcx06p4Kvx2WRgTXaTvFCjrYYqAKxF4WVKpRqv/fskD2SoiDhj6hycz6oOC0sLyRau+WMgkXwgxsue0LeQxovnF84OK0luYW+iwUnrPEc5h4/pfDMVT/WBOl7NW5K/xFJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ay0eihBZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ay0eihBZ"
Received: by smtp.kernel.org (Postfix)
	id BBC2D1F0089C; Sat,  3 Oct 2026 21:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61E31F0089B
	for <soc@kernel.org>; Sat,  3 Oct 2026 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791064205;
	bh=tqpDauvchEXnttJw++o3YQ2zqYKoOI0UV9Gn6KYhuv0=;
	h=Subject:From:Date:To:Cc;
	b=ay0eihBZ8ZUyspCRSENltG6VoKY6rz/yRznR6FwAnVQjUo4EQVw5/02LaHgWEFHYE
	 lIka18XSNm3LJVJVy40rGeVYl8L2FkVesrBT9C15KezcphPyroq5hf2eRQwRTXAtIf
	 YMRPl3XHq5bVMaJq7BMuVw3YLiEm+lc40jBBsJCDwWzaxIm4lJvImHiKDSk5Jz6iHi
	 G5PfXAWSfULiqQzuZpo+fpxSxgddnUHPPv+1/U6ZIyl/exJFvb8RNl36CQMmPjc019
	 BirqwEflE4wNy+lDoIhgwR/Dp65NWGYD/FvWXQz59/68Pi40ecagAdNjD0+xiHGn3z
	 ydk8jjxUQSypg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 79CA83924A65;
	Sat,  3 Oct 2026 21:50:05 +0000 (UTC)
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
 <179106420396.228056.8358018146645432062.git-patchwork-summary@kernel.org>
Date: Sat, 03 Oct 2026 21:50:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] TEE QTEE fix for v7.3
  Submitter: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1178865/
  Lore link: https://lore.kernel.org/r/20261003143338.GA928803@rayden


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


