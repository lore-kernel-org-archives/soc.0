Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098606;
	b=Eboew2f4hmuhBVsbkzdN5oPWmlcgE7faxzpr5OYKllEOCQj07wDf48zkXrOWSj5uULSY
	 Npo2hb6w8ZcLle8lH9XhuLWgPkujU7v8stFjgIXlKfg2rNbnn1ZHEJiFtroPqvwlLhq6e
	 102YG6zGy+V5xb8UsUfQFqUU13Ix97cgkpfylrM/wC3dOvGJTL1oTrOUKBXXQwQUPetmS
	 dJghlwIrU1subPw0aCJT/UMFbdLo48caLBblusSeaovDhHN61nkLuWMBtHGNAWxvamRdV
	 aPbsI2iIKUOzv3v4R5G2ijsdAraXEtxj/FqfHY8V/FTnSn+w8VTzSCdyfW2SWmHpG9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098606;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 To:Cc;
	bh=Tuv3LkTj6j7Pz45GduBotz3H4oKR/koavmb8+AFrEQc=;
	b=LIhblkVTobTsIem57iTe3dXnSkCWnLLR9cAJ5RBR5Y6Qi3gn/nFk6Hd2liYm8zT72/xA
	 J5NB+OuHjMwNNNF+Hhp1T1+Ykq0fUHs4jAmVQXIuhisFebYVVMlopTzvN1m9wn3OpfM2e
	 /BXCJyetS9JbE3WOv/TwWsT/CqxTQXYU32/5gHtLarsMrxySd5xAve+kEExaoyNOYQ1XV
	 1UsR3xueIgH3WIVQw5TYYb28LaFOdb0MJATei0qcIYAa+QjDbILcq9YgCCXqCw0RSKIis
	 qrYNVJd+UAxkasTJdJKZX6IwJq8VEcEWaQQo2sYz7LJDXAk90ItaO/7kagh8B8qiyXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HxYHPNya;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC24A606A324
	for <soc@lists.linux.dev>; Thu, 19 Nov 2026 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HxYHPNya
Received: by smtp.kernel.org (Postfix)
	id 7A3F01F000C6; Thu, 19 Nov 2026 14:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642141F000C7
	for <soc@kernel.org>; Thu, 19 Nov 2026 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795098606;
	bh=Tuv3LkTj6j7Pz45GduBotz3H4oKR/koavmb8+AFrEQc=;
	h=Subject:From:Date:To:Cc;
	b=HxYHPNyav/iDJovwsd9z8PlPk03Fo+09trK7+dqt+dS6TOU9EgVyQ42kIhJY19Z1U
	 wDQ4aGHDEWTVU1gywqIXofOnJVdXhtTxDlvjgVwDllZhhbfPC0vUN3lRpQJTxZBfeb
	 As9bANrY8JH8htW8GU0tIwmSBS2KHULMVdOT2KqgC7n0wLw0aAZmIlsPKRZz4eP0hc
	 xRGmlwPc/u0sX0LsxA2RUDoEH84Wv2I9HeFK35pXM5G+xE8XmU6nQCYTvWdMxfD69K
	 8WekYnciVkSOXEDK3817LcG4ZOm04kcNWNk2trzkmQZUQ6Tf+ydA8ko30OcF1Klybb
	 yhqINh3YHvHXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3C94B3808210;
	Thu, 19 Nov 2026 14:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179509860471.3125960.17302785798233893359.git-patchwork-summary@kernel.org>
Date: Thu, 19 Nov 2026 14:30:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: arm64: add Ambarella CV75 SoC support
  Submitter: Long Zhao <longzhao@ambarella.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1215988/
  Lore link: https://lore.kernel.org/r/20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com
    Patches: [v12,1/6] dt-bindings: arm: add Ambarella CV75 platforms
             [v12,2/6] dt-bindings: clock: add Ambarella CV75 RCT
             [v12,3/6] arm64: add ARCH_AMBARELLA
             [v12,5/6] arm64: dts: ambarella: add CV75 SoC and EVK
             [v12,6/6] MAINTAINERS: add ARM/AMBARELLA SoC support


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


