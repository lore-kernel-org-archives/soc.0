Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87097214210
	for <soc@lists.linux.dev>; Thu, 11 Dec 2025 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765458306; cv=none; b=V/MWuP1tDUqPQHwa4QCC1XNccIUOWm3xFvB3/VgQLPpVWLBeavwDSWie5TFsQXCLghHvWmGo6GHToFJw1PXyF/ZD/tckzRtKQPwHNZyi70dKgjc+8FUzLvb1tOKB4FqZkjZbefM0JyPzrVTzSehnLJZ6mkA28AAd+NIHTYP2dx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765458306; c=relaxed/simple;
	bh=TM4pB4B99UeY51FOmKqHe9qaAswn9fi2oFJ4ttsgNko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cVgWzcy6xV0JlXNZv2PCyYOCra3ETOtzN22CvaXxaQRzJ+N+YdHzVmMmgltewV4gSUA7nKngDMDLRmoMhhZp4Xoq73IKcTIXyzDdIekR1eT5Pi2oYnQHRJ83QABC3H6aNiigTH3YOWG0cFCpgZoH3iynWRYXMLuQqZ5HeghDqj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esPDVsMy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esPDVsMy"
Received: by smtp.kernel.org (Postfix)
	id 1C062C116B1; Thu, 11 Dec 2025 13:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D325C4CEF7;
	Thu, 11 Dec 2025 13:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765458304;
	bh=TM4pB4B99UeY51FOmKqHe9qaAswn9fi2oFJ4ttsgNko=;
	h=From:Date:Subject:To:Cc:From;
	b=esPDVsMyszqmorGhvl0xDE3fZGdI2t1u3n41KhR+1sh6UO53kygqKyPY/sEd/7szU
	 dja9fSKZXVxU/PtU5yMRel4WN2bnWjHHC3uaEMqYacppbUNtY9keb9uqR1RtiNCpIA
	 zaorg6abqsIfztldpWpyaodqiXxsiFBmqwgVh/k94nOeb0BDGrnUqOrM3gU0PeI1sI
	 ojp10zb+ocJOfSQ0NSOfJWWTDZlMB5UAXes+iPWsMAoYHeVlSAjzzMi6ckO6JkZ2i1
	 TWSM4pMVkPWJhA2og9y1qD9r4WlxPFptr0nDxxOc/lLT/6rpKw8wvnHHQQPHwtyHA+
	 iFZDoXaMXaTuA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Dec 2025 14:05:01 +0100
Subject: [PATCH] ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-ixp4xx-actiontec-dts-fix-v1-1-97af8e79d474@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBBFryKzbiDNiLpKtBCdajYlKiGEd29o+
 T7vvxcyJaYMi3oh0cOZ70tAdwr86a6DkIMwmN6M2miNXKOtFZ0vYhbyGErGnSuSt24ydt7tMIL
 cYyKZ//S6tfYB8jrkRmoAAAA=
X-Change-ID: 20251211-ixp4xx-actiontec-dts-fix-ec4a7249f435
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The KS8995 switch was unconditionally wired to EthC (eth1)
on both MI424WR variants, this is wrong: the D revision has
the switch connected to EthB (eth0) so pull this assingment
out of the generic MI424WR DTSI file and make it a property
of the respective variants instead.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
SoC maintainers: please apply this patch directly for fixes.
---
 .../boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts  | 11 +++++++++++
 .../boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts   | 11 +++++++++++
 .../boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi    |  1 -
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts
index 413b9255f9e3..19a8d7b07758 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts
@@ -12,6 +12,17 @@ / {
 	model = "Actiontec MI424WR rev A/C";
 	compatible = "actiontec,mi424wr-ac", "intel,ixp42x";
 
+	/* Connect the switch to EthC */
+	spi {
+		ethernet-switch@0 {
+			ethernet-ports {
+				ethernet-port@4 {
+					ethernet = <&ethc>;
+				};
+			};
+		};
+	};
+
 	soc {
 		/* EthB used for WAN */
 		ethernet@c8009000 {
diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts
index 3619c6411a5c..244c6ea0973f 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts
@@ -12,6 +12,17 @@ / {
 	model = "Actiontec MI424WR rev D";
 	compatible = "actiontec,mi424wr-d", "intel,ixp42x";
 
+	/* Connect the switch to EthB */
+	spi {
+		ethernet-switch@0 {
+			ethernet-ports {
+				ethernet-port@4 {
+					ethernet = <&ethb>;
+				};
+			};
+		};
+	};
+
 	soc {
 		/* EthB used for LAN */
 		ethernet@c8009000 {
diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
index 76fd97c5beb6..9b54e3c01a34 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
@@ -152,7 +152,6 @@ ethernet-port@3 {
 				};
 				ethernet-port@4 {
 					reg = <4>;
-					ethernet = <&ethc>;
 					phy-mode = "mii";
 					fixed-link {
 						speed = <100>;

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251211-ixp4xx-actiontec-dts-fix-ec4a7249f435

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

