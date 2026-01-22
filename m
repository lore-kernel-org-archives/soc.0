Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1902F42EEA4
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079010; cv=none; b=KcGodtf9ZFSH6xfgvg7qWON2mSJAHGA97rDLVQllleYI78fEuuEY9pa8iDq9p7IiAj26FkBjoLEwdVcY5Bkcn55e2YqlKTfTNiuX7vLiSmyfuyGGy+TMZoGbxX+/dk6chiORQN41RpFwNV+VKygmxKP+9I251aBMOd9WQdqr5zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079010; c=relaxed/simple;
	bh=TAW0wSQIo95UqSXbEZy5Y8+ePN+ZcRr+aTbnKj41HK8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=thb4Wyre1y/G+xUPHco7xwjfbRPY+D7EIBeJeLB9DPeIMwNEnCc17GXczRJaCJ5khaKlNT0ApeYaFmMbHzd73ooAGvi1FSNeg2rZxrxj5PE3jp2TIgBQ8fQd+nO/Y8+dEz/HqY9qXw8SwqVJZwyPep2EW2VYPJiE8nEpqJtyaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzjJAdwa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzjJAdwa"
Received: by smtp.kernel.org (Postfix)
	id 9A3ECC19424; Thu, 22 Jan 2026 10:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F29C16AAE
	for <soc@kernel.org>; Thu, 22 Jan 2026 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769079008;
	bh=TAW0wSQIo95UqSXbEZy5Y8+ePN+ZcRr+aTbnKj41HK8=;
	h=Subject:From:Date:To:Cc:From;
	b=dzjJAdwaGoTyD0QKlMa+z3cK6gQ7SDPpeXaOySKFCe2y7HF/XzfnCY6wx1PIoMFda
	 7crlkQHwiE/Vn9gN/FGboJe11nn8oMqnq6qtbcW0b3PbyAZAdxjDty0yKh3jzk/BQc
	 Hqg70mRN2ZfBQqT7SbWbtXn1fbKL1cYRWhNiB8s8bnYNeWi8MXEvXsskkz5oW7xir/
	 H397OmzLOY5g7SiK4Ob0iIuMte9iKqNHZknU54S72XlqJvDaElgFo6xlAcv5dy1Pqq
	 Q3kl2ga9pqfoICC8dKD4D5pEdmV8XRPHs93ThAhwK7t+bDM5iXXwu0uN74PP5b2Tqs
	 nVYKjn4EVtuLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 511F93808200;
	Thu, 22 Jan 2026 10:50:06 +0000 (UTC)
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
 <176907900502.1663980.16621439460601889483.git-patchwork-summary@kernel.org>
Date: Thu, 22 Jan 2026 10:50:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] nuvoton: arm64 devicetree changes for 6.20
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043068
  Lore link: https://lore.kernel.org/r/0dddb418ec4d81b30e48a079ecad8a388284cb9f.camel@codeconstruct.com.au

Patch: [GIT,PULL] Apple SoC DT changes for v6.20
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043843
  Lore link: https://lore.kernel.org/r/20260118193032.64139-1-sven@kernel.org

Patch: [GIT,PULL] aspeed: second batch of arm devicetree changes for 6.20
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043078
  Lore link: https://lore.kernel.org/r/c7002883dbeadf44069ef5e8cf573d9f2aefc899.camel@codeconstruct.com.au

Patch: [GIT,PULL] NXP LPC32xx device tree changes for v6.20
  Submitter: Vladimir Zapolskiy <vz@mleia.com>
  Committer: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043337
  Lore link: https://lore.kernel.org/r/20260116131637.101296-1-vz@mleia.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


