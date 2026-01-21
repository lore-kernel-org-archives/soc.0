Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0603F428821
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986009; cv=none; b=LH2ykgZdsbkSQ/yeuMsq58IGqwlqm7cIam2E3oaTOryTbqDQacEKxque5YLV6x0Dc5z/dfxIlvEvuqZiX5I7rVthhCm2NshJnqjOucF1ak721WS17qNzklMV2nWWeIFpPTkSt7TMaTN6czI5hBQFIwV+IxqRrqHYl2yrua3lOd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986009; c=relaxed/simple;
	bh=axibsIYUjYHFupiZa8fC365GnleY8s9dHWOnDba4vho=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=J1p97wpxoD3havKIWNWiVOP5Co8U7v4TJvm1KBFCSwizwp54otCsN3GLuLrvPuEVn+DCVqQ6JObSG52d9chAaNnb8KrezCMAPA/nvlA2b9EkaSaiqYiRKl/0i0AGs6hOFqJAmM0bESvCG4E75rl3cARhHkfN9HMAj/c7UX1KTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONdS2Wi6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONdS2Wi6"
Received: by smtp.kernel.org (Postfix)
	id 8221FC16AAE; Wed, 21 Jan 2026 09:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCDAC116D0
	for <soc@kernel.org>; Wed, 21 Jan 2026 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986006;
	bh=axibsIYUjYHFupiZa8fC365GnleY8s9dHWOnDba4vho=;
	h=Subject:From:Date:To:Cc:From;
	b=ONdS2Wi6bD4wt7klITTD/j2njav41wMUZXqQGKbjYeMQB7DemwKWVjFDOGcp2rWwK
	 fipjntImnqw2YnEiLrM+BnK5DqfrKzW2OIXvRMgatnX9+pVqLKvRwYDgyJKYxtZ/v5
	 d72i22eXoRDtXTZx9jvw/t3ITO9T0LfgbeE6mG3sWRzPL4xP4D5iEJpe0R6Npi1/tk
	 qcno5lE/HE4MONhscKMIm54bjnkrMvmiY3TXwHJ4FWuewRAlchTAxWiDBWdXJSNQeR
	 rzO0yqiFdwvN+J18pXl5Z6VEFYM46hvplNwat8EcZ/LpdQYYR4wxT6Ysfv+gsGz2pN
	 i30ruPqftMGvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CB1BD380820D;
	Wed, 21 Jan 2026 09:00:04 +0000 (UTC)
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
 <176898600345.793757.12171896680831219225.git-patchwork-summary@kernel.org>
Date: Wed, 21 Jan 2026 09:00:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.19
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1044235
  Lore link: https://lore.kernel.org/r/20260119155854.839183-1-andersson@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


