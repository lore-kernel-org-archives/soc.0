Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D616B1F80DD
	for <soc@lists.linux.dev>; Tue, 15 Oct 2024 20:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729025425; cv=none; b=iJgi+Uw0MZ+Z8oXx5EQuCReyF146VbyrrI4bu6AaHnk2WNxwyJnQrgN4xgD2R1930+51VD54ZomQxBRdvjKUv0UB0MpwuYhWAWJN/aYDYGvCd6AVnNt0lWMNj1K3w/XXiaDtIMoDTXaI/XMAbFjHeo7xXa47FnANIphvJQ5qL68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729025425; c=relaxed/simple;
	bh=09lHrA9XAxGyKiy+sXINmXM3w1Uck5oFJqzaAiW5vvc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=dcVuMGQaB1cWZ4RqjFpmZNqMavnOcNR+kqYZ28FHe3gvrFNNK5+5Zc6JyY50WUZKzLpR6VYfwSAGEmxoKK5lr+eLbF/CqkT2QfNYg4jNWQ1Z+MvUBQCqB0UJzQggHgEHCV0U1ttpWy4eo6GxYsHePNmTHzeME36sB+xGIV/kyfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnIy0pdX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnIy0pdX"
Received: by smtp.kernel.org (Postfix)
	id C93D2C4CEC7; Tue, 15 Oct 2024 20:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE39EC4CEC6
	for <soc@kernel.org>; Tue, 15 Oct 2024 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729025425;
	bh=09lHrA9XAxGyKiy+sXINmXM3w1Uck5oFJqzaAiW5vvc=;
	h=Subject:From:Date:To:Cc:From;
	b=LnIy0pdXTwYohheSz89M8AQuSAWb8prfEHaA6a6UAhlGnTsGz/kzomJp3GfnC0fJf
	 WaVveLjvzPVseL99x9ORr4bfiEDjK6ycHTPUDj7LmTrbSkGgw0RvNGyXRdzH5UXbM4
	 m6K9ui6o569deodUHztfs1vssauubhkSpRl6ul4sKjG9HOEVf30sXxMBNZVGNle6z8
	 zxbfwZPdHxnpNDlF0LmDNswTpycrHaSo0mx4efvttFMolwxIUySCLqOJNiVYPtgB8/
	 p+zlLbrSNSbdN2A8O7jr9AN+8kKulaH1my6hznoSimXuwsaewsURTf1s1k2+nrDYJk
	 /T8deTDbfKXVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EF3BC3809A8A;
	Tue, 15 Oct 2024 20:50:31 +0000 (UTC)
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
 <172902543040.1289026.898492781502890783.git-patchwork-summary@kernel.org>
Date: Tue, 15 Oct 2024 20:50:30 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Reset controller fixes for v6.12
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=894164
  Lore link: https://lore.kernel.org/r/20240930165733.1541936-1-p.zabel@pengutronix.de


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


