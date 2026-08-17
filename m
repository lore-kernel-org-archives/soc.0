Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C07839733E
	for <soc@lists.linux.dev>; Mon, 17 Aug 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975253; cv=none; b=TFrcAaggDBnP1qus/BS2diFw/oTXivJ6ngYhzttr9GLJYQy5dIhfWboV6vm+UPuKNfilVm+/aK4ubhoQPC2QZTmZByfFkKSlOE/MVskl2Ua58kkHNkYpVnJHqcpmrZvZVpNc1adrgI7OIR9fQC6XxfKlFs59FL96OFzhexILEk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975253; c=relaxed/simple;
	bh=j7LDkGXFDDWedKzOmAFqo8pNldMs8UDpBSmonCfYoDE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=NeB4FPX1yL72etli14Km7E+GNfDSxDIL6B/Zs+dSFwZ1qjO3443Qb2O8VxSPw/0oxwWgUz/o+rdcld37JJS4vzNDY9iJqq76KY4o8icaOtOi3xIS5G1epg7ZWEvwYvSaSrFSx0q3HNxmdRlUIXSUC1o4a64GZHGbmN3izuVJMiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKXBzcCd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKXBzcCd"
Received: by smtp.kernel.org (Postfix)
	id 24FCF1F00A3A; Mon, 17 Aug 2026 14:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2811F000E9
	for <soc@kernel.org>; Mon, 17 Aug 2026 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786975252;
	bh=9A84UMNgJN2I69360GkjObwGbeYilq1DVPq8z3yOqlk=;
	h=Subject:From:Date:To:Cc;
	b=FKXBzcCdpNdEmmEENOG85pAtrMBYF0mwHq9uzGJak4vjf3LOArTGVSWYB0wmyzf1S
	 wH4mt9AayJWmp+Psfh5aGvAKlWun7Vx2jQoFfKL4O2rjAgCR49FvR4Qq8MUiJhGkc/
	 Hs/4gvecpnalGB6cVqp6MSOC3yZfrBXble8C+R599h09C/WDdyunIb+QL2tEH437zw
	 ya+ATh7iTGawUAStb0xUT+Cdzosc6PhyrUd1YTvT1qP2e4lw3/WIwwRrJvPbFtNOAx
	 RcTeaStYPfxgG9MNfX9lrnO21ax0pxFFabKsBd5M0375w4A5WJluSVQeioQ64qpCe0
	 UqO8jv2M7KqgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AF439253F1;
	Mon, 17 Aug 2026 14:00:05 +0000 (UTC)
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
 <178697520419.1152135.16622399835998209431.git-patchwork-summary@kernel.org>
Date: Mon, 17 Aug 2026 14:00:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: mvebu: dt64 for v7.3 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1146428
  Lore link: https://lore.kernel.org/r/87lda7oku3.fsf@BLaptop.bootlin.com

Patch: [GIT,PULL] ARM: mvebu: dt for v7.3 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1146431
  Lore link: https://lore.kernel.org/r/87ik5bokdk.fsf@BLaptop.bootlin.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


