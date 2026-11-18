Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019405;
	b=eXvoNvmiBrpvw7Ymn84BCZ6cNW8szhHqD6Csp/wxIb1NLUGBLOZtourS+6POzrYibnYh
	 d0Gh5lKkPWpE8KKeuxP1qp5CFmlAxu1O5/6C9cnTezr35wPBl/jFjuvJrTfmb0XdYawFd
	 oj9RMHYVxyCquOnxPsiYSZ8QguJcFX61B42w2kUHiv4+AIG0s6AdVeWhfbNlsMH4oRHZQ
	 9pLMYKy3b7fEw96GiMTU0vvDwejqgcpwsYExsCDCRBnZkSZQPTHijc2dPfu0IBYTVdyq2
	 YvefUWNwFTkZxhxU6nmGLp6f7VGcct3nJTYHJ+EG2nA5bdzH+dUtz51R5eA9ug3TPuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019405;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 To:Cc;
	bh=coq4/oE5EYG4zq2Y45obdqPu8+UG/xtmYQpXh3uvX9Y=;
	b=giPDE8+CfU9DeFBGFhJKrnXfvxCSyywEw5/1H826/ivTmof7xkc/K0yRnkhf1TFyjV2E
	 nYQ8o2zSBjFnKEEcHlBJSB1Fp9WP0CYN1KrxehEvTd5pdIgBWj+8btwlD24NJw37Uftxj
	 xMbFH6hE7Wndh7RbdzhIaEeykpwEclfIuG2wMZhA1laPjd22pqghHoUSCBZFY0LaPXTL8
	 OIgXjYj4gL1DEGaIN3JijenvufLrwyUFA7OiBHansSeS4dSfrZkqC2Rr+fHUr4vh3ELpr
	 6rbfkUzd1dShcVYF1bTUhmARQ7/aB2lzKmzMtS+fvbr+WSLP7OaoavPWMKO1ucvu8jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NWtQe3fC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E460A2605
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NWtQe3fC
Received: by smtp.kernel.org (Postfix)
	id 05ABF1F01573; Wed, 18 Nov 2026 16:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E208E1F000CA
	for <soc@kernel.org>; Wed, 18 Nov 2026 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019404;
	bh=coq4/oE5EYG4zq2Y45obdqPu8+UG/xtmYQpXh3uvX9Y=;
	h=Subject:From:Date:To:Cc;
	b=NWtQe3fCk1ajHcK5jVc5j0pSXBYkqxQN2KM+k7Tgj3CZKfOvh2aKoY2/pttUdmAVl
	 qSeBPiY5iOeueKfv+S4xKQPotHPACDYlAGH870pWXicL8g3T31tM5SQIoUA0a46/gO
	 vxgYlyoWys3zqMAfdwiRbhWQwO9ETaKITD+ZBONG8Ao0AJ/eaSoh3ys3q5To4wH2Gp
	 T5DWQSIbvfshQva+5iRzd2dqxCCcxBNSJzqS4GUeNeoilUaO+ZrHpjXYZBqOOMGG+4
	 lu/PTyB18yxDz3QM9/5uP8glQmqkmSlPAvwp5RLpqJXXA74a6hpvv5gD6d23KkpKFM
	 EPbtJ9BTx209Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B683C3808210;
	Wed, 18 Nov 2026 16:30:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501940343.1837438.6662802605501972966.git-patchwork-summary@kernel.org>
Date: Wed, 18 Nov 2026 16:30:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: [GIT,PULL,1/2] Broadcom drivers fixes for 7.4
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1211156/
  Lore link: https://lore.kernel.org/r/20261114034550.878760-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom drivers fixes for 7.4


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


