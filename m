Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9F433EAFF
	for <soc@lists.linux.dev>; Mon,  5 Jan 2026 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767634824; cv=none; b=gw3hkeNa5XlWks6OmxlUFrq8DxhCQD+BEd/8C82sktx2W7wdcBNKAwiN+HMj/htkMe/ml0BX5Z2O7k4RwfUybl88ya7lf3QmzOYOv0b3/jQbcDduhqTfxmll+zK1GGh7tuH30GduGk6gXSuydMUFcfQ2rudV/l1g8KjEp61ZQcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767634824; c=relaxed/simple;
	bh=2uciPgKZTfAN+kHFN9+AWCUpup3++wuAGSvEJP++CVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M3+eYn4n05Zi7K+7S+pJ4mwKWwy4UMVLQy3x2VHefT/v/nZqEEGyn7WB+ml7ZEYYtB5Ih5bV2k9fDGnWrajBxpT1oS4kpFvFA7sLc3Pyrs3xxlgepQqwVesLF03SG8dzW6T3J8lJ4n4DTJ7ze3KWdBOZqQqTAeSwF0LiRS46XKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxdJfile; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxdJfile"
Received: by smtp.kernel.org (Postfix)
	id 64F68C19424; Mon,  5 Jan 2026 17:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A218C19422;
	Mon,  5 Jan 2026 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767634824;
	bh=2uciPgKZTfAN+kHFN9+AWCUpup3++wuAGSvEJP++CVU=;
	h=From:To:Cc:Subject:Date:From;
	b=rxdJfilehYXTF2CXiJ68ugDkk0WeJK8N06jer4golHbxFQ+Kl18nLFOWgjY5ZxIlI
	 oyRraD2Lsu8pxVtW+nvLafUTgCQyRt13ut4qqNj3YWwW6rYG0uA1/styq2XtGTQFIS
	 TfiK/H8S6kr6tb1PSBR5imilYtm3n6zwFeqE5GCyqOheL1N0QWDjzYgvVx2MJW7Rwy
	 TcmkjPzAsWLiBQUHsH+KmHpxQzWIO4cZ20HrS0bpbUug8/Crxx5nVwkJoq9jp/7pWN
	 QrUoyINpByyFZPZWAFJYgv1oopnCyXHTFNRIpvtd2vwVVT1AEGSkiVpuZGcIrk5PCY
	 xPUY/US74WR4A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Wei Xu <xuwei5@hisilicon.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: hisilicon: hikey960: Drop "snps,gctl-reset-quirk" and "snps,tx_de_emphasis*" properties
Date: Mon,  5 Jan 2026 11:40:02 -0600
Message-ID: <20260105174002.2997615-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"snps,tx_de_emphasis" is supposed to be a u8, not a u32. Since it is big
endian, 0 will be read rather than 1. The DWC3 Linux driver simply ORs
the value if "snps,tx_de_emphasis_quirk" is set, so the 2 properties
have no effect. (The driver doesn't clear the field either which is
another problem).

"snps,gctl-reset-quirk" is not documented nor used in the driver, so
drop it as well.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 3f13a960f34e..ed84ab92fb19 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -675,10 +675,7 @@ &dwc3 { /* USB */
 	snps,lfps_filter_quirk;
 	snps,dis_u2_susphy_quirk;
 	snps,dis_u3_susphy_quirk;
-	snps,tx_de_emphasis_quirk;
-	snps,tx_de_emphasis = <1>;
 	snps,dis_enblslpm_quirk;
-	snps,gctl-reset-quirk;
 	usb-role-switch;
 	role-switch-default-mode = "host";
 	port {
-- 
2.51.0

