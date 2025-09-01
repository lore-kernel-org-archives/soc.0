Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933A30F800
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720699; cv=none; b=dYk9eFNP3JIAQmJ9wUS+Uq1geBGIyda4X9R5C1gIMLfY6jCh96TjDo1XNDDe2ZWTFBMEX6jhdR9J5PbNZzIy6b8G/676SR68elXCJYqwsBAC+gIe0LcvL+5bmhd5g8lPhYOZBeU3HlsdXph8i84FTrn7cbsUkVVMw/GoedY1ILQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720699; c=relaxed/simple;
	bh=4iSUkAOKCAQOHHKoGfLY+Kjiom9caYSpqsxm67RtTYo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=N+R5vWaNYSnL/9rREK7JR6/RznVlQ2iUSqmpMkjjk8RjRR8NOvpYlf9YY6T6OS3HUFIU5WVF58qfHrj+rJ7WMLVfWswPXvxPDHhmjQ5sPC0rmQcPuC5ZVpECBQC6I/Qer6zEO9Xv02Dp7wB0IKqtVfdHb7Xi6JhjGQKkrZAGL3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5zoqUuA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5zoqUuA"
Received: by smtp.kernel.org (Postfix)
	id A6A17C4CEF7; Mon,  1 Sep 2025 09:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9187EC4CEF0
	for <soc@kernel.org>; Mon,  1 Sep 2025 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756720698;
	bh=4iSUkAOKCAQOHHKoGfLY+Kjiom9caYSpqsxm67RtTYo=;
	h=Subject:From:Date:To:Cc:From;
	b=H5zoqUuAb4TWZIU2y469RrOMN0anBtBsKcYS1uFQlotsW1kOS/CUmN11bxC7MP5Hj
	 9zJ7zOiB+IQdvzBI2SOKlvR2FikJC9LdDAG8LfSoWVblKlYd57p1w8RBT49M93a9v+
	 EAEzvfLfCJ+rJNcfWbXphLvjkArzJFDyYeb6NOz0xzGW1+VuY9ZNMkZlDME8y7bcFP
	 ZBoyn4/TyGnS/UhCSmcn4KseIe1a2Q693ghrEghbj9OgV7PoYD/HQPduv/1D5NkBLJ
	 gIiZaejRR0+hJYX9xVnjpH8pTSBvPPxaOUULLaDpvP5u+uME1IGcCWd6pL7sGlbDpF
	 PFFUvJ54+pacA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE079383BF4E;
	Mon,  1 Sep 2025 09:58:25 +0000 (UTC)
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
 <175672070429.3637164.4071748192966283737.git-patchwork-summary@kernel.org>
Date: Mon, 01 Sep 2025 09:58:24 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm driver fixes for v6.17-rc1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=990087
  Lore link: https://lore.kernel.org/r/20250811145613.120917-1-andersson@kernel.org

Patch: [v3] arm64: dts: axiado: Add missing UART aliases
  Submitter: Harshit Shah <hshah@axiado.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=996628
  Lore link: https://lore.kernel.org/r/20250828-axiado-ax3000-missing-serial-alias-v3-1-393111f4bd9e@axiado.com

Patch: [v2] MAINTAINERS: Update Nobuhiro Iwamatsu's email address
  Submitter: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=995007
  Lore link: https://lore.kernel.org/r/1756087556-25424-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


