Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552805;
	b=g8riT/iJDV5udAOd6VXniSyX6lOaJ5eR+ZY6jqSUrc0mudu3D8t9h0S2h8nWeMfUQ+Bc
	 oLBD2gLZyfWjcM9wbDKYowQZCHSpiMq/30/72NW+KyoArpBDGkl3JR6AQcF5l/yvLCPE/
	 cB2IO/By0dfZxx55sgmAQHi72IHAULI/0dWlLdTCjBq5xvWUd8U/7kmNQkxI4AEtjFer/
	 2KxwHngg+YqXKFzHaYQlCyK+IVRI8vMpGDEC7Vl/+9J60BNzY6Pw7nerbnJY0QUvTcT7t
	 eTYROVIF7YdSeNyFr/sKsaVRQ44XkSJj1o5NeTysSOcUuR5jynwKUuO2cd9mNqW5woA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552805;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 To:Cc;
	bh=fF+XGMCNdtUiSmFHDg7Us2Pd1BUVibSW3F9A1CND9sY=;
	b=PgPI4bLYf8lilapQ2mW+ZByzqGreDlD0m7njc2N96mucFr1rnqiWqrM+FbsjQTiNRWNc
	 axBCGqlpI9vGaspfeG7V8n1+SAnKur2MlZoSApJQwg3Q7ZNfLGiSUEcU64zOGV9B+EKRT
	 qhP9GIBmBdBdSyvVgJtOyWyjypud4xR2aCJYDS30LHsymN7ywLEuIksOOf7NLlUheA0dP
	 794epZ4794A/PY3MCqy8DQaAYFP29DOLk48xCmZpn0vU+/w4K6LkRCYJPKVWWWODcvarC
	 JomRgW+S7pUK/COIjKHgC8njJlzX6Z+ShBn4X2JyoDHiVscKtPBaDRhhQe9XdIJe8Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lKAZHR2n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4BB606A31E
	for <soc@lists.linux.dev>; Tue, 24 Nov 2026 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lKAZHR2n
Received: by smtp.kernel.org (Postfix)
	id 7D9B01F000CF; Tue, 24 Nov 2026 20:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A901F000C6
	for <soc@kernel.org>; Tue, 24 Nov 2026 20:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795552805;
	bh=fF+XGMCNdtUiSmFHDg7Us2Pd1BUVibSW3F9A1CND9sY=;
	h=Subject:From:Date:To:Cc;
	b=lKAZHR2n0qoNWI/oBZ9/t5nV7NWeq6fc3aenT3bRo83ws9ADBOhJJi6s4RinOoyXk
	 pRgtZAwL2CAmgOV0Kf6QieseEZFPij0F0l9wJA9o3+gRDZpC6t25yNlyCBE1CoQlIj
	 hJV8kX84GCskX6o6Ra4JKkd2MeGj1V9uFqj2roC56Av8W1IPANvycU6t7GeKle+3Ru
	 jcvLLHx+WXtNOnl4R2dGIQFR0oVxEW5cd46MVGfs9MuHBQT12UGL8LefIf5wwRJ69W
	 h1vwAs2b9QF47uYPNogri3FG18uOD0n9Ok9tmWhvUV7YFscjMBSCUpPgwDoomJXugO
	 ZCwwLGKg3s0WA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3C9483808209;
	Tue, 24 Nov 2026 20:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179555280389.41195.9781719097449194243.git-patchwork-summary@kernel.org>
Date: Tue, 24 Nov 2026 20:40:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Reset controller fixes for v7.4
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1219825/
  Lore link: https://lore.kernel.org/r/20261123161633.2530037-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] STM32 DT fixes for v7.4 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1221063/
  Lore link: https://lore.kernel.org/r/7acd50d1-fe84-4c30-bdd5-11f67d7fdb1c@foss.st.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


