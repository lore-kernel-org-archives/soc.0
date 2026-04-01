Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FBE339872
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080222; cv=none; b=Iryhi/TiQEK3hFRjR9cVDg8IpuBqGgujB7kkLgBBFZnVBlP5nAo2a8T4PNIbscuyONyIDlX5o+wlU8n9/YJNynKfwYaBuWODyRMILwmbpD8d08WtuGpm/EP1bWpavKh++vRYJhpZgs1PXkO+u7CWiYKzvxmGQJOkiB/SYNXylPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080222; c=relaxed/simple;
	bh=fchWgCc4tnXTJzm5lFLJiShL3zYo/Y2nhOiMDnXdhW4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=S5oUs0KZL+y6PlSepQOQFbFM1ZzlK6Ob3hgy2LMT6O96rWkX5lT2yU9ZXlb6cX/gPofdOxgbB1BGrJa2aJQtiQ1Qufj6Z5VrXqY/1e9gw130oqvnsxYLu+62QEAN+jQaYtImnQ40lZx/GOgbRXfa0lpoXgiMb1fEJsVjVIUnems=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nODVOGJm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nODVOGJm"
Received: by smtp.kernel.org (Postfix)
	id DFE79C116C6; Wed,  1 Apr 2026 21:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EFFC4CEF7
	for <soc@kernel.org>; Wed,  1 Apr 2026 21:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080221;
	bh=fchWgCc4tnXTJzm5lFLJiShL3zYo/Y2nhOiMDnXdhW4=;
	h=Subject:From:Date:To:Cc:From;
	b=nODVOGJmGsBYKPL5E5N2iOMmznayAaHUJH9xru2uuLnSxtYyAhRopWLLbGVy6iY8F
	 OVg1rbYEJjnd6wZrSYm7j4AbjTENQw41T8txX56VvLzSsCzii2PkkfJkzVQxxpqC1q
	 BIzORQGnJX/T1nKkQNJrlIRj65luBU2xqlCo+h0tBl8vDIAdIwTXamhR/y+3qhB8SW
	 2Z6l8q4MdtT7qlAM55GQ7E8CmPGjV8h/Nru5LuWbbijQJSGbIFsOjGa7f0zHSv1Jqm
	 4vaw2tY9coDm8CHwc+ocQcYxWUqzE/SgQHunslo+lhgDkrKYw2xYO2rJZQJLGImVRL
	 drR0hCE06MDLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC8523808203;
	Wed,  1 Apr 2026 21:50:05 +0000 (UTC)
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
 <177508020427.3876275.12650940529638752706.git-patchwork-summary@kernel.org>
Date: Wed, 01 Apr 2026 21:50:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] More Qualcomm Arm64 DeviceTree fixes for v7.0
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075419
  Lore link: https://lore.kernel.org/r/20260331205318.952913-1-andersson@kernel.org

Patch: [GIT,PULL] Renesas SoC fixes for v7.0 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1073950
  Lore link: https://lore.kernel.org/r/cover.1774606482.git.geert+renesas@glider.be

Patch: [GIT,PULL] Allwinner Fixes for 7.0
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074201
  Lore link: https://lore.kernel.org/r/acktHkKlWDUbsE_a@home.wens.tw


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


