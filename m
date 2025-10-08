Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2642F6183
	for <soc@lists.linux.dev>; Wed,  8 Oct 2025 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921068; cv=none; b=ZPNdaYzyoyJZKhiG7IA16eNlz8UWxxMvK68u2TnHkOVzbpXaHqYXjcqxN/IoyCzK/EMZaOO7efsnqF1N9y9pzGMsCiyAGEqBKWRfvSxhoXlfxHLK8CO3rQ8wfkNs7ndH1cQXd23Gmx0vwhfGxH/eG7689fizeeUI8/pyhvQRM5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921068; c=relaxed/simple;
	bh=Xy0t8oueQV6SiJsqlzpZGkFTW/b0+wu9y98qSpfjCko=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=n9v6/h37MKdYs1Sw5lWnM6bAag6KUqTlvXehWnZ58hzDlovfdrTryoyqHJHkoT1zPuWVe8JTZqeirxeE5FLsV8gw6mEUnkpKZPNLrt0ae94+DSbPd7ITziYmXs3M48+rM+5Zq0GZZ/2W1VTuOQyWl/Knt0VzKZuODSe9vq+vGFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MD98OEjw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MD98OEjw"
Received: by smtp.kernel.org (Postfix)
	id 6DB50C4CEFF; Wed,  8 Oct 2025 10:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FDEC4CEF4
	for <soc@kernel.org>; Wed,  8 Oct 2025 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759921068;
	bh=Xy0t8oueQV6SiJsqlzpZGkFTW/b0+wu9y98qSpfjCko=;
	h=Subject:From:Date:To:Cc:From;
	b=MD98OEjwxO8lZIiCa7zCIot07b0r8wAxcgXw0mycY/+X8HFJQacJ1VXynq2VZ7jNE
	 9XprL0AAf+7WPFx6fGna959YCQsWzymJMdYuP430jx9sYacJYixJhikLy+Xv5pfSFw
	 4VeirlS4XEiYcR/fBLM24cfeZIwDpaWloOepRzTqcDopDD5axJKbklRCxQWrK8oc8e
	 vdZB7T/XWKQru82Bv7qsyQdpXTTk4nhsVaRewCoznFwiqcmsLI7EiHmkCrE1bII4CQ
	 UNsKhzwiVTD4iGGKD9mr6XAAvplKklFTUqCvVtrf1QtTx7/hvz3BJGTLslalNKIUJA
	 Dzt7RvNWZ8PcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37D7E3A40FEE;
	Wed,  8 Oct 2025 10:57:38 +0000 (UTC)
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
 <175992105664.3011254.4246565241705063272.git-patchwork-summary@kernel.org>
Date: Wed, 08 Oct 2025 10:57:36 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] TEE QTEE fixes for v6.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1008254
  Lore link: https://lore.kernel.org/r/20251003123249.GA1063437@rayden

Patch: ARM: versatile: clock: convert from round_rate() to determine_rate()
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1007568
  Lore link: https://lore.kernel.org/r/20251001061100.372737-1-linus.walleij@linaro.org

Patch: ARM: configs: u8500: Set NFC_SHDLC as built-in
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1007425
  Lore link: https://lore.kernel.org/r/20250930122709.28987-1-linus.walleij@linaro.org

Patch: [GIT,PULL] arm64: ZynqMP SOC changes for v6.18
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001740
  Lore link: https://lore.kernel.org/r/CAHTX3d+aQHxzkGSseB5e7m8fr5YTKQL4CMoFZF_yXgR_CdATLQ@mail.gmail.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


