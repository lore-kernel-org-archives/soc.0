Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49625195
	for <soc@lists.linux.dev>; Thu, 31 Jul 2025 00:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753920595; cv=none; b=mVMr57g8TbxY6owuOl0MUj8CSgDlBw8IRds5vBdHXPcTr/Ovbl3oZHv68FvgIVJDOsV3kvL/UxRJluBTcW+i/4VEeexA3IIFlcwW/JWGVvKRqK00/zBP9PQfOaN7EuJn5TGV73pYoVxbfIt0yZFCRGrSTjcQUE442nngfl/X4YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753920595; c=relaxed/simple;
	bh=NUEDm9RVfxXUGlIY5tc43SRK6LuDnQ1Kj0AXz6PEtnc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ph4rN7tDjTAVSMyOwoEQIFBWAqQ4tpIemF74Kkisqa1ykJadacSF0dJK4Mv35VMKBrauF7NTJudNqSM5PwSrL30XRwsW5qx/NAUvB3z7y9OVo4vebyEyKvVtI9fNrMcn4+HJiVzKGE0O87/VKco2sBWgPe6mdwHJsyqF/opdzkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laZxEdTY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laZxEdTY"
Received: by smtp.kernel.org (Postfix)
	id E2F4CC4CEF5; Thu, 31 Jul 2025 00:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA7DC4CEE3
	for <soc@kernel.org>; Thu, 31 Jul 2025 00:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753920594;
	bh=NUEDm9RVfxXUGlIY5tc43SRK6LuDnQ1Kj0AXz6PEtnc=;
	h=Subject:From:Date:To:Cc:From;
	b=laZxEdTYXtFItkHafDeeYe2hpVoY5xztofFHQSKD27UQfmXQszeupPa5plpyl2Gjy
	 B4apUzJjIjm+AWsez5vHJM/klHV/BIkDln/oCoODxNLIJH8SLMuwrIpilehI4CauyQ
	 iGaFj2MSMHMWWXSjCV4Vgbw/PY83BmI9RSmZIPHhPa4dQBC2b83uEbxrjsOUMzpo+p
	 geNu3O17V0xLxa2beAfAc5sN1DrM+g9qsv2bRbWbJ3aILcIdBA4R0Ia5z97TQ4Og/T
	 cRaG41jadAUfbTWNYsbS0mjO8UtRQhelh6S5RAG3fcdncxGWZVv69xdoJMa04ZeUjg
	 Bk6XFJkbCL8VA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADB8383BF5F;
	Thu, 31 Jul 2025 00:10:11 +0000 (UTC)
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
 <175392061059.2546419.5297699882315034917.git-patchwork-summary@kernel.org>
Date: Thu, 31 Jul 2025 00:10:10 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,1/1] Broadcom drivers changes for 6.17 part 2
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=987161
  Lore link: https://lore.kernel.org/r/20250730205754.3465896-1-florian.fainelli@broadcom.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


