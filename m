Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC913803EF
	for <soc@lists.linux.dev>; Thu, 11 Jun 2026 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213409; cv=none; b=LTleikENWHEaPo2zq1U/GFmZKPW0l34pkF/ewHblAlkn2IQv23WQUSy7tW2eZeEmTAPoW9wHpwZTJeIa01qVY2ttBLeJdNi7BjIz0x2re40PeK/lmaQ02QWqRuFd4TMGh6xMZnVoculRhs0HyLnae28Ibp0wkUKGdeSjnHtesaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213409; c=relaxed/simple;
	bh=YHQwk7/5M3sKJ4VJOQ8b9e0gIDYB0S1t2wJf+49PdQ4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=LTqt4aA8KGzwLQJsTgLFBkOq6Abs0uWb3IcdQd8mLEixznUWGCMQhofKX2b5WqjdKVfFKk3eyJtLaDDu7Uto+UxH/C8fJ82klughK8LI8qOPuf6ftdsO5Mt6oPBDhrGph1UJlj8kBEvr4kQ1EmqPCLYOCChYqbMHLfUh9xPB1b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAu60G+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAu60G+P"
Received: by smtp.kernel.org (Postfix)
	id C72841F00A3A; Thu, 11 Jun 2026 21:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B168A1F000E9
	for <soc@kernel.org>; Thu, 11 Jun 2026 21:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781213408;
	bh=ZB59OFdcDAagsvbvc2TuKmHKvsuAvQMNksYIxRlG9wQ=;
	h=Subject:From:Date:To:Cc;
	b=aAu60G+PupscOPd9M4QwCFGOcIKzuUx7I2mZdwP5RGlbeOX1rskP2wWaOLa1hiiTq
	 xTMQKqeiJQMrqnG/+GyvsPhmSg10Yb0QxHjLBjgL8qE4OE4rHHUf+aFFlCD6jyRoi9
	 SGX73kvAwipYo2zzLZVJsUdgS+W1Y8PnGPRhonYx+3FAZO21QUYVxbKZisrHltFbVm
	 363e6NHgV7hsgwIAMOfqWY5WsF/jKt/SbrXknsxsYwQl+Wxe8zFdzL9MnhXBukUsqv
	 ned/XQRodyQLMPCJkTTY9/W9eV8wLEetF8sdYLX0f0MmGLFC48QhYBzBdkWaKXwQj2
	 yckJOCeTvtN2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C2A23930FAB;
	Thu, 11 Jun 2026 21:30:07 +0000 (UTC)
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
 <178121340556.373642.336522245101786228.git-patchwork-summary@kernel.org>
Date: Thu, 11 Jun 2026 21:30:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] i.MX binding (display/lvds-codec) for 7.2
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1110119
  Lore link: https://lore.kernel.org/r/20260611144912.3860262-1-Frank.Li@oss.nxp.com

Patch: [GIT,PULL] Allwinner DT Changes for 7.2 - take 2
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1110099
  Lore link: https://lore.kernel.org/r/airAH8n0YEtB3i2a@home.wens.tw


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


