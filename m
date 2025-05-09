Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD37F2356A4
	for <soc@lists.linux.dev>; Fri,  9 May 2025 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806994; cv=none; b=R8/JxpNUUMGTxXBLKotB9TbGUpGy9decbSF+nT3rCrAQuraumQIViK1juK3k5waxRBnDrn8jmQDPHBBcgYiekSlEmNKjAKTyEwNxwiA2r91dmrsiMCGXSgz26MBYu0ErnjJJX66AS/sLYDLt9bEA0pchs6UVZmJNoqsQwa2sf+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806994; c=relaxed/simple;
	bh=FKA0yXTYEcIZB6TBMjJLWpuMf6DB/tkr34Xl0r9RuBg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=mOzYjyKFe+bSfCfr/Aw3zTksfnCINl929LxWcsbTHPTiwiqVRj3hnezFoPT5XBbM6srvVN7i7xVyM4Z7e7hzwc4q6yyqQNcRQcdj/ouCmetaf58vHFh0FoCOMWTDhEf5Sh1lUTXvOGSEoMef15tKqls6nDDgp47UwMngpcrGoHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBhRfNkk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBhRfNkk"
Received: by smtp.kernel.org (Postfix)
	id 390CAC4CEEE; Fri,  9 May 2025 16:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F5DC4CEED
	for <soc@kernel.org>; Fri,  9 May 2025 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746806994;
	bh=FKA0yXTYEcIZB6TBMjJLWpuMf6DB/tkr34Xl0r9RuBg=;
	h=Subject:From:Date:To:Cc:From;
	b=cBhRfNkk+JlwFkGqdfrBkl1885di7pBkfcfQXnKdmYnU3MpHcynKIRrctT+2OGxvv
	 qwXV3OLK9DfMJCn6by51JZlCu3Ph9nNn7ZWBvGZhefiv0fVai3Zc1NHn5cHVtx91B5
	 E33tnJ0BhXyLUWwTmMMKiu2S/YHR5srV+ow3qoNld7c2mBfGhI4NRVnkSmdF/AMpds
	 CKaPM+c+gqAcxOYvjXx1log/RnuR7qf23Azq8Cg8vHYc/HWDwFH/jGA+o6IoEdNg1q
	 9VbpRv+aNz6W9GpgRqej5HMD8HXyiQT4BO5iPRszgnkB16Uj+z7jXqdurCRfK4JgYR
	 Vb0Ev/YvXE7aQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1A75380CFFB;
	Fri,  9 May 2025 16:10:33 +0000 (UTC)
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
 <174680703214.3673480.5418956189981166174.git-patchwork-summary@kernel.org>
Date: Fri, 09 May 2025 16:10:32 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Apple SoC fixes for v6.15
  Submitter: Sven Peter <sven@svenpeter.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=956217
  Lore link: https://lore.kernel.org/r/20250423145047.3098-1-sven@svenpeter.dev

Patch: [GIT,PULL] Amlogic fixes for v6.15
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=961426
  Lore link: https://lore.kernel.org/r/e9c520a1-b986-49e1-b9b1-67511c187716@linaro.org

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.15-rc1
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=958384
  Lore link: https://lore.kernel.org/r/MA0P287MB2262454C19B8899BC1694D04FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


