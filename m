Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3447835F5F7
	for <soc@lists.linux.dev>; Wed, 15 Jul 2026 21:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784149232; cv=none; b=gQgRaPYldSq3KJ6vatsv/KMoDEC5aJMv9Qq8vR+O3CWSMMJE/8FlrzA1iWTwK15sLu3uewkXlR7flitFsaox407QFOdbp1zK3+i9OQTWy8lQEWaqp04f7sqhh1HOnrCFP4VnPulsqJdrNnDm13XJNJ2RaQI+Th4/Avs9XX3hTJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784149232; c=relaxed/simple;
	bh=DOvYr3g6YM8tQaahDOByYmGD37eDZKGDtEFAJl1H3dU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=dPKmTwtsBUidnIARsEEPoq+u4y0LWTux/SVjiUV3r1mSpeuuGw2vjk7xmXhr4DdKPA3/MiWe9eZP1rjFxn+Mx+nRe0BFypsZTnqHse3/GVyUqTQUjNfLJO+VMSOoPP997EJ2Nf7OIHgW55q1Kb7uLJ1V1vNUHDSSZpfLhGNPPHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pp6N4lUy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pp6N4lUy"
Received: by smtp.kernel.org (Postfix)
	id BF5111F01559; Wed, 15 Jul 2026 21:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97241F00AC4
	for <soc@kernel.org>; Wed, 15 Jul 2026 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784149230;
	bh=cvDAXcRaFCu0JfjP7hb8XUEaUHz8fXsB9ZKcZNCPfrM=;
	h=Subject:From:Date:To:Cc;
	b=Pp6N4lUywHp9FM/GDjlZihXqj4po8lZ1qOvEhuMG0n1kfL1TmZ83HmE08+kIrBRcg
	 snPOmHfNOj+eFpyhpX57hgPymIhdfZpcFYKJbANAPpDx4AT9E2ePsAQ2gRq+OkSS4v
	 EyFuXGgIkGGaxDPP1OV5WxPe3AbOd6iYTgUtA99ANovsXXqoQamckYAlCLP/KOt+l+
	 ILvOJsiwRBoQNEvf+KxA4eiotOJDg3U1IYxu2zewGfmZDc4mUOtvrD6R/8Y9oTGlBG
	 7jr53wZDMn2o4rWtCnx9rthbnVMOqOBcQlyl8+qwiKS4+klJ18zNioWhWlSuK1jWP1
	 FPyFRRKHg9Bew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93CEC393AFB9;
	Wed, 15 Jul 2026 21:00:05 +0000 (UTC)
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
 <178414920413.496106.1708873403671053957.git-patchwork-summary@kernel.org>
Date: Wed, 15 Jul 2026 21:00:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_scmi/arm_ffa: Fixes for v7.2
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1126564
  Lore link: https://lore.kernel.org/r/20260713110538.1819713-1-sudeep.holla@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


