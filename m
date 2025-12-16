Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE48338591
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 20:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765916881; cv=none; b=DIXbtw0yMsEVKWlWq3s9GBio10OoipJkcfQoNAPOZqT7/WwlwdHm/k6sDNLLma7s+hdx6YXHEkTT/Rwpis3uUPht7/vkIeIYUp5h44OofHuPoGttQeeyEWMd7z6bOPyJezrWs6KnxrpLn2XilDC8haQS2RM2p5ya8SVNIrspGIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765916881; c=relaxed/simple;
	bh=E/c7FmwxiuzYUMlnCpvlOk0eEAqzmcITorONITnLcaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDEsVChSBrVolsMS6DfxpqP4KYaqambLafAMf438mKjH3qcQvk4H81nTrw85cg9204AApN7yXkgefq8dcUTKK0X3RwZCHJpmdhw0/SUpjUYJDyMsrsRq6+6a23W5/yycfqXWa64WtaAOCQkHyCYVnvE2adqlPoV3AX7Ghw9seKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4CIRJy0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4CIRJy0"
Received: by smtp.kernel.org (Postfix)
	id 0DBF1C4CEF1; Tue, 16 Dec 2025 20:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB83C113D0;
	Tue, 16 Dec 2025 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765916881;
	bh=E/c7FmwxiuzYUMlnCpvlOk0eEAqzmcITorONITnLcaU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M4CIRJy0rKk4pU1XZgnDX5bX8iuv9W3OvabTvQ+Alqj7MQZ/S4u5Rb88JZ1QZkmTU
	 XZQIjeHFDDUIyINfK5ORO+T8QMKGu1V22rAwVpKz9Lbhl3PeGnZdQz4rZe5IZ7FfpR
	 XGQBmzjYz3qAtY2NRx/n+3ZTD2wEFtqQ2all3prXROBs+monJ/01F90viSOC+IfR7/
	 E/JAfdW+nXp1MXABKA6sUglVoJwywJfdyAMqLHCuiY89uRTw7867Bua6hkuIa/lz9b
	 KmB07nZysGVn+Gp3WppHOZcEAMRBhsXwXC+OtmsT1G4eyl+EAJyRTAN9PQigLij+83
	 MdfOPVl4Fqjbw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 16 Dec 2025 14:27:51 -0600
Subject: [PATCH 4/4] arm64: dts: apm: Drop "dma" device_type
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-dt-apm-v1-4-0bf2bf8b982c@kernel.org>
References: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
In-Reply-To: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
To: soc@kernel.org, Khuong Dinh <khuong@os.amperecomputing.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

The only supported cases of otherwise deprecated for FDT "device_type"
property are memory, cpu, and pci. "dma" is not valid, so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 3bb59704fcb2..4c4938faffb1 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -1083,7 +1083,6 @@ rng: rng@10520000 {
 
 		dma: dma@1f270000 {
 			compatible = "apm,xgene-storm-dma";
-			device_type = "dma";
 			reg = <0x0 0x1f270000 0x0 0x10000>,
 			      <0x0 0x1f200000 0x0 0x10000>,
 			      <0x0 0x1b000000 0x0 0x400000>,

-- 
2.51.0

