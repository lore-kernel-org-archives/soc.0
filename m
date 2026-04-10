Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9A1346769
	for <soc@lists.linux.dev>; Fri, 10 Apr 2026 22:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859630; cv=none; b=UQUp33NTuJy8Sd7S1GOIjmOgOLsjZEuMNWsUUY+cko4ReOEkRTNwekeBJlUO85lQqRrlGBB9M7reqsMCtsvFf0JjkD8lw/DTxz/JhI/5uM36OMr1xs5WaKNjTfpSnhW5fg0HgqxcPcSYMnRpHLMykPm5+MjNiLQ6pZ4ElbTYF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859630; c=relaxed/simple;
	bh=y1qMrzD5iJnwVU/+Ilt3GL17kHaVVf6x4/eJaMHjwfA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=BymuRTuej4AUHWX6QukqsOvNmacx5vfDIO2EatKSum+7FFEcbv+EX4AiQHqD7lfhD1Z/aoIplearpHLuH8yA1HOyDkNHGACIKROB4IyRb7m6w1DXak5LcIONhrBf0AE1SEZFxiND8woANDJg5Wdsalqz4lo3aiu5Ums/tPQcUiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kc3bQF9V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kc3bQF9V"
Received: by smtp.kernel.org (Postfix)
	id 5C3B9C2BC87; Fri, 10 Apr 2026 22:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D8CC19421
	for <soc@kernel.org>; Fri, 10 Apr 2026 22:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775859630;
	bh=y1qMrzD5iJnwVU/+Ilt3GL17kHaVVf6x4/eJaMHjwfA=;
	h=Subject:From:Date:To:Cc:From;
	b=kc3bQF9ViXL9hsCw1qRkl9c35LRz7QFr9rxfR1VziAQfx99UYIFuN42cF8czd34kT
	 fKmqP5b/rFaSIA6Rd37czuLIEAQZm/3DZKr4Thwt4JCVr0x3wlLwE1c3AaRl3uNy6y
	 KNt3na3HEQ8mMgY4cZ5TFvyLzvVSha498bUUg33nb8w1Y7PsQlGg85zelQjA7d4TXI
	 ku/IMfhaMqua47Q4Lc7TCJCusUDSelUWgJKxjWg7GrUM6l2BAzte0FfdzEej0YLri7
	 6d/W64l7CiFtFpV2hW0ApF+E9aHhpdc36a4kqf0IN5AQ2t9M/ENhl5LrK09QI+e9vs
	 2NbtSIKyffn+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC72F3809A88;
	Fri, 10 Apr 2026 22:20:05 +0000 (UTC)
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
 <177585960435.2663266.1657766507518920160.git-patchwork-summary@kernel.org>
Date: Fri, 10 Apr 2026 22:20:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V SpacemiT Devicetrees for v7.1
  Submitter: Yixun Lan <dlan@kernel.org>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1076981
  Lore link: https://lore.kernel.org/r/20260403123040-KYC0145825@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


