Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103D578F40
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826789; cv=none; b=ZnrWF4gLMjMfG9bW0DUThVc5qU+vBgD5c4dEQW3J49gRcJfN5Wz1Q/zGtRb+o4ZpK+pViJZV4d/6ObSsE6r8ndhuJvIZ1JNfJKHUQAUjNqXYPQzJTH3ktKLG1HzDqGuuT/zBoU/8LJtzCBLDIbKsdhM89FjQ7HIeplaJnmO3wEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826789; c=relaxed/simple;
	bh=Ib+fGfRnfOU9ki9XEzZy9odH91sYdbAw/4aJJiBtw5s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=JrvPqgYBIX2mXwMAXVDzIgIQgpHbPlTFSXBRjDUivDOzMNnJ97wpFOnxtY1C7DwuDN903WQ5vAhg7JolPXXapJigkO7AWrFCHkHcB2wW5BFnvE9TZd0PR5oYV6UPmVDh95i/QleMkXzBSkUenFTGK09eFQsmf/8Tf+3oOBwM/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAWpcdRC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAWpcdRC"
Received: by smtp.kernel.org (Postfix)
	id 89D4CC4CEEB; Fri,  9 May 2025 21:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740FEC4CEE4
	for <soc@kernel.org>; Fri,  9 May 2025 21:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826788;
	bh=Ib+fGfRnfOU9ki9XEzZy9odH91sYdbAw/4aJJiBtw5s=;
	h=Subject:From:Date:To:Cc:From;
	b=HAWpcdRCrIPeHBoAaeT6b1NrbB7Aw865D5lvmD5KJYjL7q8Yj2U4cN5nMtWZufOK4
	 sbv27vSRhfLAUfcO9tvtjsDT/nVm2S+wC6VtVzhCnyRfbQHkXCBy7Vr0VZzVjTSu15
	 aV4fFQX5T05kHBYAR7KuSjvoOIhYGHhwKQ4wQUQPWrvMkyX9aQWWgXSuyyOUmVrBlC
	 5SIdTmMVkCgV19CD6Jd6Y0d6ojCW7f0+3d4rhZ/Difi3pU243xzMEYO5/MFwotgN5r
	 ZBztoauk4ctiGE5EC7GWoX8R2FnOErCKbN57cZX+x1TGtTymy9xsECbd8TJye+hwwt
	 4NtsBafA90sWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE4C239D61FF;
	Fri,  9 May 2025 21:40:27 +0000 (UTC)
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
 <174682682638.3820180.18445162515283291636.git-patchwork-summary@kernel.org>
Date: Fri, 09 May 2025 21:40:26 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: MAINTAINERS: delete email for Shiraz Hashim
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=948657
  Lore link: https://lore.kernel.org/r/20250331190731.5094-2-wsa+renesas@sang-engineering.com

Patch: arm64: dts: amazon: Fix simple-bus node name schema warnings
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=951738
  Lore link: https://lore.kernel.org/r/20250409210255.1541298-1-robh@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


