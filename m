Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A41AA7AA
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473320; cv=none; b=igrj0+OY3ydd71fk/dcO/D7bHfanu+Lue/tk3XYmNHIuueK2hbMOJ79L7mupCRMEGNEBHTu0tvFPsxIRhzo9G1Ncs05duohpB10B9leIokEOOCGFWBbJUY02E2F3gSnVi6G+UHRNGkJG8WuCADRbeCWxMu6nyYuDF5GZk28l2Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473320; c=relaxed/simple;
	bh=7evrfKKnIgTNaEXNhlaKzq0G56ydyoLVcvMf2fMp02k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=jr6S6Pr73qTS6Pc2z2GWMWZAcG2YqmHPQ5x7EcbFi1WzIDwRfqpmDvgTXMkXgRmGPJQoluxTe5ImEAtDjAWL3XgQpOwwRP79FOtkcIXuFn+YWPr9ONJlPrzR50efBoKP98WBa0XQ8Era7zgVWILd/q4MofqOWNhpLuYggwEQRb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ehd8/tVp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ehd8/tVp"
Received: by smtp.kernel.org (Postfix)
	id A56B3C4CED7; Fri,  1 Nov 2024 15:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F959C4CED3
	for <soc@kernel.org>; Fri,  1 Nov 2024 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730473318;
	bh=7evrfKKnIgTNaEXNhlaKzq0G56ydyoLVcvMf2fMp02k=;
	h=Subject:From:Date:To:Cc:From;
	b=Ehd8/tVpAQnN9oHsYThH5NtBMezEM6KKyjAj4FMRu9lN6a5Iwx/jPj+eoIF9Jvbm7
	 MbhrcuXhUrdbF6O9tIE+PBKqUnTYDnavhPBksYog6SKOGNv/yDtMh7ucs4HEtjdHaS
	 CpE2gjAupFUWrTD8sMBPCuHHVgfyR5VMIzKJAemtolqOikJ8ZYwD31qXI/og2+xT0+
	 X62ovYZDsJdNhJ3GL7YTXPJWMeXVEB9CSItNFu81Cg+ieKwuv7go8fJ2wlMIcdbGtK
	 pikpKmahGcChBwy8UAusSX3H/fh2vDPi8OFCo8mz8MCH66Vrq+uoV4fCoAnoh5GH9+
	 wr9Gb6Q6GjoVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B376E3AA7F35;
	Fri,  1 Nov 2024 15:02:07 +0000 (UTC)
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
 <173047332628.2666840.13155596571708168235.git-patchwork-summary@kernel.org>
Date: Fri, 01 Nov 2024 15:02:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] RISC-V soc fixes for v6.12-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905013
  Lore link: https://lore.kernel.org/r/20241031-colossal-cassette-617817c9bec3@spud

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.12-rc1
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=903351
  Lore link: https://lore.kernel.org/r/MA0P287MB2822A17623C51A558DB948FCFE482@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


