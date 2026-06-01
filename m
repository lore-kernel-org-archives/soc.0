Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AACC340407
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780351363; cv=none; b=R3lPadI5woFb2j6pS77B0Wub/H49M+c/pSt3ppzI4LFzWuIq+9nttKam/E5iLZWyv3IRS9Wy3jjfJ24SVK7UUsYybmZ3cUtwk5hDQ99f6H4VRDIRV8Oi55umpu6gD9Ku7L5AJauBLHkPFJk97lu1OWgKIGEu/lnd/1fAtGDlc5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780351363; c=relaxed/simple;
	bh=bsYyBd+1mf++DQI71dKtGyaa39AN0VnGe6Nv6rMbRW0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=cSD8tWEq+mCcqla9Ok/n1ldgggx22NOqevZI6CsyqVkV7vweE2lb8CTg8outzCcxFBH8wUS1MH82YpPCZUI/HCjcHe0JYQ/A81/pn7pz1dGQLbNILouVaF+etfqy9xcUILzMFtdT2ySL2sLfPUaqZgdikMHoLjbwfnMu5Axxpik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vn9GzB40; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vn9GzB40"
Received: by smtp.kernel.org (Postfix)
	id DB8FD1F00899; Mon,  1 Jun 2026 22:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62641F00898
	for <soc@kernel.org>; Mon,  1 Jun 2026 22:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780351361;
	bh=mI3MQSkFbPr54iTUbjHB1cQHJ7k/g3OHjSspVaO20yA=;
	h=Subject:From:Date:To:Cc;
	b=Vn9GzB40Kdlc5gTMl8jrWR4mBVFmgXj7RBAH5OE2aDfYlNQjVWQo/sk75AECq8qYl
	 4zLl+Ce1g6BSOqFCV3wlRuwA4xZhcLRp3dq6kDhCqafYEM77KLkih4Ip6bUsK4nWum
	 Wdp0Fa2vvwzCZlhUXWYhDKgl+DfgXGbV5xK3ma8F3GxgVjA5bgwPNxrNi0rAoc4/Bc
	 zvuHq9JeFJ0684lYJtRGBWJX5PcL+VrD0uugQv5v8ibcAoiWhzPHlTIQSxvtpT0ht7
	 Wro0nvDBQBwH5Vx4V3sJPbW4NNRnNJGyUBHyd4SG5XRVw65p3rO3xDzXc7eWVQxrbe
	 LPh+vNIMxfQQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5697B38119F7;
	Mon,  1 Jun 2026 22:02:45 +0000 (UTC)
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
 <178035136386.102348.5768589424577315556.git-patchwork-summary@kernel.org>
Date: Mon, 01 Jun 2026 22:02:43 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ep93xx cleanup for 7.2
  Submitter: Alexander Sverdlin <asv@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102507
  Lore link: https://lore.kernel.org/r/20260528224507.3772367-1-asv@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


