Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C052392C4B
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488604; cv=none; b=cGNaB+VXS8ahZdJGgpxKyGCtIIX02QLGNXKLW66SqM6g2ddoPJ62Agacn+gfnqH+c34DOFEPg3zGGL9+ZUneMsIaiVwynEpF7rc2gqyQh0dK34cyToCbLT8V8DjsHWwskv2Qz6QxNYF7aTbP8msVOSdK2NoUxvWbhfiGzt2B2pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488604; c=relaxed/simple;
	bh=uq13CGHWVNk3TnW+q9dTD/RWJsKOaw6i7hLjPcgopBA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ZOJz1B6+N+RjHj0gr8EyNcypTwK6jJuTUBZz797pY2QTvEGROyUEzruxrat/LIfW1d/hFBodzBKF9Xv3B8+45yMNVUrPaPOXNjyYrBm7GciDZ586uoH8j8xCC07OUBU6BxKgH0NhfbIq06zLyKJSjuWj80K0cbu2CxBgRKUByMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0L3HhVw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0L3HhVw"
Received: by smtp.kernel.org (Postfix)
	id 2E80D1F00898; Wed,  3 Jun 2026 12:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FB51F00893
	for <soc@kernel.org>; Wed,  3 Jun 2026 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780488603;
	bh=CQjj/NYH13S3+mx5bVbL0HHQ33L4am1UMDqTEHLiaWw=;
	h=Subject:From:Date:To:Cc;
	b=T0L3HhVwIPhxZtq6cgKzrDAhEbU2kU0Q/9tEBOukjF4y7Cz2i6rHq/XPZ1AslmZYU
	 WYohhxJACbB5ug0CR+PtKieGyCKf1KP1AAtdysJLuw/ZCazfp/odd5Zm4EwQ3Z4Rab
	 TZWlGLgy023sIHADOZMeTQFK3pjk/FCrhgebyM+yMeF52+lDwGCo6nERITriBhIeug
	 vTeClQgVibea0wbEGoLsY48KO9ga8u7gT7gxuto3/nDYganVOY3CZCHe2kvn36V1kX
	 W/JARUZ8PwBFYHw4PoPezRlx4Rou9MGcTsJiqQb+43nT2kE2divKu6lU/za6uICmFh
	 EWvpnwQ3ZXlyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AFE3039307B3;
	Wed,  3 Jun 2026 12:10:05 +0000 (UTC)
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
 <178048860447.1379714.9752763235745773398.git-patchwork-summary@kernel.org>
Date: Wed, 03 Jun 2026 12:10:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Gemini DTS updates for v7.2
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102117
  Lore link: https://lore.kernel.org/r/CAD++jLkQ8FEFL4fbOgt+pbT3orGm90Xt1bFeGCKyB-Th=qOrjw@mail.gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


