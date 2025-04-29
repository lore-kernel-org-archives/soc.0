Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B0923BCF2
	for <soc@lists.linux.dev>; Tue, 29 Apr 2025 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944999; cv=none; b=gc6Z+JsDbu3zlIRsniwu+ZZPfTm6zMH2r7fP1gnmz18/Nt0V8N5GUoCpns1Gl8R4meWivzdKegurYHvpp0WXOB5tKM8lWbk3YNTtxbLrvB7vZzPWSuRe8x3GuDafb7oS3POVN5bBapNibF5R0BZLcNKnTBIsLzyrAh4ycXSYvN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944999; c=relaxed/simple;
	bh=bizRH+erSnCABqDm4YPJ3wCnYYdcMMh/joig10KZKJg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=SfHZj+z1srxiSgi2VNjENp3fOrK6KC31r0zF/f+IVQlFH+0jF3SAmKTl8fALT++n7AqXYJtqjMaK4UrNu6WLJQ7XQahVs3/v2phIAxoVKO/+bQPFvzNVL7x9lFsONGyr2RkuwOwaMSGyczdnM6dYMJXftSSo9wqqLQC2BIDJTSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGfIuPOf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGfIuPOf"
Received: by smtp.kernel.org (Postfix)
	id 40674C4CEE9; Tue, 29 Apr 2025 16:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A595C4CEE3
	for <soc@kernel.org>; Tue, 29 Apr 2025 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745944998;
	bh=bizRH+erSnCABqDm4YPJ3wCnYYdcMMh/joig10KZKJg=;
	h=Subject:From:Date:To:Cc:From;
	b=SGfIuPOfnhZnwpBXTXhRzBQC9pbLRci4m/zQwO1T4FaPL8jGBsX/J6JyT5cbin2H0
	 ZaE1HGU5cP4igbviaoY9FzD04M7aZLJ14wk/o+Eall3Gc+rk2PerjDbCO/4lWhbTgi
	 hmsKQT7fZDm8p0Nl6XGMOBfXynYfdKmBWZkAM2PBqbRDal33O0osYLLhCXq9NdT4cS
	 o+DYijsF05N6r8sFQbAONQOvjcEXyibq74CKrbY1VUw0/vK+Q7khkHePaf8CB2VNg4
	 muWGAL+7jfxORBQE4mm6yb+oKcCvH3jwyPDqwxLV+7iGWg3BTWAzoT7hIKtn6TTTbz
	 v+wLeU7H7ITIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 378FC3806641;
	Tue, 29 Apr 2025 16:43:58 +0000 (UTC)
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
 <174594503686.1672898.11667709274389103547.git-patchwork-summary@kernel.org>
Date: Tue, 29 Apr 2025 16:43:56 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: Fix interrupt controller node for STM32MP2 SoCs
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=957702
  Lore link: https://lore.kernel.org/r/20250428120703.1392456-2-alexandre.torgue@foss.st.com
    Patches: [1/6] arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
             [2/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp25 SoCs
             [3/6] arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs

Series: Fix interrupt controller node for STM32MP2 SoCs
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=957703
  Lore link: https://lore.kernel.org/r/20250428120703.1392456-1-alexandre.torgue@foss.st.com
    Patches: [4/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp21 SoCs
             [5/6] arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
             [6/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp23 SoCs


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


