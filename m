Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6672C221F1C
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761842; cv=none; b=a8/Cv05/dnOgMc/C1UaaWzVgdYTo8w7IJ0Dw2ZYZcAYaH1wlWWGldPcfiP881mAuZf4s3BuPT/Nd9iyt/xhDX00kwfY8hCD7IYPqAMNkrA/VjbVgNiwl4sQUnFHKDvKjJ6CQDclKTZc5YfstVmRaWk7wnqH1ih4jkDOH8ykZqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761842; c=relaxed/simple;
	bh=2rHW4dVXxmlCCmLJze23+a7QjM+P6SJZ+FpIjN55Ic8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Vti/XQaB6TYmuu6T240g32bJb7o9nL7pMFiLmouv0s5XwWx5Eb2XiHurKR8mAJW12XQ2WRWZN0+TxDL6a17IFA6+dfphLaZ9kV5ogKPxQOKtAZ+n1yEz94SikWRR60NtCqWLMKVBDX+RkWlK/4Jq7Dg8J1ITFMsTOMP69J+pCmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmNjijwa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmNjijwa"
Received: by smtp.kernel.org (Postfix)
	id E42BEC116C6; Fri, 21 Nov 2025 21:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8ECC4CEF1
	for <soc@kernel.org>; Fri, 21 Nov 2025 21:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763761841;
	bh=2rHW4dVXxmlCCmLJze23+a7QjM+P6SJZ+FpIjN55Ic8=;
	h=Subject:From:Date:To:Cc:From;
	b=EmNjijwa50Xejqfi4hX9q1U2MomqSvFCufs9twErKiRe7SHWAzeJJM4Gkg3WaDSXH
	 5z1UYbJoQXt7qnxXc1k/Hty0e3G4tUobpbi4KJ1Ba049uXJrBVUAt+YUHgaWXqOMyS
	 OakJf0JxFhuVbjM6fM1m+S0KZMfxyhavS7F4dAhyx547YhtBQHHNC7yUS1uKZc+YN/
	 yQF51e8T+ZbNsboUaTqUaXMDbA/PCI6EzKNuGETu86vInzi1pTLztnVE7q6/0eZf0T
	 lOESWJHOWSUrj3BWlxL5HwERI5Dv6RO98v1SDLWDu3NSBqUogwuKlgN6O6sjcRiwkg
	 dVE0GabKX6Xow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 753643A78A72;
	Fri, 21 Nov 2025 21:50:07 +0000 (UTC)
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
 <176376180613.2598359.12555114717124678834.git-patchwork-summary@kernel.org>
Date: Fri, 21 Nov 2025 21:50:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] soc: omap: updates for v6.19
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024426
  Lore link: https://lore.kernel.org/r/7h7bvolgd4.fsf@baylibre.com

Patch: ARM: gemini: fix typos in comments
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1015196
  Lore link: https://lore.kernel.org/r/20251023204737.2716443-1-linus.walleij@linaro.org

Series: [GIT,PULL,1/5] i.MX drivers update for 6.19
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024307
  Lore link: https://lore.kernel.org/r/20251117123358.2009662-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX drivers update for 6.19
             [GIT,PULL,2/5] i.MX dt-bindings update for 6.19


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


