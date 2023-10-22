Return-Path: <jszhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5229CDB474
	for <soc@archiver.kernel.org>; Sun, 22 Oct 2023 15:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81A2DC433C9; Sun, 22 Oct 2023 15:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EE4C433C8;
	Sun, 22 Oct 2023 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697990029;
	bh=OHIHSJz2egyZVm9tXlqMmwRR01/RrOpSIeoHXrWG/FU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Si8mMiwl5GJYA7QK4XihFid4XOTJvwoyq9d1X+V7RlG6orxPX6sFGnKTa0EtHqc9o
	 suFL8RbIFO+tiNNpM80EqEmvK31pvfmxEnQdeUbbODYVxfSTyNzexf4MJv4jdTxMp0
	 bbAA2mrmKNLgSkqhSYEAmAb2UvXZIc2MRhMMcjLVl+A1fyMVfGv/eOpvVKP289f1oF
	 Kxz6COpeoC0iUrBckdjdItE22Q9JHP87YkFUhRNpUgkb20pz9Q71oxPLLEVzZniZsT
	 BuA5qoADqV1ENx+OySnIg0LrsGL2jETAIvvcoz5Fa/99eKLqsAnvT4UtRI2GWxqR2Z
	 D/WJF2viqSurQ==
From: Jisheng Zhang <jszhang@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH] riscv: dts: thead: convert isa detection to new properties
Date: Sun, 22 Oct 2023 23:41:35 +0800
Message-Id: <20231022154135.3746-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Convert the th1520 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Hi Arnd,

This is the only one thead patch for v6.7, could you please apply it
directly?

Thanks in advance

 arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ce708183b6f6..723f65487246 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -20,6 +20,9 @@ c910_0: cpu@0 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -41,6 +44,9 @@ c910_1: cpu@1 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -62,6 +68,9 @@ c910_2: cpu@2 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -83,6 +92,9 @@ c910_3: cpu@3 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
-- 
2.40.0

