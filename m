Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93431D366
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908024; cv=none; b=bIaTRlaD565SYyFAer6StLdoSJeQHDAyOhXv5Wzla9t7/opwc+QwSH7JAHCMw2InyYtroAgdFRGK3oar1EYd2OJHJRlasVI2flLZkCXImGimlCL5MVnd1OK7SuNjaQh0hhA9Zpzkwjm1xrUmqo9jQH4X6luwvTiXErlmhpokQbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908024; c=relaxed/simple;
	bh=748kh0FainH3OLOBiond62jRSgjjoQL1Ejt+d9CgPLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bByFY2LrJXIXvJoHHnK8eI0xqVf4v8sstmluIETktcXEra6+IAcb/8zVTJwpUc+THApXyQ5zZIJyKPgROv3wf6dgaj8PW3Lpdqdhklsj+nC1T5PFjIpAc2ASq8+V18G6Z0/Lj03AblFUUU7pirJDBFDczgaQXtsqPcRSCdu1yuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5n3i8kS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5n3i8kS"
Received: by smtp.kernel.org (Postfix)
	id 4B65BC19422; Tue, 16 Dec 2025 18:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14EF9C4CEF1;
	Tue, 16 Dec 2025 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908024;
	bh=748kh0FainH3OLOBiond62jRSgjjoQL1Ejt+d9CgPLU=;
	h=From:To:Cc:Subject:Date:From;
	b=K5n3i8kS7LpDLhjkx+ywQZJCPGYrgxknj1jhWtrWuaSKGO0MhT4TXZ1G3/61XB84X
	 j2IVNIchKzDOp/tWhaWr+kCJ2yW448iZLdiqgfETLNjDFD8zr3BXzuoO1QLC2xGm7j
	 TXOdewX47vrnDjtePQLekkzI85FSG1PZhiSdeROPlU20o7sJYfvk6p+ECMB8RrHFDt
	 XqTw7Kxm6PK2q4usf2zL2DzD/CXMAWqOGveL9wbqMXkp7Yj6kcYDFnPcMDBI7QrQhU
	 Fkl0iOOANakXxfaAQlNgs5H/ob4pyiU1GwkTypqteqifdGSFpjrKq50sTSV4MzrVSe
	 ubo6oUMtf1Iyg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Chanho Min <chanho.min@lge.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: lg: Use recommended simple-bus node name
Date: Tue, 16 Dec 2025 11:59:52 -0600
Message-ID: <20251216175951.2791921-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update LG LG131x 'amba' bus node name to 'amba-bus' following the
standard names for simple-bus nodes. Generally, node names and paths
aren't considered ABI, so it is safe to change them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly.

 arch/arm64/boot/dts/lg/lg131x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/lg/lg131x.dtsi b/arch/arm64/boot/dts/lg/lg131x.dtsi
index 4cb1e4510897..90988770cb5c 100644
--- a/arch/arm64/boot/dts/lg/lg131x.dtsi
+++ b/arch/arm64/boot/dts/lg/lg131x.dtsi
@@ -102,7 +102,7 @@ clk_bus: clk_bus {
 		clock-output-names = "BUSCLK";
 	};
 
-	amba {
+	amba-bus {
 		#address-cells = <2>;
 		#size-cells = <1>;
 
-- 
2.51.0

