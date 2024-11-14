Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4775F22EEF
	for <soc@lists.linux.dev>; Thu, 14 Nov 2024 00:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731542424; cv=none; b=J/GlsxlRrh3aJ+wUcrp2EeDtHfcobH5e/MUXd7ZnJFRtfPB3PYe3XTT9L451VBZHG2f4LjwwUoTciTQfYC5YnvVPAroAeQNAkeyvZg16U9PoLdGF6e7xeZkRNN05QJIbimORKA6KTaiELs8Cwl6dkhehmCLiK63RkipXAzQiQOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731542424; c=relaxed/simple;
	bh=zRVtu5ZAWNLqlxLl+qTJzgxUwKZJ9q9prTwtheybyvQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=OV/Q3p9eQlmo1h7u/ewAcs5ysQZ/XZu6G7smU0oE38d2jkqJ1nOUNdeWqim3nt301nxU/jFcnOmfQpWitGjGfQoNTmgBtq9knEHhJ37OhYDi9Kj8Azv2xguqAexRu0Y05pVzxu32C8Z3CojnqmW1yB/ev0AXMx+U0Z3J3vss9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuUGSvFn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuUGSvFn"
Received: by smtp.kernel.org (Postfix)
	id CD11EC4CED2; Thu, 14 Nov 2024 00:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B725CC4CEC3
	for <soc@kernel.org>; Thu, 14 Nov 2024 00:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731542423;
	bh=zRVtu5ZAWNLqlxLl+qTJzgxUwKZJ9q9prTwtheybyvQ=;
	h=Subject:From:Date:To:Cc:From;
	b=XuUGSvFnzqEf5UV/1P/d4nJdDlpS8fkMZmU5zZH3j0ENtbgIiNUN73m0iRa7LRzkP
	 dnoWPZN7n9m8jK+G/OwIoJPkZbMxvU9JoioXumXIExMan4H9sh6t+Uzik6kAIXlFkD
	 FN+QiWC3LJ6v8kLjbT2W29lhV3W7EIZ29FRFaOFWPJ+GN1DM9XF92TXXeTB5RFYryI
	 m+YfL0RL6TT91vfxXb/IqE/qbX07NmrtPLUTz0p0pvZDBodPMmPDeRNzUzl5ZLSS++
	 lz4oIJkvDdzZmjhrJgI2ckH1AMw+eN1bWfjzdhL2wXBEzLRUObHSOTFXGkp6xtgo/z
	 RNh+p0HCg7uug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3F16F3809A80;
	Thu, 14 Nov 2024 00:00:35 +0000 (UTC)
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
 <173154243377.1424393.9259845885869377518.git-patchwork-summary@kernel.org>
Date: Thu, 14 Nov 2024 00:00:33 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [RESEND,GIT,PULL] Microchip AT91 defconfig updates for v6.13
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=909381
  Lore link: https://lore.kernel.org/r/20241113182050.2176500-1-claudiu.beznea@tuxon.dev

Patch: [RESEND,GIT,PULL,v2] Microchip AT91 DT updates for v6.13
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=909383
  Lore link: https://lore.kernel.org/r/20241113182050.2176500-2-claudiu.beznea@tuxon.dev

Patch: [RESEND,GIT,PULL] Microchip AT91 SoC updates for v6.13
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=909382
  Lore link: https://lore.kernel.org/r/20241113182050.2176500-3-claudiu.beznea@tuxon.dev


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


