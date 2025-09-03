Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A28A29D0E
	for <soc@lists.linux.dev>; Wed,  3 Sep 2025 19:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756929001; cv=none; b=DT7FOxctByFwIKGYFU0solJkkTriVxmruUsEA4pJc+a/54pftfbwJMIEci9AgTQSYgNP+CFw3tritpiy1AjpcAZc8zVxYD8dAysw2V5+aE6tbrVQuw5CROPAxf8jF0Nr1MOV45N6He8/geebbm6zBqNYZtQ6fmBufptw4fN+0fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756929001; c=relaxed/simple;
	bh=DBy0xlE+QxBVIk7ojNaUDGZXueLVFsJ81FV61ki488s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=l/KX4BxLAIHbGhRfjR1JPKA15GII3+KNkZS6iCTYFCOV61qqWrR5TlvsX07pi8ejrpqWAtW5KDTha/GMd2AlaAv6FB5RX6MZ+0/Rm18ufbMn4oIRCP9/H1WJldXBVCv8yBFqQ2HdidNo7wJV5hE++YJI/JNT4zo/MfHXkJyvq/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7o9gajn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7o9gajn"
Received: by smtp.kernel.org (Postfix)
	id 9D4AEC4CEF1; Wed,  3 Sep 2025 19:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815EAC4CEE7
	for <soc@kernel.org>; Wed,  3 Sep 2025 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756929000;
	bh=DBy0xlE+QxBVIk7ojNaUDGZXueLVFsJ81FV61ki488s=;
	h=Subject:From:Date:To:Cc:From;
	b=a7o9gajnoAtdLqON/dIzJ05sYOm1tvtd6WjMqvsxOcTlQN/uvnylzv3FS8bFlSiYM
	 0SiInF1ABVYLnGEq6xH4jGnLkLha4zaiMyc6Yc7EaGAfJ4nZPKVAH79x3WMboyrnhF
	 lEt/ClSWWGqYXD/PBSzCcaER3MXSZUKDttZH0q+3ToMp23JGvaR2ZJ+ds7XLnlpU4M
	 AJJ45hYWouO8vcUdmqpTtR13W5ADD6GY7RXgLgzbUrvAfJPpfofNAqaeb4+CBziAzS
	 i0o7syXjAjCGYJB1uZagQPcTdoK6dZPSGJCdevDTWzo0DsN4D0SN87Nef3hQhOV/yW
	 1qRlD/VSZUjaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74C27383C259;
	Wed,  3 Sep 2025 19:50:06 +0000 (UTC)
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
 <175692900498.1180377.12526119813257683677.git-patchwork-summary@kernel.org>
Date: Wed, 03 Sep 2025 19:50:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 6.17 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=998409
  Lore link: https://lore.kernel.org/r/5909239.Y6S9NjorxK@phil


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


