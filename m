Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AE2433A5
	for <soc@lists.linux.dev>; Sun, 20 Jul 2025 03:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752981096; cv=none; b=MFFbXQPCW2Ha54Jp4h6KJ/cY+jyIUgeH23R2bJmeHw02E7DLX/JpJJBxkqy8qreLKBxh7QZXJWEcpdHkXHyA0NEdhwP7jNLXWKECsHQFz2oAXC4lcqigt7pxIwfXXjYKZ9BDf+zsZuATWeC8guIO7sg9UGnGjLZupETztjGCw18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752981096; c=relaxed/simple;
	bh=hy6TO0tqYA/iD0UESxM5WRK3VTok12PaLVtblUPe6HI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uJJjjYqSrIKGnkswORGF6aIRdNOFuSyq5s+ZGuuFLj9OB9bkgVd29LjHfSZDUgFgq7hOXTyxz14yRxBYQg9xoen1q6D9rXgHD0sOOC4paUkEsSbrDTwv3U3x5tjpWd7m/4tvo6GHgnuK27Z+y9a4VrSW5S7Zf0m8Rn0ZqM1qkGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQzFEnEL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQzFEnEL"
Received: by smtp.kernel.org (Postfix)
	id 571C9C4CEF5; Sun, 20 Jul 2025 03:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C38C4CEF4;
	Sun, 20 Jul 2025 03:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752981096;
	bh=hy6TO0tqYA/iD0UESxM5WRK3VTok12PaLVtblUPe6HI=;
	h=From:To:Cc:Subject:Date:From;
	b=kQzFEnELpngKG8C++Y7Zk0MLDE4QHNF9lw3+74sPSXsdz+6W7Cq2IFOv0js7bl5B/
	 q6XWklc30P5gcz+5PlRc5lEWYyGPBK3+fERq2VW5McAgIEjlcpqhJwcztKapKMiWy9
	 iIlqp6niZGHAmHWT65QmFw2rvdkX5AhKHC+c5YgRtIy2IrUDJAb/nNOFQgLsiATbuR
	 ydU3rfVoc+gbEX/Uhxv5o8Mv0sEduDwIP54u3rOkP/MmW1SzzoBjrVFNlIl1vn8D+K
	 7BzS7zf/3oRuG+iQmFRKNwAfB8H0DRMTstsOw0GbwUj/uvnye1p68IpYs+CdiXx9AI
	 TnLDYtuAFvhZA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.17
Date: Sat, 19 Jul 2025 22:11:34 -0500
Message-ID: <20250720031134.286063-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.17

for you to fetch changes up to c5d02bbaa217b2454ba1ce7528113aa2ecf14f3c:

  arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+ (2025-06-11 10:46:23 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.17

Enable camera and video clock controllers for SM8450, SM8550, and SM8650
platforms.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
