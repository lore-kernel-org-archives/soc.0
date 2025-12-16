Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C806129BDBF
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765916874; cv=none; b=cT9K+7hN51oF4JUzw/38fbj3Cvh7wSOntoRuRKld90UmixY18rAZe9LBG+KmSG98lgXeD1nkl7Z1eYYnM5UP9PWQp1PzFaxN6bFSk/oiPpl5QP/FehziTwl02PM12504L8aWd5TCzp0oYSjXiUXB7imdZbbsbnek44l8Yn0k8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765916874; c=relaxed/simple;
	bh=+1SqpF/XGRA+dpb2sLKshDR1VeFj8O2Uym6zaIH0yME=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cx9JdEZxDmXROqlc4g0cJ7h1BUOjKUKizXWVeRkQX+SyBHCgxcCSiEiDSqO7yiN5tMw0h1Z+Nh5FSOCf2iTMMJCyL9Yg5dM4ekIkgCyXzXipv4BdiNl5S2eOdAG4BohNRM4+yCJWx4r4xTZ47/1ApyJoYJG/iZLNnK4TfVuPYow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBaoWK8Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBaoWK8Q"
Received: by smtp.kernel.org (Postfix)
	id 9262DC4CEFB; Tue, 16 Dec 2025 20:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B38EC4CEF1;
	Tue, 16 Dec 2025 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765916874;
	bh=+1SqpF/XGRA+dpb2sLKshDR1VeFj8O2Uym6zaIH0yME=;
	h=From:Subject:Date:To:Cc:From;
	b=jBaoWK8QQYU8T6RjUbs6FM/rRVc6ivlyDZ0dBugUIsy+6FA3dTZ+c2AH3ASfUKa9O
	 6SRwm7N10R1e1AunhUU6beT4QN7xhUqr0VA0f8J8QEnxrm4NU1irJLlh3536/Sbqh/
	 rSmERi+HQBH+XmW9s7X3ifI2dkrKpkftJ8QvN7TAkp1jmi9ldTr0cEnGjeChXI4dx2
	 Fsphpy3lRe4fuwnA3Tc0q0LqeNIuhZBYV/9f0KjglOiz1iS9XKZwMPGNt5SPgFMNiW
	 fKVraYDEZ8Mz4pmTXMD0bQ95LdYuj17ogEkVMLd+2sJ6jtp+w7hF3nSWjJ5PwcBr7M
	 kQUSAamCvoOvg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/4] arm64: dts: apm: Fix remaining warnings
Date: Tue, 16 Dec 2025 14:27:47 -0600
Message-Id: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPAQWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mz3ZQS3cSCXF1zCwuTNINUS1PDlBQloOKCotS0zAqwQdGxtbUAb7l
 iiVgAAAA=
X-Change-ID: 20251216-dt-apm-7884f0e951dd
To: soc@kernel.org, Khuong Dinh <khuong@os.amperecomputing.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

This series (along with separately sent binding changes) fixes the 
remaining DT warnings for APM platforms with the exception the 
non-standard use of the "phy-handle" property having 2 phys. I'm not 
sure what is the right fix there. It looks like the same phy is defined 
twice on different MDIO buses though the "apm,xgene-mdio-rgmii" MDIO 
registers overlap with the "apm,xgene-enet" registers which also defines 
a MDIO bus...

SoC maintainers, please take this series directly.

Rob

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (4):
      arm64: dts: apm/shadowcat: More clock clean-ups
      arm64: dts: apm: Use recommended i2c node names
      arm64: dts: apm: Add "reg" to "syscon-reboot" and "syscon-poweroff"
      arm64: dts: apm: Drop "dma" device_type

 arch/arm64/boot/dts/apm/apm-merlin.dts     |  1 +
 arch/arm64/boot/dts/apm/apm-mustang.dts    |  1 +
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 20 ++++++++++----------
 arch/arm64/boot/dts/apm/apm-storm.dtsi     |  4 ++--
 4 files changed, 14 insertions(+), 12 deletions(-)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251216-dt-apm-7884f0e951dd

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

