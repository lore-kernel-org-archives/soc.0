Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20AB3702EE
	for <soc@lists.linux.dev>; Tue, 18 Nov 2025 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763502641; cv=none; b=J8HXxDVPE4jyucLISrcdPXOwq2IpxBVESvsTbQ2u5f2tS7vw70mnEF2/l7KPEOYd+IsKeCAb3hYkQKNzdfzAEYJHivifdqQzXZIrBhRQgNk/p7UmAOVZkL4iEbBbZ3jM7IHSEfqUsJUYLibo8coj32PrBpYyAhfkGoNl0fhNSRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763502641; c=relaxed/simple;
	bh=o541+7TIBwzOHZm3yfbQuaPOMJM5zjc0/94xdnvlItw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=har/c6AifZ1UvFwHVM6wvTkPHvqxxIdYximaVf3cSShfIeEixkrLOV+l1mOmeLkvstLTZiNVha4gjL57G/wYDJfFk6+dQ/Qb9TRsFWlkfTC1yXqYNaVcpWYpBU9pmCdQGtlM0ZXSQ+FSy3k1eCZ/yhifTIxgRo7Zj3SInNNxTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObDCIbft; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObDCIbft"
Received: by smtp.kernel.org (Postfix)
	id 06CA4C4CEFB; Tue, 18 Nov 2025 21:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC396C16AAE
	for <soc@kernel.org>; Tue, 18 Nov 2025 21:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763502640;
	bh=o541+7TIBwzOHZm3yfbQuaPOMJM5zjc0/94xdnvlItw=;
	h=Subject:From:Date:To:Cc:From;
	b=ObDCIbft2quoTNmtZIUL+aQMbhgXopzgkYHBCK1kHNCi8CHr04E+VzgAb5KadFLwq
	 LHDp/kWAT98LVb9uY252wOa0gIfJwKpMIljsqjeAMMdbJcEAEGSVCkNJrT7X1/Cnnv
	 I7TeAkT5kuyvMn45Ju4jf03qQPeZ0C8Gma8H8nGgymIE7AOyGlMtnZsdgtXol42txx
	 yk8oUVYHvYm+k4pCvgYwwaKhYF9Y2RZ/Kg/WMtiJNPKqxBOgMc5Ky9jTkw6ddIfmYC
	 VgbyhWmyB2xU71s2RRUp5JlTWxejo7R7i2isyhpA92xqbkEsDLD8McljMFd4VabM7u
	 FvX9NuIjeX71A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37F0C380A948;
	Tue, 18 Nov 2025 21:50:07 +0000 (UTC)
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
 <176350260574.116847.13718548636126396817.git-patchwork-summary@kernel.org>
Date: Tue, 18 Nov 2025 21:50:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 6.18 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024547
  Lore link: https://lore.kernel.org/r/1901272.VLH7GnMWUR@phil

Patch: MAINTAINERS: sync omap devicetree maintainers with omap platform
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1025009
  Lore link: https://lore.kernel.org/r/20251118192652.316198-1-khilman@baylibre.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


