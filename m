Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90D23F4DD7
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345806; cv=none; b=WV/MsaD2bPLgfgWe7FQUEnt2kOkTd67s0i7YUKVZdtLMkBSBTRgL30nKtj4/DWpfWQm/LUWG6c3YHBdwr/PSZHpvDuefigEx+/7WT8dVWSU3dLYyu7u2aZOa8vrXtvDltUy7nJ1tUXIhOJCJArPgTGH/meGL5kL7z2YhTYGk+gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345806; c=relaxed/simple;
	bh=3qzTOKCS0H/ElZVkDzVSNDEL+i4XrVwkRBfvhbyq1KU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=UQkS+P66X2TdIOkAiq7IpKxGyoj1I+A1ze1W7ZYuyPTE2IJqqWafgk40lMMGAFEkiwgSivrC1Nsis3utIdR8AosMfNu4ZEsquoLmE86tlc9BPVWM7jv98TFNQa/sontedAwlQikG6aDw1fOpcETFaTUWSufGtPS7aAhwLmNgXAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7VBpJoL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7VBpJoL"
Received: by smtp.kernel.org (Postfix)
	id 96CE01F00899; Mon,  1 Jun 2026 20:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F4E1F00898
	for <soc@kernel.org>; Mon,  1 Jun 2026 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780345805;
	bh=++m33a3ZYVvgokMvcVc0qqTEf0VoZBy81yCrBgVxNYk=;
	h=Subject:From:Date:To:Cc;
	b=B7VBpJoLPnAzsdEeyea3DD/e4gj+lXFO7iRjk6xQ/CLrbYeb0x2KFyDNxMCD1+c1A
	 bDI+b0hsouJpRfV/65SxVQ+HPuOsZ4asFF/wJPh6StAYHuNqCVHf1uBivneaFbhJ8V
	 HPj6mrqCwpCTAF6mJox7F7VnUPYZd32DSR84kNZXCP9O8UzdrS+7+sUJJpFxhaj4Df
	 se/6W4Sj7vbAzgT4gmm3UkepLZxWvO7FIN1ape3/8hkILZ/YBN3llofopyfl4yRfAF
	 r/2MQQ4rWGamD2yVJ0JSN+8p+8ClOQIsilAciImPA9sVOqiv+zZu8lFfuc0EGZZspa
	 uWwLDAH4OwJLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 196E538119F4;
	Mon,  1 Jun 2026 20:30:09 +0000 (UTC)
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
 <178034580752.84967.4461959124029502722.git-patchwork-summary@kernel.org>
Date: Mon, 01 Jun 2026 20:30:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] CIX dts changes for v7.2-rc1
  Submitter: Peter Chen <peter.chen@cixtech.com>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1099120
  Lore link: https://lore.kernel.org/r/ag/Lo+ss9sSnBSLU@nchen-desktop


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


