Return-Path: <SRS0=AqXq=PS=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F89CC52D7C
	for <soc@archiver.kernel.org>; Mon, 19 Aug 2024 03:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53988C4AF0C; Mon, 19 Aug 2024 03:56:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78533C4AF52;
	Mon, 19 Aug 2024 03:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78533C4AF52
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-201f2b7fe0dso23908035ad.1;
        Sun, 18 Aug 2024 20:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724039814; x=1724644614; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD34vQIo66dqv4PnmDSmrEVQgpwvd9jgM7mrU60RqYs=;
        b=JNdxQQlGM9JI/6Ril1sfD/gI27BtC3zwM/Kptqd30HWzLgQ1iEgkuTyV7t66EbhXBU
         gg9KvxXyQoGHi/RiTwQMJkimMPBJkEKyPI7PA89dRyAd/oanh6PGo2T2B0G3Fz4JAK1c
         CwLdX4E/J32CMCR15DEoDrMHV7j+VZ8HjYGleJxikEfB4fMslKnC4Hdgh909Th6gdauF
         MDb9EBdpbqXXb0BEjsG8MMlGjL0LN82Srm3RAxz0pHw99DyOjUuOhXMvM9qC9Dd9Mwt/
         Fc1PIaLQmudvXwVkN5P0g8VUEspcVpJyBqzkhCnHKuMpeUtp9WToDuWw3ML+BJD9SSsw
         rToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724039814; x=1724644614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oD34vQIo66dqv4PnmDSmrEVQgpwvd9jgM7mrU60RqYs=;
        b=tAviJxul3yNvrCC5IniPklueLEPykNeTytYaPARN1uoKh7KGOASJsaMHFb8ifG5z8k
         EuELBR9Zroot3jJwbBD9sHauStYB66kOYt4PAiAf5xeHGOKNivP57FSRO6Y/rTioPXM0
         gaFY0nINDh7YdSRj6EXChNS4Rwtjc+a0B8g9UzLNjHnem1wPiGS6cVsQBW1zE0Uz1VuH
         zI99TcPWoI5rcXDx/UTm65M2beOpy/n7++8skS6XwvR/QA+04TNXmKwXPzMni3RpULf9
         EC/Gh6an9abE4/8C/9Dq+7cF7bWRUnxi3qfcepexighl3U72BkHHBRONNGwx0dnfzM27
         ysnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPPH0ORBe1fEvBzXPbsWZdE9XsxOr7bDz/LmXvBOxKcra49rspP2YzZ0tg3ipjOCCvSK8uq/Mv/pgcKInNEOFhGtZMzMIqz4Mm2PXDaV0tsamJw98Q+RoGhtl7ttf0QkGeStp2uHcK
X-Gm-Message-State: AOJu0YzXaAxKb9SZlA90YSPFJ17Cbdr/wJQ6qrOENk1vQdmqdb5v1g6r
	oHK5oovyoGM6+DH7T/qbb6Lm0eb0QqYjBmXySukIS20YlqF5cASPJFPGMQ==
X-Google-Smtp-Source: AGHT+IFjBqP72MqkABZPQbwq5C54vt5eP10TWJUf+V6mIGbU756Wry/HOS140AR6rnx2vQw5Yruiwg==
X-Received: by 2002:a17:903:360e:b0:201:dc7b:a8b9 with SMTP id d9443c01a7336-20203eab02amr85082785ad.25.1724039814359;
        Sun, 18 Aug 2024 20:56:54 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0375649sm55784435ad.124.2024.08.18.20.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 20:56:54 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	schung@nuvoton.com,
	ychuang3@nuvoton.com
Subject: [PATCH 1/3] arm64: dts: nuvoton: Add syscon to the system-management node
Date: Mon, 19 Aug 2024 03:56:45 +0000
Message-Id: <20240819035647.306-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819035647.306-1-ychuang570808@gmail.com>
References: <20240819035647.306-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

According to the binding document, add the "syscon" compatible to the
system-management node.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 781cdae566a0..a6b34e3e8b10 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -83,7 +83,7 @@ soc {
 		ranges;
 
 		sys: system-management@40460000 {
-			compatible = "nuvoton,ma35d1-reset";
+			compatible = "nuvoton,ma35d1-reset", "syscon";
 			reg = <0x0 0x40460000 0x0 0x200>;
 			#reset-cells = <1>;
 		};
-- 
2.34.1

