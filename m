Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F042C3FF8A2
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405054; cv=none; b=OFaL/lo822mCuc+cP00nOhIkEwHdtxCqKTJUCcFTYehlIhh3CizC16Gm4xMg7yzT7wOeeh3fCUBP1zSN6X7gv7QzGbTZFTGmTogYTQmWUJwdGhNC7t80Lqmnm70I20huZc94JoIvpk4RQcruNvAU8Jqr30jfLjmHHSjMp98BLJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405054; c=relaxed/simple;
	bh=cmWf150QtHiyr64DmMEhyYFMSunLscOWTNUXKLlsElQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=RwW/Cf7koRiXchbIQr1ZK8LoPo4G8JaoOitbHw1gvlRScJB6yMBeHLzsJsoXduZvVlO1XS2fk/Jen40Flv96QS1yUJXWQx0x434RB3ZewtfJjbL1Yk297B6K5b1W5bGywtoK7WCG6n5rXR9oCFxcga5yV01LLb0WgkT2I5rWips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7vdtrz2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7vdtrz2"
Received: by smtp.kernel.org (Postfix)
	id 939E61F00A3F; Thu, 30 Jul 2026 09:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA2F1F00A3E
	for <soc@kernel.org>; Thu, 30 Jul 2026 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405052;
	bh=6ZHXzZmL/xITZAOvbkmlqk6xzz0UnhSlakTxAd+kfGc=;
	h=Subject:From:Date:To:Cc;
	b=Q7vdtrz2J78IVaDT3lC6lWF8fuHmCkVQ+fyhMa7somrmMkLMaS56Pnwf2XmVEFU4x
	 vfbCmGgC290HCIYGCDF9AvUsbwFAfrFb8jK+un86j44kZoXTHAXP4VMr8Sef9bq0An
	 Zi5WjXNTCeywXeOtDgk7mZPVQkFfJsqdXQg638P1QkQdmLudz/kku69j5X6ZOPkENa
	 Mila5Em5A762stJmhUIzvPQ/JbQGPhVaji+TYXQdDCbB1ChmFcINJLmdoFF1PyrCTW
	 Xn+qb/Rql/6Fu0LRDC2Cq5PFBruGcmaIXuqzGkvG9wrEN3qYk2DdZSdq95246+fgzO
	 qxsCdBcAndrCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 594E9381195C;
	Thu, 30 Jul 2026 09:50:17 +0000 (UTC)
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
 <178540501602.3469699.7687060954474659553.git-patchwork-summary@kernel.org>
Date: Thu, 30 Jul 2026 09:50:16 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for 7.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1137034
  Lore link: https://lore.kernel.org/r/20260730020642.68595-1-andersson@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


