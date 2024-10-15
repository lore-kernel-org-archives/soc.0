Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411A51F80DD
	for <soc@lists.linux.dev>; Tue, 15 Oct 2024 20:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729025429; cv=none; b=tEwEIkDO5I9u/hT+lcZ4eUY7kKyrtt9okeVeLY6IFeO0mzufa/G714/jfBZsrlHF5VlNB6ODDA9pA8BbTzlZFQuYdQ98VufiN9d6pTQHbtSUkMssx988/VSCVs/3CXlFvz/d7EP3+azSRirrDj1M8sErgmZKWzJ0U0i1PbpUC3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729025429; c=relaxed/simple;
	bh=f4pr2WP/BLzrkC6YPzC3DRjUFqd68b51ZQNRsJe4aKQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=lA4K3utpqnX9wlCBo8lBohCpmFBMoNgSTFoOs5WmOqjmJ0smphgdT4J6s7ba0TNstGmMwOCaGAvp2uSRhlE29x465Nkdt83l0PqqwwtHL/uXkn9HkUmmIeMuauGejS6HHF6lkh8OafGs0F3w34p7wAduzdO0NdCO9ufireW2QwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIpLIOTL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIpLIOTL"
Received: by smtp.kernel.org (Postfix)
	id D3BA6C4CECF; Tue, 15 Oct 2024 20:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE70C4CEC6
	for <soc@kernel.org>; Tue, 15 Oct 2024 20:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729025428;
	bh=f4pr2WP/BLzrkC6YPzC3DRjUFqd68b51ZQNRsJe4aKQ=;
	h=Subject:From:Date:To:Cc:From;
	b=NIpLIOTL1jLe0cQII4K+id1QsnwrJ/zdvrQ2D5ljVJfG6sV85ERUSgMslGTrhAeWx
	 Rl3Cf6OXp3hP2lDZKDZZs6lYPwrBQk+h08zA6Av7bfRS5X/HRkvxJRhAxUavyEBdJ3
	 E1z0mhumDozZD9JwjUxsRVyroj1MQ3SkGw21m0y9uFy97OQwFotUX1cWVTCX9Ek5k+
	 DYnmU1UL9hX+z55p6tSJlgHkgK55POBHrBsb31TWEC8hwX2Z1tXbbuvFC/+MZH20Oa
	 pUBjeOLK4v51aF6d+LZEgJd9d53Z2adWWKeHk+R7hJiFnTQX6EcOCyjJ3AF5pLZwfF
	 KAU72LOejI1yQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BFD3809A8A;
	Tue, 15 Oct 2024 20:50:35 +0000 (UTC)
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
 <172902543385.1289026.10392347118664451905.git-patchwork-summary@kernel.org>
Date: Tue, 15 Oct 2024 20:50:33 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Reset controller fixes for v6.12
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=894164
  Lore link: https://lore.kernel.org/r/20240930165733.1541936-1-p.zabel@pengutronix.de


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


