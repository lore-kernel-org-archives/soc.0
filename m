Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403AD1F91E3
	for <soc@lists.linux.dev>; Mon, 16 Jun 2025 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084735; cv=none; b=dV1FqKQC9ogi8mSrkgGwRNvC1/6181newiCJrqxH29IT2OUX+BgiliXGgHqLVAzbHfTa8Zp4c2o/x5tdir9pxi2wBFxTbj7XKkXwJDTH1t70HheQaUZY8bqTJhpmgGNZ0zWMt9KYVNMzRbRgRd4aNYOyHjIiJPTbrldURapJVAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084735; c=relaxed/simple;
	bh=ytjfmtK/XdCP2wuHUwDkdi5kPia1J9R+DeT4RG9dGAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UHOqbSCVup99DVlzIv4mi5qyAJVYBmCpmIJjh4WH8UigUKaWFmuliuxEvL2YmlbWiV1GiSeofDl1JRjHOI8juX9pCDEI4+4/lUQm5u4KDmUdQDXcuM9kCD6Pwdktxocm02NGG9wQ5zuXNzBEB+bZnxfnBs+o3LC3wJFtz+/xndI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iioV0Q9a; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iioV0Q9a"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3706277f8f.0
        for <soc@lists.linux.dev>; Mon, 16 Jun 2025 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750084730; x=1750689530; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWToLPQVitiBw5bzYj/kjSaIU+PcrpH2/GQkA5MT3qo=;
        b=iioV0Q9a+PT9/BHc6MJzDjU1QjFoSOFyW682IO6FOlYJhqvSqxPo7xBO+zUiEXjnsJ
         UJ7cP1U0arQbo96A/JhmDSNeK+zwymAB1iJPND6NIEqZ/F3zW1iRu5qlBOSr8BgKY2Q1
         yGxYJoz0b3Bv5cccni3O7h39WTO9FC3GGGXvOscRVUPI8KCym8nJiutnl0INdsy2zI+l
         TIVrr8extPZOpDxIAKHb7qyPJbqYOCgfnE9jn//Wp2x8j7tolfRtJe5q2NHXGMilsdaB
         gwXNQ4of13LKk6lpVrtMNcW+At/7lf2NiNBXqSih2uCzDauYZTq0FCz9VqVCCSwRfP52
         2cKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084730; x=1750689530;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWToLPQVitiBw5bzYj/kjSaIU+PcrpH2/GQkA5MT3qo=;
        b=Vr8pe9NVyY9HF4UE116suWFu9/Bt9LbyQTdD420X02gi1Wq/cS4AXDnVKLHHa+IzLD
         KXcIedJG+eCyChA2CB882vSUdkffRnSscks2NC5o8OcMGuttsMZJl61aDlv3vNyHI2TY
         P5TVNb58nkgkqkZZgl/ElIF0gRffCfm8RDVOikeswCGnqPjPtihs2reDqqdkMJoDlkaw
         KFTC/u2q9rkHd3vqkT3m/TlsuE2XASjYE1+UFdPyW+WFfp/pgGpWTAKrAIZ1+XaBtcI9
         4NT9XnyO59CMbgPP7F7I8e/TaPt0K3sePxU4+6TauTJc2FYtHlNhWwCvtONyqBa9UWhM
         g97w==
X-Forwarded-Encrypted: i=1; AJvYcCVv6YD13WqoZFA+BW7AerWmb9mKEFX/gOGyJgYp7LdjeomZy10e2BNpBrY6ri7zlBUXJnA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJfQPf5912JtLEtUIbrESiIgLo21VIYjfBBA/y7aRbsx8lvjkA
	bBh0Pt2BeyVG0Td+j/MF7c6RA5gsPIlPUNJVTtR7wbBJSxJQgeAPdXkEau7l2E8luQY=
X-Gm-Gg: ASbGnct7IkIH5Wa/rdqBHm6UwI6Tdm9LczKF9OZc9z+mvX+QxPiVH6uZrx49/iYM9DU
	0OyVeIqzrVLSqFgPjyEQZi6ehetWslIFdJT/3RtExuhT75Ed9EXgcOSD8T1JLYKuMOzGdjgFUKO
	8JwC59iXImRHfV5dId5GfuSOPtuSInKTrYmGCwO5Ynzgw4QDIhTbSMpd6JGRfvbJENZ6PhudKJv
	bmwkgy776Q1wlIDOfDxaCi1MzxDdDivxB35cE97+1hqUWykzPKCwFnLeH3UBUfxyR05sVcN2el4
	1tNZbcJKTpU8+Opeh8BEj0IRG6STT4jky4cMieO1OBCTXirzbMX7fGR6xl34mbmP5ahCbMRuWu7
	FMUBrqHaZwzYKjT471PU8MCpdRAivT1K0LaQ=
X-Google-Smtp-Source: AGHT+IEGRmeB3oMKleC3pKBVMBYu/8jfqnCCDOYSgFOyYxzD5mJZV1fg44FKowdo55Cr1jLuHCyDjw==
X-Received: by 2002:a5d:5f54:0:b0:3a5:1397:51a7 with SMTP id ffacd0b85a97d-3a56d7cd5b7mr9274661f8f.7.1750084730495;
        Mon, 16 Jun 2025 07:38:50 -0700 (PDT)
Received: from [192.168.42.1] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4533fc6578csm77990485e9.19.2025.06.16.07.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:38:50 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 16 Jun 2025 16:38:28 +0200
Subject: [PATCH] arm64: defconfig: enable Startek KD070FHFID015 panel
 support for mt8365-evk
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-display-defconf-v1-1-c9c269c9c27b@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAGMsUGgC/x3MQQqAIBBA0avErBNSSqirRItRxxoIFYUopLsnL
 d/i/wqFMlOBpauQ6eLCMTTIvgN7YNhJsGsGNahp0FILxyWd+AhH3sbgxTTibJCkMyNCq1Imz/d
 /XLf3/QDaGjrrYQAAAA==
X-Change-ID: 20250616-display-defconf-54a9bae1db4a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ytjfmtK/XdCP2wuHUwDkdi5kPia1J9R+DeT4RG9dGAA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoUCx5eXjdcOVffnq7WXqqYRnDsTdZZj1URCBrdgGb
 xUNVAA6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaFAseQAKCRArRkmdfjHURbu8EA
 DHfrZk940Kjkbb7HO3M0y+77ll7StOw6cYtUFU60Y3f0qJy5Uzt49F0AcaoWOICKDrI5rsE0R9CoJ+
 rarUxHOdagpMdKzJe+NbD14e7yujy5McG2KgSe93nPok6kt4Vb1POkq8sb1tbPS3gojF3Gf1mCPN9I
 zEM0mW3pMX29/LOiRnbfRFVU5hXbUh7uIVIzrnYH044y7F9sWochwHdCTKnkCg7z6i4gqbyhpf5f9t
 /UGOE0UxEdJSMWGQZWFkV+OwoPiew+VUWeg6qnJJrNt+S4+bIXftIpGc1UwMmQSeRkamV+ZMMtKD5u
 bOuQlkODD9zAiI+9MMwyBEu42Y1Jiv+4tNARQrtLUKDS4Up2soTHjqyMpzxZ9brKcQZhhdGFpxjV7H
 KhjArSXiUQS9IivhhJJfQufiMlZmpB50pB0jALEzfa9v/pH8QLAqbMQSSpl3znRsq8ixBLP5UIBnPJ
 Xcvk6+6bniS+K+oK87xGvuTJGSnaxXqESOwgp6wssmvRQCzzh75Y495vK5Mmw5HLtDwbUqtrprgzik
 gMN4yU94JQaUBup/uwfZ3hb/S5VgqGYXx3FY9mU3GzjyICzGlCEmHTYfv1lwLR0MPqEKzkax/9IUv7
 fthBOcdg5fZGwwWFLcmUCUWN1oGPhm0ctSoS1WGVlUW7uL7iiqiO4neOMqag==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Enable the MIPI-DSI display Startek KD070FHFID015 panel to have it
working on the mt8365-evk board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
This patch come from another serie [1]. Since doesn't depend to the
remaining patches, the defconfig change has been splitted to this
new serie.

CONFIG_DRM_DISPLAY_CONNECTOR=m has been removed after rebasing because
is it already on the mainline.

[1] https://lore.kernel.org/all/20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..319d1899348bf6b6c26362c9b4fe7f1da917769a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -914,6 +914,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m

---
base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
change-id: 20250616-display-defconf-54a9bae1db4a

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

