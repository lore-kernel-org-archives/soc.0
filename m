Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057D77262D
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 06:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858633; cv=none; b=cgilSTvJ1Vu2CCbLdAYx45/FdvgGGYTBU8brXDQSi5uhxsPy4FyaZjjU/67Eb38Orh8U2AR+h2/Lc2QXl76yodaYp3drFBbq63aY7sGLesdMHrKnG6ENsd61GtHRg15kyc6S0Qxjk/Aec2CN23YUFZXukGrFkKC9FLtvLgyS4l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858633; c=relaxed/simple;
	bh=wA0AzLqvw2ErtK0ifOln8ACj7JpchhYzRjH5RDHXzLY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Y8RlJBimoaZlIReghGCzYEGSr64ob9iOn2ru0HvOspaSdbbkcX9/xqsnrtljYF0TFK7/UQpjPvWO3cy6cp6wfaK5L+XU0em1DZGRPSWnTsZJMwKdaCHEZ/8L1sobHAOC6IHw3emRy6vmAYu7UgOZzSbNMVRGE70CQq0ST/MZjps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iA7JZrBj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iA7JZrBj"
Received: by smtp.kernel.org (Postfix)
	id A2420C4CEF5; Wed, 30 Jul 2025 06:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884A6C4CEE7
	for <soc@kernel.org>; Wed, 30 Jul 2025 06:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753858632;
	bh=wA0AzLqvw2ErtK0ifOln8ACj7JpchhYzRjH5RDHXzLY=;
	h=Subject:From:Date:To:Cc:From;
	b=iA7JZrBjHZXTqwZIzjfr87u4FazpLft+ZikgBg9/5pO19VQtwxUMcfUGN8R6WnHAr
	 EudATKhURZk0ivj+PqFn2QlDrsxBhHrRr47I/3HFuYB9ZJlSDkUihEAsx6l6t2ODD5
	 PFArl//p6jBbxWxqIhsyGq1AafFzAw1XPd50QmWqRmP3FLUAvyPLQL8ztDBNG7l0fD
	 rZ9XmMCwZkc4CpOj/plLXmlBGswBbNGO/G8rUaqm7j1OpvTHsw0UkaosrLb5Sk/Ak8
	 OyEgSrTN39wNKWUX22ttMa+KnYCOq4wZwwJDgvH89cmF0KlzpNam+qkI+oq+7MC+FQ
	 dSV/hDKbaH00Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B15F3383BF5F;
	Wed, 30 Jul 2025 06:57:29 +0000 (UTC)
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
 <175385864828.1808741.3434747779658717977.git-patchwork-summary@kernel.org>
Date: Wed, 30 Jul 2025 06:57:28 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.17
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=984995
  Lore link: https://lore.kernel.org/r/MAUPR01MB1107297124C9DA0CD77DA3DC1FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM

Patch: [GIT,PULL,1/1] Broadcom devicetree fixes for 6.16
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=986854
  Lore link: https://lore.kernel.org/r/20250729205711.3393417-1-florian.fainelli@broadcom.com

Patch: [GIT,PULL] Qualcomm driver updates for v6.17
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982284
  Lore link: https://lore.kernel.org/r/20250715021454.14516-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.17
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982288
  Lore link: https://lore.kernel.org/r/20250715021838.14751-1-andersson@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


