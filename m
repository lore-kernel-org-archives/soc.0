Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B593876BB
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094402; cv=none; b=gtVjNsGtU8PEn1G3Du09G/gR+vel267bFB3uFnG2/frOspXNdNYQYoSzPeJ5uLOZmjztLpz7juQPu4YEGmLaGR4Td9wrjWZ+QmPF5/JPUo+OM8Qv6hKGSf8Sb+1lQdAe/Ha7/dMPLA9Q0cFDnzSAmnYtgypmxnK/Tp6vkzoCyW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094402; c=relaxed/simple;
	bh=P8VVdNvzOJHCCNHrrkzV3rDeqqWPdZhuSa0ERFTjCRQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=DR0f0qegZW0Li6SuUE7qsgKkxd+nH2td4UNNVLTRtqAEBZjRj5msh43gIhzOU4OsVY47WvtsXgkyFkdO/LYiRCdMHECJukz8I2XnUEUrnXeZh8Zbxzg1JzxMu54sD4PgQ7jkGQwu2QdfH2CkK+CkR0tnYP7kPV5nU9HkUKVaQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlp1Wy/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlp1Wy/O"
Received: by smtp.kernel.org (Postfix)
	id 291121F00898; Fri, 29 May 2026 22:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAB11F00893
	for <soc@kernel.org>; Fri, 29 May 2026 22:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094401;
	bh=bhjjKPytn9ny/CBZ23xdbKBjVmHYxhrKwI7V9pZRqGU=;
	h=Subject:From:Date:To:Cc;
	b=mlp1Wy/O2KoglzjoDxrA5c2OeqOywDXh/9eunpCdCuaXyiqGFP6D2XaqGgkxjnPan
	 bh/cITelk+6M8MGsHG6sZaEyCw3Ub9hwM4S7H22WuScg4ezSttcT9vxXOLou1hO1IW
	 r5IcDT87WDH+A4DgvyX4/FIVaCATfQhCMGWsNG/qGnyH+k5pmJNX0tv9P94yFXe3z2
	 MGI7YeFVQWnw3AvCq2GGa0p7Oql927GzqejI/QKhQLH0tmlV9k7Lo/4T2w0z34pyj1
	 6XZ0YI6OuI1WfeL8UIEebAiyV64nt/FKh1+EVQT5HqYotjbRWrGkxXNSdJMycMrO7a
	 6bacZwIsKAJkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D2EED39301A3;
	Fri, 29 May 2026 22:40:05 +0000 (UTC)
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
 <178009440426.1985625.8765568182062258614.git-patchwork-summary@kernel.org>
Date: Fri, 29 May 2026 22:40:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] memory: fixes: driver fixes for v7.1
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102685
  Lore link: https://lore.kernel.org/r/20260529071949.12520-2-krzk@kernel.org

Patch: [GIT,PULL] samsung: drivers firmware for v7.1, replacement
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102879
  Lore link: https://lore.kernel.org/r/20260529121757.13224-2-krzk@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


