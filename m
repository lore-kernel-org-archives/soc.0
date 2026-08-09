Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FB2E737D
	for <soc@lists.linux.dev>; Sun,  9 Aug 2026 02:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786241448; cv=none; b=UpU3T2xLJSVBWBxK1ThPxBxzYOQwgb5Gs7Lhg/xAPVloWrPCk8/ycU799KeK/q83h/xWw0q3C3NpuWfU/dJtjrXzig54yv6l/URi4aTpVMTtlAguXUp30akSyngkYatQgz5XmYGuU/Kol0b8h3u6Xw7DvhOxpX5bua9s9Zu4Ang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786241448; c=relaxed/simple;
	bh=Mf3/T7jXGVjZmSDd6K6CBdzeSJ+z5UwSqIWrpcxKG0Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=D+pREPIByqIGWGkeeGmQN2GD/27daoETwSeC0xwh2oVqrIzdioC0VeDJxMp//OEwjLC9i/v+040T7vI0/8Qw+cD5bMABFcdswhO6U54ZiG1ea8PP++Ey1VLFOpLpGoJrYVqR9HfbKg2gLbTU+V+uQBRcEUboIkW4Rgz6g6tW860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRy8+HJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRy8+HJ1"
Received: by smtp.kernel.org (Postfix)
	id 0F8071F00A3E; Sun,  9 Aug 2026 02:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFDB1F00A3D
	for <soc@kernel.org>; Sun,  9 Aug 2026 02:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786241447;
	bh=vzXtV4uuWrQNIiVw1oG15U+LcwPFvM/9KwlO1Bcz1IQ=;
	h=Subject:From:Date:To:Cc;
	b=mRy8+HJ137WAuVjSa6Hw+12bX5X8k3KNrVRBboq1LqM8cKHNHho5Rp71/te6zKaq7
	 2H/snOD4wZq8P0D6L7YsFyZ+WwEQ0y7cbJpD1FLJPtLv0bzV0DYWWP2QMyalIEdNkK
	 8zUv08327t2aYuNbPtxappkc/zDWYH08dOlELB2UeClSxoRtEwvxz4IsuIBZhfrPzV
	 /xVsAsR0Qev21c44wIoM8PBG4sO9spFJUrEYnpoohWy8LO92Fx4esexwQIU87qQqFv
	 VkkbTOwmGW4s9B2bUCXndjctJGhymDFrFiAkLEevoNqXcC9M+NttctceIVKWjtlR+M
	 d6P7oez924pGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D33D4380CFFE;
	Sun,  9 Aug 2026 02:10:05 +0000 (UTC)
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
 <178624140442.2813131.16579087084803948359.git-patchwork-summary@kernel.org>
Date: Sun, 09 Aug 2026 02:10:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] dt-bindings: Changes for v7.3-rc1
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1138963
  Lore link: https://lore.kernel.org/r/20260802165148.1259649-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/4] dt-bindings: Changes for v7.3-rc1
             [GIT,PULL,4/4] arm64: tegra: Device tree changes for v7.3-rc1


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


