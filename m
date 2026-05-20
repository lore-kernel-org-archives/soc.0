Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBA5346E7D
	for <soc@lists.linux.dev>; Wed, 20 May 2026 20:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308995; cv=none; b=cMV9svREL+T6wgBOcNFdiStLLhzTAKC39Jt7YrVjNcv0uwMiCAkWEXG+bzS9YImhGn0R+Vvaxx7weEdjAHS3P+fEueSR/XfU78LBELSlBaRpC3SEu9ZfueTAx49nJRUN9fMJsavzi2oKM2kP/WucxkUc3cCbc1JHlI73z89BesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308995; c=relaxed/simple;
	bh=KOJu+mPPeJbTVIg+kmUv9mjaP3czWgXghAc+zO9It+I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=NdCdR8aWYbExXwPqIA8y3AfnPSxGBVj6bxN9+9tZSo/2q+35yZ+0p6SxHQMUz6Bn/Qt2JBSpCaB7/dCdRah+itMMSDy8u84P/AocoYcry+kNjQ0Yqhgc5ZmfuSZlGZamXK9uuZFUAZkrW0xZo4jgrtoECaUP99++tTs3gQdHq7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfuDnSOn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfuDnSOn"
Received: by smtp.kernel.org (Postfix)
	id 39A6C1F00A39; Wed, 20 May 2026 20:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240481F000E9
	for <soc@kernel.org>; Wed, 20 May 2026 20:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779308994;
	bh=jyE5hIyClyhTaT2dD4iRRFPhURkJ2Yq3F7i4tYyvqV4=;
	h=Subject:From:Date:To:Cc;
	b=ZfuDnSOni0Q/GF3SxWISqBYwSOUJmKUpRSxCeqUWPenHuZeVIEVk7M3UJCqFU4Of/
	 UKzL8DyjPoTbU8pJ5hiXW226swP0reM1kGWxcmzDK7CynPBoHhxAQnuReOmgtqkxXI
	 Gq8dhr/YOy7pCtAHTT/rbBDcOSQPVo4Rtqw1LfREiOFjEUaubGesH1zK2luykig26j
	 A2VGezQqL0wcSfJb4S+NyeH4SOr2L/WNZkA6Z6oaGwHdassqBGL4GEA5cGBCErQq5G
	 73+3RX+ah2adOZk540fv9tSlgwZkMuUQce22EcvwrNzOhC/oDc2HgQ/50y0B023J/d
	 t4YvCkKdWHIEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9F9F13930BB7;
	Wed, 20 May 2026 20:30:05 +0000 (UTC)
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
 <177930900449.3744642.830361993227374115.git-patchwork-summary@kernel.org>
Date: Wed, 20 May 2026 20:30:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: pxa: software node oriented GPIO rework for v7.2
  Submitter: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1093506
  Lore link: https://lore.kernel.org/r/20260512121805.26023-1-bartosz.golaszewski@oss.qualcomm.com

Patch: [GIT,PULL] ARM: dts: zte: Add ZTE zx297520v3 for 7.2
  Submitter: Stefan Dösinger <stefandoesinger@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1094481
  Lore link: https://lore.kernel.org/r/24423793.6Emhk5qWAg@strix

Patch: [GIT,PULL] CIX arm64 defconfig changes for v7.2-rc1
  Submitter: Peter Chen <peter.chen@cixtech.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1092438
  Lore link: https://lore.kernel.org/r/agE+l8yT5a48G4XT@nchen-desktop

Patch: [GIT,PULL] ARM: zte: Add zx297520v3 platform support
  Submitter: Stefan Dösinger <stefandoesinger@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1094480
  Lore link: https://lore.kernel.org/r/2114249.usQuhbGJ8B@strix


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


