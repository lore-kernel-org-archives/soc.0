Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F57304967
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722598; cv=none; b=LLnJUuS0Rnaf4uGTI5MMRlhgt7czJDFIahWAfwzVP6fiLj0NSBnf1erDGWDhCmPsA+489BZbVmsBBuAXOv9r0iwkYv9hWf0jVwjdU8sXFXqXvO8n+AfUAVIOYtWdH+A7C7zSj7iJUQxOAiBF1ABGTZtMoMDFzTTxYrWdUqKn5kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722598; c=relaxed/simple;
	bh=prmnGmImdcLL/1vwRUjNH64tt6aql2svv/aaWnGpfr0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=UU3JSButTb9+NLRNNoSYbWIu0UFO0OLA8zFUiLRXV7OqxVvJLOPyPjtyDKZHbiKoe+Aa/AjUxoSY2HxFU9drC8VYti5xgmbpmeO46wNjEEbsEG3d9bMTFMTbfxP617xXUfccjHmDg1/92jRGO5vyGfXi5mqPnSARpLaExmM4mE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHJS/I9I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHJS/I9I"
Received: by smtp.kernel.org (Postfix)
	id 1FAAFC4CEF7; Mon,  1 Sep 2025 10:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3ADC4CEF0
	for <soc@kernel.org>; Mon,  1 Sep 2025 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756722598;
	bh=prmnGmImdcLL/1vwRUjNH64tt6aql2svv/aaWnGpfr0=;
	h=Subject:From:Date:To:Cc:From;
	b=EHJS/I9IR1dGN2qDiPqAs8DNkJqKkOXuVQOo3smjKeiyX7ZcMjlKGIyfF2aoU2jjV
	 Gu7BRKac0PGuiUP8G3nKr8sB4TsaKFXg/70m4vS2Hmgasn5qPVzfs5fLTmCIwlnOq3
	 KYHT3/iCu+ZWyQaDGjse+3joYMyJMZi4zQQPLPvfzDAlxKazQkHaB8mOgN6y3b4jzK
	 9q3x11O6BCnuqawrNQCdgsrhcLKXalNf6PGpfLg4Ewi1qXev9ZbiSxf8Te4X6hkLsc
	 DE6I0QH9JxY3yc4yCZBL5MQGgiz7zw2jw9pWEAFZm09jPeHaGWH7OCp0YyU66CwzII
	 G3OyL6o1KyQAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE772383BF4E;
	Mon,  1 Sep 2025 10:30:04 +0000 (UTC)
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
 <175672260344.3678624.17480869609132915355.git-patchwork-summary@kernel.org>
Date: Mon, 01 Sep 2025 10:30:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: MAINTAINERS: exclude defconfig from ARM64 PORT
  Submitter: Sebastian Reichel <sebastian.reichel@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=992748
  Lore link: https://lore.kernel.org/r/20250818-arm64-defconfig-v1-1-f589553c3d72@collabora.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


