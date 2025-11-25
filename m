Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC11E238150
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078644; cv=none; b=pQFKwHfdC68jPbRUkNwm9+HD6TtKYurO+UJLHfAOGO7ct2DzO2Sh/MggsV73P9SdH7UH2P6AeOIjiViHbbzI+9UX9HFm5vHp7LZgRchYjmgzzJRhV4gCYJ1WV0RHj6mBBUtXt9V0jkmNafCSmbVlkzAXbH7roNrx0u5i08AyXUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078644; c=relaxed/simple;
	bh=2BkZdGs/4H1T3zk6r2uBwNggm8V3xmGkBkC/X+lCqKw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=BJILVWr3mV1pzRBSX+cY3PTlQAdnQEo+zZfNBDgxLlM29Q6c1VyirHXTuxtBr0hr1zpBqGIZiJrTIUcNcHtEVpu9cWaLQL7+Ny3HL0+/PvzX0bkEkbrzDMJky/yLpdMjrJxuSItK+6pjSgJz72SFRoxqh4K2VzftE4/9Y4gBE4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyHx7G4B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyHx7G4B"
Received: by smtp.kernel.org (Postfix)
	id A702CC19421; Tue, 25 Nov 2025 13:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91154C116B1
	for <soc@kernel.org>; Tue, 25 Nov 2025 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078644;
	bh=2BkZdGs/4H1T3zk6r2uBwNggm8V3xmGkBkC/X+lCqKw=;
	h=Subject:From:Date:To:Cc:From;
	b=EyHx7G4BnpQnqrLsmmSDBHbKCNaKnKTw4DmdAkSsZiVcbQOxedMRcLWFAFRpW/HqR
	 It6s3eUlDHilVVD4msI+3+UTa6gsGSAHgBTuTCsCL/bbfmyPs0qcBWy6TOrpojUstV
	 PzBbwBXp0ksW04rb8Gz604akdQK9RUD5jelrS7/PqVb6MNCSFgALC5iPTXnJ5E0D2u
	 /i8Trb0bA1ueJkgVP5yDcF/tZKKJE53SnS7TWE64EiOTs2ZKd681eqn1G27WvrYsKd
	 fYPovsrU7xb8AFfU0IkBtx0nYFEgDERlht5mk8KyssCmfRcjDIEdzHwW8Z16JZdwhx
	 G2BE9LN42HF2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37ADE3A8D153;
	Tue, 25 Nov 2025 13:50:08 +0000 (UTC)
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
 <176407860672.736376.9411540466466165014.git-patchwork-summary@kernel.org>
Date: Tue, 25 Nov 2025 13:50:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] soc/maintainers: OMAP updates for v6.19
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024437
  Lore link: https://lore.kernel.org/r/7hqztwk1n5.fsf@baylibre.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


