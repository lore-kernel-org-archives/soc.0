Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B895940DFA7
	for <soc@lists.linux.dev>; Tue,  5 May 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973774; cv=none; b=DQR9Kftv/a2erHI7fARLhMJNnBGbGnDxY7otgPUdB4z3Gk0+ghl7zMCb97/080FGAfyoGocv+5Ku3ULG/q4PGVuMQYgPejn3iSn1vp2GWDy5+Vzj/vKcebeo3qEmr+hONufop9k/A1BYSchLeE+Qay+t3+vC1INPvbTjsiovjX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973774; c=relaxed/simple;
	bh=snZU2O2/tFVxCxfE62Jr46UfgTfqqKdl8nNtcogCPMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T19YaypjVqkB955v+ppCOXN/WKvnvaVh77ly908E1ykkhZDuyHuvORm9XZxFDXJnB4sKR0zQwjP34gL8Cj+CnsMG26ucmLYy2KyIyzPrzwjn9kOHSohYCQhvp83lfqtVEgh4tPPNQcblWrWXjyLF+O+RGG8fWuApfmvvI7qZQA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3MNQnbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3MNQnbZ"
Received: by smtp.kernel.org (Postfix)
	id 693BDC2BCC7; Tue,  5 May 2026 09:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739F2C2BCB4;
	Tue,  5 May 2026 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973774;
	bh=snZU2O2/tFVxCxfE62Jr46UfgTfqqKdl8nNtcogCPMs=;
	h=From:Date:Subject:To:Cc:From;
	b=V3MNQnbZ7QMLO61GDboeAEYlPjXoIOj8gbFxVnLLHxQ5z2zGnEzp21oFZfFmK9p7D
	 aApklVgmg2wIl6jWlM0gI5pK49gIbaHPMYksJKtJyHpY4xlJCDvZAzIl06wTO6Xukt
	 wZgRgWUzSoMccfM9/kWDZ72rboDx7hQ7GxSzIdt8Ut8E1L9iCw0oeqly2NU7hLBHCU
	 QYTaI4Yx2S6GS+w5Lyznp2j8xvye2zJrDumkpSJ3xKMsNMzjoxltli/WVmYtyKdfsy
	 cqwMlxvsjvv9sqiu1dBajWNuOU2C5Hp74Do0UHE88gx38kES0Ng2dASV8zqpk42ZX9
	 29zh7FHVtns9w==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 05 May 2026 11:36:07 +0200
Subject: [PATCH] ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-ixp4xx-dts-v1-1-02f4a92a9697@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw5AMBRG4a3IHWtSjUfYihgUP64B0os0EXtXD
 L/BORcJHEOoii5yOFl4XQKSOKJusssIxX0wGW1ynelMsd9S71W/i7KJaaFLWFuAQrA5DOy/Wd3
 8lqOd0e3vge77ASqGSd5uAAAA
X-Change-ID: 20260505-ixp4xx-dts-a12be09eaa7e
To: soc@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2

From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>

Convert remaining legacy integer GPIO specifiers to phandle-based
descriptors in intel-ixp42x-actiontec-mi424wr.dtsi.

All other GPIOs in this file already use &gpio0/&gpio1. These are the
last remaining legacy users in the IXP4xx DTS files.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Link: https://lore.kernel.org/20260428191029.809462-1-mohamedaymanworkspace@gmail.com
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
index 9b54e3c01a34..3043ae7232dd 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
@@ -195,19 +195,19 @@ gpio1: gpio@1,0 {
 
 				pci-reset-hog {
 					gpio-hog;
-					gpios = <7 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
 					output-high;
 					line-name = "PCI reset";
 				};
 				pstn-relay-hog-1 {
 					gpio-hog;
-					gpios = <11 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
 					output-low;
 					line-name = "PSTN relay control 1";
 				};
 				pstn-relay-hog-2 {
 					gpio-hog;
-					gpios = <12 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
 					output-low;
 					line-name = "PSTN relay control 2";
 				};

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260505-ixp4xx-dts-a12be09eaa7e

Best regards,
--  
Linus Walleij <linusw@kernel.org>

