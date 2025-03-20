Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB5C188915
	for <soc@lists.linux.dev>; Thu, 20 Mar 2025 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490604; cv=none; b=IjWaKoARV69ZoM259Qg0qj0hI/VgiSDUg1KtgROxiipQ+1NWxX/ucb2alqyJ0ZjzOcHlgwe+cGMTRnF5pzr6HKw3YaB88y7CMr/E/GOXSIRX7vjT8nf5fIhu70rO0w/iZf7PsiYdnS62v5lwxy8DAULdEEY9VeEUHYcfDpXEhJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490604; c=relaxed/simple;
	bh=UErEZRgmDQU76V2aRal5bh2llpK2ODdl4M8Yd0ZADIM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=QCfvOWr7kM+8LaGVJmEpmc8sUBpVMRhtLh0rdv9q7KbD80v0X97EsL29p4PG2QNcMy+iH6t92rIwxZc0EEp7F3fXmfIJg8AQHtUJdo3qTpoV7UnnqgQ8Gc9CMsc7+ZeHXc+jlAJbijcxJjFrq/wsAZatO2jJnhyxzKxi4+0Jj8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqK7vLqF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqK7vLqF"
Received: by smtp.kernel.org (Postfix)
	id CC348C4CEE7; Thu, 20 Mar 2025 17:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6503C4CEDD
	for <soc@kernel.org>; Thu, 20 Mar 2025 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742490603;
	bh=UErEZRgmDQU76V2aRal5bh2llpK2ODdl4M8Yd0ZADIM=;
	h=Subject:From:Date:To:Cc:From;
	b=TqK7vLqFnmR1T6SJCxmErWSet7spSLRPSWyFeeJRNZrlGk1HnU9g6DVEsxPjeRH3u
	 NEDZmZK+DX0sOS9xTQLnYiFdsbHEsBX+cIhcYmFA6pIT+02c6xutmbOfWApPnPGXGp
	 enBws1Mjkv0YwSbw+QMiWd+BfbrxupB2uESg8CXUMvn4768rHqJyf8372MRuphAZXY
	 fi1eoqe6TGJ2dBnse73gMAA5xCJyda3zFTpHw5Ky7d3fRuQlpTYjJeFI+rwtLq4M7P
	 DghSiR8XE2d4Qw/lKQdRqlLU+q2dpaDeZGyEKsiYCDcylt3l1eErcFW6vFPGHrms4u
	 Wv16OzMs0hDRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43F53806654;
	Thu, 20 Mar 2025 17:10:40 +0000 (UTC)
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
 <174249063908.1843567.13234706400502366908.git-patchwork-summary@kernel.org>
Date: Thu, 20 Mar 2025 17:10:39 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Turris ECDSA signatures via keyctl()
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=930440
  Lore link: https://lore.kernel.org/r/20250204131415.27014-1-kabel@kernel.org
    Patches: [1/5] platform: cznic: turris-omnia-mcu: Refactor requesting MCU interrupt
             [2/5] platform: cznic: Add keyctl helpers for Turris platform
             [3/5] platform: cznic: turris-omnia-mcu: Add support for digital message signing with HW private key
             [4/5] firmware: turris-mox-rwtm: Drop ECDSA signatures via debugfs
             [5/5] firmware: turris-mox-rwtm: Add support for ECDSA signatures with HW private key

Series: [1/2] docs: dt: submitting-patches: Document sending DTS patches
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=937654
  Lore link: https://lore.kernel.org/r/20250225184822.213296-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] docs: dt: submitting-patches: Document sending DTS patches
             [2/2] docs: process: maintainer-soc-clean-dts: linux-next is decisive

Patch: [GIT,PULL] amlogic ARM DT updates for v6.15
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=944768
  Lore link: https://lore.kernel.org/r/8632a8fa-7af6-4fb7-ba87-297df4f084f5@linaro.org

Patch: [GIT,PULL,v2] amlogic ARM64 DT updates for v6.15
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=945835
  Lore link: https://lore.kernel.org/r/f6fb1b2b-955d-4271-b772-0a75fdba1e48@linaro.org

Patch: [GIT,PULL] arm64: ZynqMP SoC changes for v6.15
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=944035
  Lore link: https://lore.kernel.org/r/CAHTX3d+T+_zvwAVqGO+J_+Yia+wXAGsaEbPi1ye1AUYXoq6dmw@mail.gmail.com


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


