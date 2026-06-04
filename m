Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A1A1DF73C
	for <soc@lists.linux.dev>; Thu,  4 Jun 2026 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563003; cv=none; b=HRTUIBN3aCydUXvtZHu8g9UPVUnYTaK6oa4m37JIflUchE3DlhgqRu8IadqYbZplpE2Shx4cxty+j25GgI0noQRfu9h/3JQWv4TL2kLR60x0/h416plKKEGWTXACN4YZH1zdBP2WSVV2ItBsEUJwsC/s7tZ+o8QY2yoPu2Bv5o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563003; c=relaxed/simple;
	bh=2xC5y/pgr3qvjhK1L76Ms3/jhpweV06Kyjs1SKqYlXs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=p9KQvzzoHb1pNqAqdAd4sp/jFRjCcYebiVhZqniWllsX+Y3cXpikxvP5hNOct7xaC+cAyoe+NFR7KegxSWSxkReZTM/ldT/hgRLNcTuCMajrk8GJFjAgBMmhshAwwVi2NtszDY7/vlLCuKP5krWWSXhtl5KrjnAqH97wMaVbrME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvNvtMcM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvNvtMcM"
Received: by smtp.kernel.org (Postfix)
	id 7C8761F00898; Thu,  4 Jun 2026 08:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D221F00893
	for <soc@kernel.org>; Thu,  4 Jun 2026 08:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780563002;
	bh=QbFlcIClEqEkVTaI1GdvgDNtzjzkKNdTp3RxNGD7OCc=;
	h=Subject:From:Date:To:Cc;
	b=BvNvtMcMtJbCtybflBLW+AF8jKfGQZDRgyetn/4GPltzK1ZpyufxAqjQ+Jx8RFm1o
	 XQhprBvfzDNOyM1sEte07YAGTKjgN45d/vhfKguNIHwD6WyH1kgvLQHXbgbOIq3A2v
	 NHx0X8Y8HXm3pXJ8wK7mqDeu+xcQhcMif/vjhd0eeMI4yhuSPdzfRf1UakocDQe1iS
	 3lA23kQWvHTC64wnaChGExOT1wNLHA9cCcz7D9urrBOHzhuNN9chkIkbcImIsEZT8c
	 B57o/ziSu+9zC3yyHFLmpU5HFL2y5gokrISGu2FW/eTaj2j5OR3ufZUcY0905IKFeJ
	 zoHSlEOSDtA6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 960CB39308F9;
	Thu,  4 Jun 2026 08:50:04 +0000 (UTC)
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
 <178056300344.2319217.6531822452370435108.git-patchwork-summary@kernel.org>
Date: Thu, 04 Jun 2026 08:50:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: AMD/Xilinx SOC changes for v7.2 v2
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1104661
  Lore link: https://lore.kernel.org/r/CAHTX3dKJBTQ9TF2TeTTjsWBo9bkV=39b5YjTG7j+tqct0Q-E5w@mail.gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


