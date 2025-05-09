Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C48D236A6D
	for <soc@lists.linux.dev>; Fri,  9 May 2025 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807002; cv=none; b=Oig+ruyYIzqbUfvUBg9m3br0fl4V2J7+q9gvyl8PW0DWIT1p9K1MiULGA/pG8sNQLVtoflEpTbsKrhxX+mWu2BvBHSPO2vB1HuYWysWyGudD2ZTKqXXyCz2kEjsJlaJ/JWAFNi3iR0H2JWPTn8e0/+71yK4cFWarxo4qfupxcWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807002; c=relaxed/simple;
	bh=L3SWQm4McCd6ERhEq/ZfQ0Qph3NuSLeolL+zSpCMgeo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=bKvp2igaHe/rF3TRunK8HHX8A9M5uyycHbQZfzkhayqApVYOaNRWkU5TPcfLGnd0BU7z/nLNTBx1S/+ePZxBuzfn9MEZIX2/widb8MY2D4UhebEbwaMNIbvhQWTj2qs1gZ/F1hGxO4Do8Qx/ShLp7JymlUplSJDL5ko6tpovqkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8Imz28t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8Imz28t"
Received: by smtp.kernel.org (Postfix)
	id 5F0C9C4CEEE; Fri,  9 May 2025 16:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497CAC4CEE4
	for <soc@kernel.org>; Fri,  9 May 2025 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746807002;
	bh=L3SWQm4McCd6ERhEq/ZfQ0Qph3NuSLeolL+zSpCMgeo=;
	h=Subject:From:Date:To:Cc:From;
	b=V8Imz28t5l8N/xTedm0bpUyioafG/MzzoygiueLzWYJ5rMCu/plI7+Kg9F7RxzFuw
	 V8RuiOdm/J9R/QlznQaycaCkOJxVPH/cLdDbwrfj/pzkgX/cR9orH6J4NSeiyqLH5N
	 Jw+um9IyFuUbi1qMBNzt+w4HDttoiZJlNq0OJnisIlGZm/TfgS5rsktvBsiiTr7Rgy
	 IUmVHL8FlLIO8lHC7dumwSo1KTIhTWMKsAzbcw4rc9gxiX9gYVNgkSk9s+QiLwyeLO
	 oIYN9Kcx3TwbDF+uJTMrj4inlurA61dOM09/v37XP3bB5ypclha1lXWu8/BE0NwEuQ
	 aeeqU+sOd8caQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1C7380CFFB;
	Fri,  9 May 2025 16:10:41 +0000 (UTC)
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
 <174680704050.3673480.7378591704507142506.git-patchwork-summary@kernel.org>
Date: Fri, 09 May 2025 16:10:40 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

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


