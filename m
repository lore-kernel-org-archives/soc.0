Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328A1993BD
	for <soc@lists.linux.dev>; Tue, 31 Dec 2024 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651074; cv=none; b=Z2xaA6rvK9v42ZeGnNW1I0IoUtntXRqfVwmxYjRrHoNCjzxrmhzWWPW7Mt7385fqSRmmXneGKsOokWsGhUn2YQO5lhmqPCX3pKLJYnMXDGkxiRY6DDF0lg1FxCtZ+KjjC5XGSdsjZ/1oNT6tcaKvPVVr8QMqfHnM5W0IlyNqh4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651074; c=relaxed/simple;
	bh=DHVPGDu+BXXysZPKFLxRh3GfdxMr4zOKE2jbt3Ddz1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KATM7HwiQpxrV6p3MyFVAsG291L1PDYWithlSo1cQtLvrJPBHM/KCPSJWymA55lQOCKWSr9YD6dDSwGgcqJwwG7ZdwN7LQwirQtk9HxFBVDvv2Aej4/oYlhHaBiWWN38vaDIBm+cxZH3iK78YsejR3OKwGnE1j4nUbsru5NIJvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5wIRQMT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5wIRQMT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436203f1203so14888125e9.2
        for <soc@lists.linux.dev>; Tue, 31 Dec 2024 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651071; x=1736255871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kiYnqctI4B7olrZ8fmWCW3agy6+BOp1wZW4vqYuDgWc=;
        b=n5wIRQMTNbIk3wx31U/dax/pzf2Sl3Nk8eWuM4gVbveYLoIa/tsbm7QMhSc7DfI4Ma
         HSuvFl4CSrWca3mSuuETkFh3iQ4y5g4PQvQntsSK/VCj9/GItReGggHsF1mbR6SmJ4mI
         r277Mh01Cn9prGFOGMEJFj/4o1IEzHiWJpHMn7pAPSlkZs4VcNJm7DePU6R+21wt7Mq+
         FIkDcdSq/UM/aKz61xu2g+0YkMhXWv62beAcklwlofEyPRnWw02jO1vf/JVT86sogVaD
         LR4BjdQRxC/QV51/hyRABzYSoaXkUb7PiKFgXJdv7/M7Nr8u8/GlW4WMOyjeB+NlqcsD
         lAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651071; x=1736255871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiYnqctI4B7olrZ8fmWCW3agy6+BOp1wZW4vqYuDgWc=;
        b=hSVF0zuW8Y3kaV9dIZ4bWRBl3hpkEsGIdTYYA0C0PdHMDn1aeJ634vkVjYEnVBXata
         mdUWS2NZ7lO3wQsr9AhWbo0ss1LGjjU6GO89eOHLnDo3svkMPHGCiikT/+BweZCwiBCp
         l49SLvS14eVT1dgA1nDhI8Y7a50iurDXYlWFnJ9bXp45aAeafvNCTLjlB8zGJfSydVzU
         F9OOroC6cQdawCdkvFC9PGnHfPRa6sjaxlMA5tWZ5IuRAZhOf1359ns3vDZyvygLFuX7
         efbvOYwP2nbMrX3OIzXngGG1OakXBZoVj9F4Qj/hN0+55l2AAdBp0XDyZtKP7oc99BN1
         Wv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmEme8Q9z1VUnUXnoEhTF1oJlNA4cunliYgfTbmyhbk3QqVq/2LM0MeEuGAfzXpCQkqi0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUMGILRHebPmAhWZD7N2VWlDR2qqW8b/6ZymK/XHLn0IeSqpBP
	BCLNT3AQeZyrGtMSg1hW8i0M+a2yMgRkQNKGfGQSjn+a5oT5uCYu0cfD1FDu/40=
X-Gm-Gg: ASbGncvRCDoJ4jc9Dub71GCG2VcejM8rSKtQNCHtEMCI128S7MZcNnd/DGHz3bb23Z/
	Mk1ICPevLx3JtMVRVOFaQqsFjyycJ0qZq9JM6xoQKm3xnxR/W99VT7Idovf26w+wA+ocLYdAM+c
	Qdjd95I5YoBHt/LCzH4N+ZKSrz+jwtUbNx5uGaaSFSV+D25z9OIl2yFJUxzFbi9+PmzHTPLibmK
	G11va39QoLe7TmqyQAmLkEAIPcA/rgN3GM8D1yWRi6Z3Y2/171BDAu1tZkv9wkxSMVpYzE=
X-Google-Smtp-Source: AGHT+IGnj1OFU+azmVRh2S542hn5DclJ/XA6d8meuminmJqqKBQ20AJacibZOKkBSbgCiUYj9yDP9g==
X-Received: by 2002:adf:9dd1:0:b0:385:e16b:72be with SMTP id ffacd0b85a97d-38a224057f2mr11310081f8f.14.1735651070890;
        Tue, 31 Dec 2024 05:17:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL 1/4 defconfig][PATCH] arm64: defconfig: enable Maxim TCPCI driver
Date: Tue, 31 Dec 2024 14:17:38 +0100
Message-ID: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@linaro.org>

Enable the Maxim max33359 as this is used by the gs101-oriole (Google
Pixel 6) board.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
Link: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-1-1412783a6b01@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..dea35b7648f7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1120,6 +1120,7 @@ CONFIG_USB_MASS_STORAGE=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_TCPM=m
 CONFIG_TYPEC_TCPCI=m
+CONFIG_TYPEC_TCPCI_MAXIM=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
-- 
2.43.0

