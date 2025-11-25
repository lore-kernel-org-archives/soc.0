Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFDA33EC
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085842; cv=none; b=eaYHsop98NyFJ85evPycp5Zx1MLR9t9B/cYcXTE2qmU1qweDrw8u2WxIzF6DRQCf0zLUw45gbLlouUMOJvVAuNpa6SeqMvcVMTwW7kcSU6C6qQefDx7cK+BulNtQi9OSsjd+JBS9V9YLxvJubzB6ueE1s54ikssMWTczDUBohCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085842; c=relaxed/simple;
	bh=wcYyJ8cEsOqdn85Farc5FsFhoWsUQNv30FBBuC9AS/M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Xl4rStlsHIFX/GmHhEL5lBMUWoOXXkpqk1grYUEPKQ47w25OWeJ0i/wk29Dnr1fS0OjMLb/Y193h3PnVme/cm5DvBYfRzeBDQorzSI6tQWk2cGwek1EgPC7u6YLwqQ92hn+wQpfhh8J1pQu4J3koou2KIvu4gzIYodSD7eQbzGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQXn1BV/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQXn1BV/"
Received: by smtp.kernel.org (Postfix)
	id 39717C19421; Tue, 25 Nov 2025 15:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2370BC4CEF1
	for <soc@kernel.org>; Tue, 25 Nov 2025 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764085842;
	bh=wcYyJ8cEsOqdn85Farc5FsFhoWsUQNv30FBBuC9AS/M=;
	h=Subject:From:Date:To:Cc:From;
	b=sQXn1BV/9AqB7Ry9RzgQWui6jGkqjCTcIJH3b/4lSTtqXY093Ek0aUOYK6e50D7io
	 Vn/Y+VvYcWD+BvENVDGX+kWcl7vLJD0xeyptj8YQmWxg9Me1A404jZw4rGkdNCJmCe
	 pWBIfiGIuYNXcweXzrxx3VOhj2lKgYbXv9Jq15y4UnQ7RvQXhVtTxIONyAmNBghFk6
	 NSWO2zY9v1XUoqHJBHyLIUL4b5tOrkNaIokAPZuy2fJ/1GI0mltnQOhv1RaYjhH1um
	 K5GRpXgZHIOIZk09Cb9kc0qZ92wNEbsDzTZ6Ae8zseUHhBBBh4Hejoa27s+R7gKNeF
	 bj5akMyKJOVdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1F8A380A944;
	Tue, 25 Nov 2025 15:50:05 +0000 (UTC)
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
 <176408580416.815192.8646897730639614764.git-patchwork-summary@kernel.org>
Date: Tue, 25 Nov 2025 15:50:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Allwinner fixes for 6.18
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1027380
  Lore link: https://lore.kernel.org/r/aSW6QyCvqM_DChbG@wens.tw


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


