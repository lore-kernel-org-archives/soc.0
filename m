Return-Path: <SRS0=3nnK=IV=gmail.com=zajec5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA977C4707B
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 10:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97025C43399; Thu, 11 Jan 2024 10:39:37 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFED2C433F1;
	Thu, 11 Jan 2024 10:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFED2C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e7af5f618so5847604e87.1;
        Thu, 11 Jan 2024 02:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969574; x=1705574374; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MuVNFMNu/znFyjhI4YiVPNBcWz8JIXuuibOlcW6cauo=;
        b=Yv3lF8SRv4zZvoEflAjQpQ3wsERZMpaDPM43Ztn/Gkg4K6aAuYaxcus8+/2tY2Omku
         ZdmS+tpgeslaZSSscnEQYNZbeG4cOySTfaB8Opr6KA7fslVKsdiCWQt9Aeb/acRgxNfy
         xCooXltAr4RNPiRESlyoDN23IVZo6c3mY8ErevbErixoPT+GaGw9rI0A79Em+AQlAkfb
         9V4FnujGXAA1XbExzSaJ+nt77SnhEBA4oPcAQ/t5NMSUFIMQAoo91gnL7DQCnRJb8MnS
         OYbn157DEeEWu49kXig8FFHgoF6H81ZjTlbvuT/I4kteV5c8vxSX0GlvYLRK2mxFTFiK
         bxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969574; x=1705574374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuVNFMNu/znFyjhI4YiVPNBcWz8JIXuuibOlcW6cauo=;
        b=pO7/L5Ms/omNl6kQ6PCxkfnjQCQGrlki2zyguZGenRwrJvSUxTtEtsWIqaAspFx0D2
         ZPInqa9+Sj/wrGucJ68rGT6OjcHD5g2+viItmo2L0sNWBVOwGCGP5rCaXs+0voIMvn5/
         c5QD8wOV5uWkCj3YLdpnAy3v3gjReI77dx970goTnbQZ3LeziQoTka9lQASAj1YLjQkY
         xOcYVWzBC6lwa0EsDE+VZLkVlEzgwziYak8X1Hk675E+AaRGjcTdVulpDO2oBw0xUSWO
         REgrTVRprh/BB6MWeuM1xuABWGcW0vVYlOsKVoju0IPRA8IG6rMeyv47+KhfI6poDNf1
         dkXA==
X-Gm-Message-State: AOJu0Yy7ev/awadXSlGsKVWXGhNKynjLCI8Bl/2JhPBWZMALmbbmEzm+
	7IDghGqCcc332AiYZEqcLB8=
X-Google-Smtp-Source: AGHT+IEnpP/pKX/gXbee57tP/8wAV93Q1jQEFfaBg+OenM/0Ooa1lAhiPzT2sTpofQ+k5kRMXR9eVw==
X-Received: by 2002:a19:ad4b:0:b0:50e:dc99:b9d4 with SMTP id s11-20020a19ad4b000000b0050edc99b9d4mr385313lfd.44.1704969574165;
        Thu, 11 Jan 2024 02:39:34 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906c20e00b00a298e2f6b3csm407179ejz.213.2024.01.11.02.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:39:33 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 0/2] mt7981b: initial DT code
Date: Thu, 11 Jan 2024 11:39:26 +0100
Message-Id: <20240111103928.721-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

This work is based on linux-next content and was successfully verified
using "dtbs_check".

I'm not sure who should apply this work. Given I received reviews from
AngeloGioacchino should I expect Arnd to pick it to his tree directly?

Rafał Miłecki (2):
  dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi AX3000T
  arm64: dts: mediatek: Add initial MT7981B and Xiaomi AX3000T

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   |  15 +++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 105 ++++++++++++++++++
 4 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b.dtsi

-- 
2.35.3

