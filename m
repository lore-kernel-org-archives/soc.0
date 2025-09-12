Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B255322A4D5
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693405; cv=none; b=kNcTej/tgMpfFEYqIoKfSzRg7J7ZyN7rODQUM7qD6OCDjHngWvZNjHJIRNWx2JOGCbqwXxk9OWl+Qk4rzdTdeeHwnSAL0y0Qwnj7MAWZtpsTmQKP4PndS3ALvCaeTHgHUFbBosI6wW0sYRMQ4Fxm3mze7D64Vw0rvbTbIG3eluk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693405; c=relaxed/simple;
	bh=sL4T4zqBFWj0bjjG+jjQKJeYtP1gb28aeZR3zaq7WQ8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=DsJyDlXD3v9YxCKIUgJRBDmEie+Wb3MV72gNuf2eXdYH8NIMFWouQEDdzQ5X++irMSWKARYtz5zeJtAas56UJQT1IKQBuuWEw7C0EX5smmB3EVrI6Ah+VaAT/28XihDoAQZwunzXIP34yk5snUy+qLjNoCba+2A9+wjWyd/F5Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQrv96Sa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQrv96Sa"
Received: by smtp.kernel.org (Postfix)
	id 59AE2C4CEF4; Fri, 12 Sep 2025 16:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE74C4CEF1
	for <soc@kernel.org>; Fri, 12 Sep 2025 16:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693404;
	bh=sL4T4zqBFWj0bjjG+jjQKJeYtP1gb28aeZR3zaq7WQ8=;
	h=Subject:From:Date:To:Cc:From;
	b=GQrv96SaZSiAoUXk9Ua6sgfa8INrllCSXb9Teu5nPDjNn1BYxUPobudl3lcvDWufm
	 E6VlPf7zvUgEkTtiZcwvSJXetGueJ1C1GzRUjXedI7NFnSnKzRFBeq1C2fETeJ+lfg
	 nsFCFb1uPo2JcJsfntIfjGf24DBqoR3pfEhqnj5BZ87v3qKACvmLzevlbl6m7kuPfe
	 v2npZXDCdX5gu+fwfTwPj79nypBfP5Z3Az54SQiKhVhznxsHgs/v36ZHlGeRS/I+7t
	 twmwPGPxV4+RQ2JoUFP7pWyJ5hlkwlMeT8VrKaTuX5ddH0N9x2WHMEWpc8I1sTjQkc
	 M6Y6/BIM2Wd2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B2EDF383BF4E;
	Fri, 12 Sep 2025 16:10:07 +0000 (UTC)
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
 <175769340614.2998972.4496517845983755169.git-patchwork-summary@kernel.org>
Date: Fri, 12 Sep 2025 16:10:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] ARM: at91: fixes for 6.17
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=998524
  Lore link: https://lore.kernel.org/r/20250903173403.113604-1-nicolas.ferre@microchip.com

Patch: [GIT,PULL] Reset controller fixes for v6.17
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=998936
  Lore link: https://lore.kernel.org/r/20250904153345.2374313-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] arm: dts: socfpga: fix for v6.17
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=999747
  Lore link: https://lore.kernel.org/r/20250907123058.175447-1-dinguyen@kernel.org

Patch: [GIT,PULL] i.MX fixes for 6.17, round 2
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001836
  Lore link: https://lore.kernel.org/r/aMQs2zr4fYl2DYVr@dragon

Patch: [GIT,PULL] ARM: mvebu: fixes for v6.17 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001862
  Lore link: https://lore.kernel.org/r/87ikhnn1pl.fsf@BLaptop.bootlin.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


