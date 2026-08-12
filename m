Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C12366042
	for <soc@lists.linux.dev>; Wed, 12 Aug 2026 21:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570850; cv=none; b=hUvYdmWtqqMHRuhwvQwL5SOR+TllhTBwBNexmfgLCjOkNMBA8j4pbVf+exNl0Qj0hjJEWeNVj4Iah+pyPzteX9Dgv3+B4MRHNsWLGs7nVTZMMTSsuAGKO8czZrVNhBGSEv0/zNcJRTydItwrCWX+ln2DNTyuPHwvJkUEzaqRaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570850; c=relaxed/simple;
	bh=bnoXBLJZmRWx7Y8B6CVKo2WqJEQH7MBSwlwEYTLm3cQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=d0CJ9CswpTzQ0z+gWt5Fi+5/i5iDQzwhvQue1SyeSuOn/JX0w9tls8/VDqWrQel+uEarTgdF7TbSPV3uny1FKpdv37LhBHym0hPf8TXMB7AhcNXTH3WfF3cAN41FZxOFKuFnQ3W3AEECDQpWqzAk5FcSSS1MbAaP9Qk3wOzmUIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6H8hYZd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6H8hYZd"
Received: by smtp.kernel.org (Postfix)
	id C1CB81F00A3A; Wed, 12 Aug 2026 21:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC44E1F000E9
	for <soc@kernel.org>; Wed, 12 Aug 2026 21:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786570848;
	bh=YO5WKptZBlQv1jhdOyTqYoOy6Z2rCew0l9T7d0Tn8y8=;
	h=Subject:From:Date:To:Cc;
	b=L6H8hYZdiGt/nYRIeV0urWAAsJqQZVdAHDWyK1m+s17r8XVzB99qOFC4MJhkiiH9+
	 Qw1nC9ePFA6unIpI34pPb6s5WniaKB+fmupv+VWJ2FwrgN6S7GnMxbgGmx1F64VVPM
	 r+OvwXWsTtDcuJRhLUKgraxvvEpSk2fB/38olWCyXh/9rSHGk2W/2ytnGa7WUp6KcN
	 QEnHdqZiO0BaDx6YKpr4dy2i8cmx3SFQxxu/uNw2BMwsxQ55oaWYIZCQmYzVXf+9aF
	 HBMJMuGheT9T0TpXDaGZJ+rYH1nSCM7kfDJn89QMz7Py7pq8ys3vwgnB5r5vsk1EuL
	 ET0qx7Y9e6J+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C106380CEC8;
	Wed, 12 Aug 2026 21:40:05 +0000 (UTC)
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
 <178657080362.2114272.12386480150488580820.git-patchwork-summary@kernel.org>
Date: Wed, 12 Aug 2026 21:40:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Microchip ARM64 device tree updates for v7.3
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1144488
  Lore link: https://lore.kernel.org/r/20260812062003.1285582-1-claudiu.beznea@tuxon.dev


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


