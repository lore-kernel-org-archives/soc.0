Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EDD2D8368
	for <soc@lists.linux.dev>; Wed,  3 Sep 2025 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756929004; cv=none; b=OMUskrNEL5G33W5yE5Oza6FQxg1a6EXb5yGp4HNldWO1zQnePOOM1YKTugqi1wKYWgW6ypt+zi//vbxk1M3TzjM/qr79M7tKqSNtLkQ2y7RuOb0QzyJxGy++3OMYs+cj7NADlKCdURE3ChIS+hNHx0dwZj4aPNRRkBsHKtswN14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756929004; c=relaxed/simple;
	bh=FpRetVkFJ68zMVRWEoDHsy6lNMiiMQA2VffSmv04bjI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=efwOkJFOlMc2nwCsZvBeefP4s6rfQKPftzaRt4GYu9gDbXJdcJOS7HPTAu98cXOa6tsvFqYUJja3SG9PCCDpNKobWxzGM33DxndpxAlpq+1Q75BP83/cCkArYQt+lRG27P+FKkCGzkQeY6HK09ah9psmbrXfhPT4KcEHkHo9ZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwEdtIsd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwEdtIsd"
Received: by smtp.kernel.org (Postfix)
	id EBCC8C4CEF1; Wed,  3 Sep 2025 19:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BCBC4CEE7
	for <soc@kernel.org>; Wed,  3 Sep 2025 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756929003;
	bh=FpRetVkFJ68zMVRWEoDHsy6lNMiiMQA2VffSmv04bjI=;
	h=Subject:From:Date:To:Cc:From;
	b=FwEdtIsdI7xPzu8BwZEq9eW5oMQ4ncpthXI3wgUhsukeB5ouyHRq/ltBGzbjmF7xf
	 GITIJ/lJAIP0agO9rSLTFlylTeJJ24mW4NsKOYoEPL+F7W4XSKYyRDkWwMGzRsMYfJ
	 OmIN4mNo1YQr1kjE6xAokbHrzFzz7xfA598woSmf4mpHkxTUG1VVBvdUkwM4fpfDrK
	 Naar8VfddXwXOK77VVY8F+iOaYxdm58CUkgGUjk7Kj22KKhVamEWiIl6uPtidpzLrv
	 OA2tWiiLmq4cDso8X8zXFSEiAEELNEmYTlBl8ZYNXy/J1BpV1DqJ460HGmq1ZlGtlM
	 /po2VZSm295kw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CD3383C259;
	Wed,  3 Sep 2025 19:50:10 +0000 (UTC)
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
 <175692900889.1180377.6934452047908225341.git-patchwork-summary@kernel.org>
Date: Wed, 03 Sep 2025 19:50:08 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Rockchip dts fixes for 6.17 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=998409
  Lore link: https://lore.kernel.org/r/5909239.Y6S9NjorxK@phil


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


