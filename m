Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBF44611E5
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489807; cv=none; b=ETdwu3pR8xceIONXmlKpLiNxOp6T4s8v59UQL7cT2aV4zDnyc/K1/Iuk7k+lDSg08ad/+4Elh8BzEuYDy8vL+75e23o6Nh7FRVKvTPJAPsTeRRCuG0Aj53WtTzQVtEQ3ep634zJ053DQ8pRpNjrHNE9El6JHBfO321w6cyGwsqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489807; c=relaxed/simple;
	bh=s9hu+OPFsRDoNohTTQZxEdI7GtIp2lHOiOIiAy2iOIY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=HrpxFP6cONTco60wXRXDldgA5aRQkBrq3JPb/1WBlCnHhM7+imtlZTiVX/rJbUGyYZHZgBR3cjaRXTxqT1VGtF3ZZbKDwv3ZSFdEVOxuXNCVpRxGvyM+PkHUx7gjO/nOHFLYfwLi5V2ojyFRfI+Z1YIyzEfVbxgxYGDT7fs3s1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfwoQOAE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfwoQOAE"
Received: by smtp.kernel.org (Postfix)
	id 292801F00898; Wed,  3 Jun 2026 12:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E5E1F00893
	for <soc@kernel.org>; Wed,  3 Jun 2026 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780489806;
	bh=U8p+9Sn7oIE/apQdxRi/1l+5HZthROdZEi0nov0w1LU=;
	h=Subject:From:Date:To:Cc;
	b=CfwoQOAEnLseZiVOxARQijcjJKN4Z13Skgx5JnvhzvHHp1pPkGO0FNEJgZgNak+8G
	 lNpvFPUL178CjfTUUcOYo/qbDf+fMc2/Dn9M2eafLhVbdITCEPH6NZiRuYkioCJjd4
	 U8fQRHfWDQXJAgiG19PQfbkAjBLjMzitdIGC0tZzpPqLrKxfTY9/emClUwge90p4LA
	 /02Ited5nUpYbkj+jjoGDmzS6c8Oe3RYfwNucxc8+85GSAwZQ5Lap1/tX+k9r1MdQA
	 CXiqjkWRKa47kxKvXl80vOKpq5ytoUMEMNG18bLou5eu19dDLAL6FboXS3cFI1SCtq
	 CndcSSiLMrWww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B3C1139307B6;
	Wed,  3 Jun 2026 12:30:08 +0000 (UTC)
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
 <178048980764.1389067.14350537867195247882.git-patchwork-summary@kernel.org>
Date: Wed, 03 Jun 2026 12:30:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/6] dt-bindings: Changes for v7.2-rc1
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103497
  Lore link: https://lore.kernel.org/r/20260531060825.1855391-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/6] dt-bindings: Changes for v7.2-rc1
             [GIT,PULL,5/6] ARM: tegra: Device tree changes for v7.2-rc1

Series: [GIT,PULL,1/2] arm64: dts: samsung: dts for v7.1
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103564
  Lore link: https://lore.kernel.org/r/20260531120708.21017-3-krzk@kernel.org
    Patches: [GIT,PULL,1/2] arm64: dts: samsung: dts for v7.1
             [GIT,PULL,2/2] ARM: samsung: mach for v7.2

Patch: [GIT,PULL] STM32 DT changes for v7.2#1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103844
  Lore link: https://lore.kernel.org/r/5f52acde-00e3-4f9c-97bd-9ab068320bc2@foss.st.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


