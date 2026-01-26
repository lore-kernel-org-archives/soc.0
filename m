Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95A324A07C
	for <soc@lists.linux.dev>; Mon, 26 Jan 2026 21:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464224; cv=none; b=Dleh/xqphKNDqy+OraGIPqjnVGW6Bp1e3+5bJE2W0TyiUfGVVKCk5cncTijOANFE8QgD9QKJSUWTS2wcEQA3vSa4FkmHYRVqseVnV1TgdqKxyYG8cscrT9faEQptvsGWRmk3KqbnpEo3JDHLTqz5EePXxxKnE0vycmh53prr0Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464224; c=relaxed/simple;
	bh=itYV7ASCIw+X4smm/QSalIorujXXvSKIilRtl3T89D4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=TBWBAxUlpvuI4ZmfGLEsJSiuOAeIhtcZ/C/4BahebcDEzGdGF+wqiHnd+NrlSwsQuSxmTv8Li0l/DIc+APKD0/dTyZzv0hkxkl/Z/+g2uF9irUfaxJaMgyPcbeNrHdDGrFtsFHuF2lKOFeOH+oLCVnIJWSOHzuw7N27/jX62P+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KatDJV0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KatDJV0s"
Received: by smtp.kernel.org (Postfix)
	id 55DC9C19422; Mon, 26 Jan 2026 21:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35182C116C6
	for <soc@kernel.org>; Mon, 26 Jan 2026 21:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769464224;
	bh=itYV7ASCIw+X4smm/QSalIorujXXvSKIilRtl3T89D4=;
	h=Subject:From:Date:To:Cc:From;
	b=KatDJV0sHHTlyoFFa2I9y2Yw7JNpZSIzHuj5Xb8gVYn/OfSg2mmsWBjyafXfLq0oI
	 bDqJRI/8VOJPZ9YecmTR8GSjHNViwiFMsx4qSXX3cit+tppV7TmGNL3YuAl56drck2
	 7LZv2gttmJ4qvoHexpPB9uma9YwWLUlo0Em5fQUfrTNnDCtW1ovDFsPCeEQmqwnoXV
	 DIX/f5eKmZ+b6e5/JpsHn+k+ocN7h2W+hBzSztXVIYOm1topful7Qox+xehUzrlZho
	 EJm89n5M83xvMCawsg6lHykug/0OmVlMaXs1WOpvh2W/WK3pkCBtBfi4xNkSu7JwkN
	 YhTSlnvQbQFkQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8EA67380A958;
	Mon, 26 Jan 2026 21:50:19 +0000 (UTC)
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
 <176946421807.190855.8157308212115402907.git-patchwork-summary@kernel.org>
Date: Mon, 26 Jan 2026 21:50:18 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: dts: samsung: Drop s3c6400.dtsi
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043692
  Lore link: https://lore.kernel.org/r/20260117182257.14799-2-krzk@kernel.org

Series: [GIT,PULL,1/2] arm64: dts: cleanup for v6.20/v7.0
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043691
  Lore link: https://lore.kernel.org/r/20260117182117.14483-3-krzk@kernel.org
    Patches: [GIT,PULL,1/2] arm64: dts: cleanup for v6.20/v7.0
             [2/2] ARM: dts: nuvoton: Minor whitespace cleanup


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


