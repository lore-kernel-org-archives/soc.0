Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31DA134AC
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863000; cv=none; b=NTYSABhOuy/Bb5olcE+F1bA205xvjk3Sl6tbG1bunsZgqsKb0MNswooN5TrUHn4fXJuO3OnGxie/gRgO7Krgr3iAncfTMRlzszGzc3GnfqbAE3X3rxwpSq5yFMPo3bMK77oIejN8nD4pZfNNgHgUeoQpvWsCzqAj9Z81b1PeUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863000; c=relaxed/simple;
	bh=0whr+HHBq0VYgDs3LpQ20eOpBxaVvMsLHC4Ydutlwd8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=rWIEaocOHs1rlHnKUCiQbZaL65PqQF/3sp2T3V2loViR6Xwi4dh0mNkq64q1ztGeIgF0sazonnpvggFc65evQQiavGwF1hqQoB1IZOpvSTB+yArYTEYmByyla+Hi3wMbQrZbSjphSZr86ZDqua7xHMroV4s2KomZhhYR10XBBM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5kuZab3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5kuZab3"
Received: by smtp.kernel.org (Postfix)
	id 5247DC4CEEA; Wed, 21 May 2025 21:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF55C4CEE4
	for <soc@kernel.org>; Wed, 21 May 2025 21:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863000;
	bh=0whr+HHBq0VYgDs3LpQ20eOpBxaVvMsLHC4Ydutlwd8=;
	h=Subject:From:Date:To:Cc:From;
	b=T5kuZab34aqV1EM5f8U41OfvrfH1hRP+0tu42IsR3ulfUdkNHB/NXlw2KBB5ER5Sb
	 DWZs73WmziZ92pzpTB68ufshHr3LqnEsqxIjYXCZwlgsQ/L+mgBSVOnJJykVAOXuDr
	 a6/dgqg+qsHFV2uFgRsG85x5l5/2r0Tnl76BtYGxQQiPldSmLVzoriXkAg7KHgUK3D
	 MGOrp+/zoAw4l8ZQfxE3KidRunGCaTG82YHe4zsTbwc3ItQND5nU8Ib5ZJrSrEPMJK
	 O3v8kqjcXDmTvwB+mfQy9rAZSwc8j5o/73ycTi3lzhQfX/AMUSmdGLCPqbiyrd9Pft
	 0XhP/etfmDccg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F0B4D380CEEF;
	Wed, 21 May 2025 21:30:36 +0000 (UTC)
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
 <174786303540.2284637.13173905265903634129.git-patchwork-summary@kernel.org>
Date: Wed, 21 May 2025 21:30:35 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Allwinner fixes for 6.15
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963440
  Lore link: https://lore.kernel.org/r/aCaeLgjZllV7bauX@wens.tw


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


