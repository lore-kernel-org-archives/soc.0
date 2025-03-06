Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6122135A5
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278701; cv=none; b=NBxXpAGw3p5CGMdwWx6ozpv5zO1xpWDWdmBvf9e9P8AgC6iMYea9P0H25Eio7y9ubdHvqiRT3c6BrwpUXJpCtLxhKxnGlPmCp6r1QP0vlr2x6NoZj31yKhMZBFL2STjSoBMHz4+WzcVrNizk2yLEAdQabsXJh/WKcmQ7c5KofkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278701; c=relaxed/simple;
	bh=4OePJNlbDrp3Yqq71f67ctnySUoSEXIkqbfgGcR06rs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=A2iAnOV/qx6JCkgt99oZEpbVT/73PYKWMNG3AfsQ4sMxKNP8bylHlrzGjuVmUCwj8TBDa7RCXjBB7R1XKY8UB6Hsr7kBroixnSSCtIEo6ea5mZmnIhrQH/AbiCoX+PY8/vVrUmXpIGGWCvQTqp34vfKXjzqGeNDtTo3Np5+qnDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhX21yq3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhX21yq3"
Received: by smtp.kernel.org (Postfix)
	id 702FFC4CEE4; Thu,  6 Mar 2025 16:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5D3C4CEE0
	for <soc@kernel.org>; Thu,  6 Mar 2025 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278701;
	bh=4OePJNlbDrp3Yqq71f67ctnySUoSEXIkqbfgGcR06rs=;
	h=Subject:From:Date:To:Cc:From;
	b=dhX21yq3AUtVFrPIXiWp76uojPub2Aye8P+Vl8s2Ej4B7uqwHAHnQSERJ9h0Ek8xG
	 u61asO+vHuZs25gttNeg1zihBmT9S6l5zghZYJS6XAo0XOMDG49SgqwNnKsllbS9Lt
	 9Yg5CqlBPPiQjyOP36SnvAdR9wVGwNN5PopqsUnYBquZErb8O2Rr6zQXn6z7R/4yYT
	 xfufOS5UXdBk4shEShyl7JQvUnYZr77CLXZyrUHqavaSGpvpt7AkFYzkDfzrqBY3pK
	 1m/3h9/Nb74zvjij/XTkcmk63cyHejlGT+OzBBO5qQBWMcR1vZyyBRKyhYFAC4h/z+
	 LOGv0YssiCNSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B47A4380CEE6;
	Thu,  6 Mar 2025 16:32:15 +0000 (UTC)
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
 <174127873427.1655995.15667727892260805792.git-patchwork-summary@kernel.org>
Date: Thu, 06 Mar 2025 16:32:14 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [RESEND] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-delay-scale" property
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=940774
  Lore link: https://lore.kernel.org/r/20250305224952.2995841-2-robh@kernel.org

Series: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.15
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=940992
  Lore link: https://lore.kernel.org/r/20250306113540.148342-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.15
             [GIT,PULL,2/2] MediaTek driver updates for v6.15

Patch: [GIT,PULL] Apple SoC DT updates for v6.15
  Submitter: Sven Peter <sven@svenpeter.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=932020
  Lore link: https://lore.kernel.org/r/20250209135558.8243-1-sven@svenpeter.dev

Patch: [GIT,PULL] Apple SoC RTKit IPC library updates for v6.15
  Submitter: Sven Peter <sven@svenpeter.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=939338
  Lore link: https://lore.kernel.org/r/20250302113842.58092-1-sven@svenpeter.dev

Patch: [GIT,PULL] Second batch of Apple SoC DT updates for v6.15
  Submitter: Sven Peter <sven@svenpeter.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=939344
  Lore link: https://lore.kernel.org/r/20250302115808.59172-1-sven@svenpeter.dev

Patch: firmware: arm_scmi: use ioread64() instead of ioread64_hi_lo()
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=940111
  Lore link: https://lore.kernel.org/r/20250304144346.1025658-1-arnd@kernel.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


