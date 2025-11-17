Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B618320CD3
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 22:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763418068; cv=none; b=ZIDz2sgf9IbNEGzJNlR2ziI4w9iU9Z1p4isBdWl0WAEUju12sxFV+m0QsgE5cstqswZBTxS4ErxKXs00rM8AADHdNuRkUlfULIbW9vG7qDATbBnyj/K/GI5/aIEz02TiyFzuBZQ51PxEL68sdZ5BF6VbJoNqiScvZVR7eTe1A1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763418068; c=relaxed/simple;
	bh=5PLY7lTBM2cLkVneE0Bibcvo9tX7kTwU65s+XUnh/QI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DHkA5WNN6BEnlod/JKnFADF05/ayuJBMybf0V8uDnZcry28FR8SyhQuLhhg1DIorgZWxt+FqL9LINapEHM769/hwkBirdwKva5z97soOx7NstQcZldGXMq9THlcuGkdB2smUsSlqgOdJ8QXNLPG/S0MBiv7lPmoM4i+nmfL+/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BH3tu4n7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BH3tu4n7"
Received: by smtp.kernel.org (Postfix)
	id 6D722C19425; Mon, 17 Nov 2025 22:21:04 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2DE8C2BC87;
	Mon, 17 Nov 2025 22:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2DE8C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=L5kqb0tozN6alabYLEOS+/qQznlRRLUS1mLMC1yn0Ig=; b=BH3tu4n79ih1+Gi+0qBXg02/lW
	qBj405fuXZ0OTKQKDj6gqGtuJovOlShYMrPqMQGwBc157mrWrrrs8cneys/gAUYEMxvOtcD20Tc5T
	oNQ43u6CCUym09z7yqz9sIo/nfxMDcXRbRRHt/00tAeS0VaShIcv52tRSPzzmB8DXCnU3aTJMRyhh
	BQcYDfriOqO65RR4ToTtwbu6yFd/iTRBS1BQyeZAJ/20Nu7cXqzA5cGCPLq3QceWj6FrtA5hPsGN/
	cywksqR+oUOYyPUYj03Zlsf9Qm884bVQZLcJBPqdBX4qZ70RjpCLWDsmA9Q4AlPRXl9J6et7VRtqK
	g0TchdGQ==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7ae-0001Py-E2; Mon, 17 Nov 2025 23:20:52 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.19 #1
Date: Mon, 17 Nov 2025 23:20:51 +0100
Message-ID: <2002416.CQOukoFCf9@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-drivers1

for you to fetch changes up to 048213a38e7ac1591f725e370c152cc80dd84105:

  soc: rockchip: grf: Add select correct PWM implementation on RK3368 (2025-11-17 22:34:12 +0100)

----------------------------------------------------------------
Some additional sane defaults for the oldish rk3368 soc.

----------------------------------------------------------------
Heiko Stuebner (1):
      soc: rockchip: grf: Add select correct PWM implementation on RK3368

WeiHao Li (1):
      soc: rockchip: grf: Set pwm2/xin32k pad default to xin32k for rk3368

 drivers/soc/rockchip/grf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)



