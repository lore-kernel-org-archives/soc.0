Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C47122A1D4
	for <soc@lists.linux.dev>; Wed, 23 Jul 2025 20:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753303193; cv=none; b=ARvAQPDK2NaGU+evbUhE8/BV2GZ0eZY4yi/gATYTvgO0iEULkbTr5/pxeNM2Q5qy/cT/ANll26I/5HohY9jQGVB8ziXM+JnmWDK1FGhqGkE/9LgQEROoiUghaUPfg3NPTs8qiU5e4OqAaSf4qrMD4Ut3wDxMj3kv5FQq2uHOY9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753303193; c=relaxed/simple;
	bh=NuyFKkbbzu8O9HjoXJ+TX1pM+tGeAFaLTNqJzv7R4bs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=KoQDWDmR6j1t+6mr7M0NBlqABieRVu/rY73rNHZgv8YNfy9atwUtQ5A5s8mUV0bhI3CRWTp6C+bzMVEWOUs3KA5cSfLgHji81bjuLIKcL3NK14/qgf3fVa4B00Xl/RHxBd0iPD6qIj3H16seAyE9m9ORFhmN4ZPe0nyb7z8T7OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9CxEi5a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9CxEi5a"
Received: by smtp.kernel.org (Postfix)
	id 03B5DC4CEF5; Wed, 23 Jul 2025 20:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20A1C4CEE7
	for <soc@kernel.org>; Wed, 23 Jul 2025 20:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753303192;
	bh=NuyFKkbbzu8O9HjoXJ+TX1pM+tGeAFaLTNqJzv7R4bs=;
	h=Subject:From:Date:To:Cc:From;
	b=O9CxEi5aLFVcjEiTXx03EO6j4Jucf6dldnyzC3ZkrGzBK+8fH8xs4R88nQBvzWzjS
	 vpSOduPrfJI3fZIvi+mZ+0f8AsvJ6K53VfJjC6u+w9/z74XAERU2qmLb6D6xYoflUw
	 03mENN//MEephNxbiOLUIpVH+Q/2fanBokwzyagid+UkIDdh7YmOo96IgR1vbfIEqo
	 D74RqUvjhqoYtZlUYxN7764gqdbq1us2R70ddDOX5EDLv5nbdjb2J1InkRYOpw/j1L
	 +c8qWNI3yTKCwNN95Q//v+P+Id9p+aRbmj4OkgKKmxegL5boR4zyGI8m/APxjXAMPx
	 8kr3nGN9J5HrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 374CA383BF4E;
	Wed, 23 Jul 2025 20:40:12 +0000 (UTC)
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
 <175330321069.1775141.3705697935690901607.git-patchwork-summary@kernel.org>
Date: Wed, 23 Jul 2025 20:40:10 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982749
  Lore link: https://lore.kernel.org/r/MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM

Patch: [GIT,PULL] RISC-V Misc Devicetrees for v6.17
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=985171
  Lore link: https://lore.kernel.org/r/20250723-postage-skylight-597377b5f8e4@spud

Series: [GIT,PULL,1/2] samsung: drivers for v6.17
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=985031
  Lore link: https://lore.kernel.org/r/20250723090455.25295-3-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] samsung: drivers for v6.17
             [GIT,PULL,2/2] arm64: dts: samsung: dts late for v6.17, part two

Patch: [GIT,PULL] ARM Sophgo Devicetrees for v6.17
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=984998
  Lore link: https://lore.kernel.org/r/MAUPR01MB11072C4B088AAC02268044E95FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


