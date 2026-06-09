Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31AC416CEB
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008231; cv=none; b=AdCweINycU2iyS+3saiXRcMfch9jUU7DzhITqHax/Wj5S5TkAN6HhpJKvm3l5gUKiN28crzrAsxsZf8uHdZw2G0KpO4Gz9qHKDPL4n5vDJm+O0TakIKDk4DWlnWGzQnXrl920MQ4G9DgGaRBsyS9u20XH+iDQGPpRX2lLw3PygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008231; c=relaxed/simple;
	bh=JrG0nUYpCjv5dZOpYvzqoKvmTfwJ9Pzh5VLlqupNAeM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=tgxsycBkK0Pan7LXyy1ZRxccJKlSbc7rrBIns62WqxZ78uNTOQZFkEZRajqeS6EEpMW/8yVKSEXKZaH5Ehsv2iC3huua/CIwLVeaIAddjg/BLLjdmngr2nBOZCpSMtgAojNqsTneBmXkeXwY1qGY7DY+92rpB0YUya4GSYkwfXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OX08w1bD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OX08w1bD"
Received: by smtp.kernel.org (Postfix)
	id 554C51F00898; Tue,  9 Jun 2026 12:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB401F00893
	for <soc@kernel.org>; Tue,  9 Jun 2026 12:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781008230;
	bh=CSgjmBTMNRlJPa3X8KDkqHIA5anZTOex8boro/vmuxA=;
	h=Subject:From:Date:To:Cc;
	b=OX08w1bDVltydj5exS/Zsz3s8EXzMNlZ0xRlCZ0ivtNqvfPUOeQOQ4Ki+66tx0hn+
	 pgdoH0M6X7m8tUHsMDje9em/cr+3m8b/t6rEScGHB6nmlF9lO0+Nzzl2wx1VCtQCKg
	 ddLFYsxhhmKYR1CqgJZFEnF43jyGuJ+S3ja4/iQ/Pe/+EEyYV3oKcor+gUc4Wnqgyg
	 c5PlHUGuni2lFvGnecdhfVRf4+aRnlavI92Sl7l0pMBl8YRDrX35uARcsHFVwdTD4B
	 kkSm3b6wWJYJcOPYo7n10AyTJH9vcg4cYQ4xcPz4Ux80efWaF3zkl1weJzTLxZeAHD
	 GC4qAGt/c58Hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D343E39308CA;
	Tue,  9 Jun 2026 12:30:29 +0000 (UTC)
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
 <178100822838.2001790.5356057043686883235.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jun 2026 12:30:28 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.2
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103880
  Lore link: https://lore.kernel.org/r/20260601091225.5223-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.2
             [GIT,PULL,2/3] MediaTek SoC driver updates for v7.2


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


