Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED40200B9E
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424904; cv=none; b=r08071zkzMl+k6YaW7d3AraaZFMM+c2kkeD8Dn2gATemfHwkxH4xkcjB9x4QuxdZlZAtrWvDKaTkNJqvo8XBbJD2WyeJjSmoh+1CIFJNnN3BuquDsRn0sjGI8mDCZOiK3AAnwohqzHsiONHK2DKzZrX7AlYc6OsMFdCjFE7egQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424904; c=relaxed/simple;
	bh=ufHKGV4URGIBzjbpyv3RC4dVxUcwO4oXGVwO1pcP0nE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=MMxTWjb5JQ4GHxFTsvaCsAtooYFt/xhDVjXd9Zy0PXdy6s0TaZBdzMGW8UWPYZf/PVPYWomTAnVS1lz/DeiDKjEtYIKbAhUvpt/W2LH0PfcFWb2XHi+rnm9rbtaz/HsoPgfWU46EoBKN7n9PSs1lvHJmkUojzruo5GvuG1DpaF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEz40Hkh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEz40Hkh"
Received: by smtp.kernel.org (Postfix)
	id 16ECCC4CED6; Tue, 12 Nov 2024 15:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FA3C4CED0
	for <soc@kernel.org>; Tue, 12 Nov 2024 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424904;
	bh=ufHKGV4URGIBzjbpyv3RC4dVxUcwO4oXGVwO1pcP0nE=;
	h=Subject:From:Date:To:Cc:From;
	b=aEz40HkhWOogoLW4cxGYFXQgplX+fEc2Yr8+apTBV6JnKCqiNrMEMvT6W9vd0Gj/+
	 6sy/ZqB2krJV8awYIeNTs2iTtxhHHtujT3TxiOUFwB1aVuLvaxLeftl6AE988k0jQv
	 aSEcksF1MC58L+W6SBcguLJn3loFl79tcgUfeqgd9LL9hjrp7TWisI6JfivBNiOiPq
	 oOyS6BQQkLjcvUAYr7mYH3RO7C+9uD+inwlqI+LzqhzCXf/z94pkPx9IVRrVE+gXz0
	 JO51FjBkNNciYriLgxeVOkJXxJt0fyrLrGZBguVbmGtWeLbegRLlXGN3hSqH3KD9QZ
	 4/bS4v/pZqMYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 377023809A80;
	Tue, 12 Nov 2024 15:21:55 +0000 (UTC)
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
 <173142491368.562452.8847884321731357579.git-patchwork-summary@kernel.org>
Date: Tue, 12 Nov 2024 15:21:53 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Allwinner fixes for 6.12
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=907013
  Lore link: https://lore.kernel.org/r/ZyuRCalH2vhHXm0Q@wens.tw


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


