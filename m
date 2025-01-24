Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3B018651
	for <soc@lists.linux.dev>; Fri, 24 Jan 2025 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737725405; cv=none; b=ufpM3MQAHh/ol+gbkwM++3UeZvWYl/nuwsIkC4SUL+xppaYHhwZ4c5SpZF8c+ShLdZhB1Sls9GfY+HUNtcZErpFLE3Qj/vTIjUHjIgwObq2QcAzNAgMRDNYhjjmCHNGOtYqn2TORqpI0t99X/cVgJTgphp/G7NYsqRqtvC9nI/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737725405; c=relaxed/simple;
	bh=U8QFk/SQ8CmXw9gLP59MB5XUi64xe3FVad1T3BCNG4M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=dyzspquq05ICIVSuiafzYrm6FsJf4QeqLv53GPasjzFhnGqV6rNbn8mSKV5a+V05f9Z6/pCAQ9aFAeQcaHElfG6oUuosAIWiA39qgigC3LXQTDaXP/M2DRL0qJaWZdOu8YlHjlM9zvATbeJkGaBzUcxjSgjFXeXMlmBYSQ64HUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MD2F1YZd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MD2F1YZd"
Received: by smtp.kernel.org (Postfix)
	id 6B1A0C4CEDD; Fri, 24 Jan 2025 13:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54952C4CED2
	for <soc@kernel.org>; Fri, 24 Jan 2025 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737725405;
	bh=U8QFk/SQ8CmXw9gLP59MB5XUi64xe3FVad1T3BCNG4M=;
	h=Subject:From:Date:To:Cc:From;
	b=MD2F1YZdBZfR8J0WgHeYXYMFg16p7ROWpdSmo42xrWmudmrr1jpctt5gXB93ALp/F
	 uDHqrpU/uKD17HVCYBmAcsFQ/UWsLMVqfR/A1Khvha4odgiaHucdu0OL0TbC/QYahY
	 b8/A6pzk9pgPL6aNBJv6Pfp29dHlCBUDo2KgYK1Kc2sDeTxGCGWBZdalrWH4u+LpEH
	 8PErK2gnf1lQ927TrdYGxDXzj1L7PmT6m59nH/wgCtHbSbm7nAXPCw6gBRLiHlnTYl
	 LSBH49+gvi4fwCRaN/Kl1ku7C8M0hTHkECYRul483qHItfYyJyBiFkkve9wwrmgcwv
	 8yP/tKNRsq9YQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3F161380AA79;
	Fri, 24 Jan 2025 13:30:31 +0000 (UTC)
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
 <173772542980.2032962.1692876065294931952.git-patchwork-summary@kernel.org>
Date: Fri, 24 Jan 2025 13:30:29 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] LiteX updates for next
  Submitter: Gabriel L. Somlo <gsomlo@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=926769
  Lore link: https://lore.kernel.org/r/Z41PgCffqPUTyxkE@errol.ini.cmu.edu

Patch: [GIT,PULL] Broadcom defconfig-arm64 changes for 6.14
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=927938
  Lore link: https://lore.kernel.org/r/20250123203302.1491843-1-florian.fainelli@broadcom.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


