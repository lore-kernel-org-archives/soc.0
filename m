Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98811A7AE3
	for <soc@lists.linux.dev>; Wed, 10 Sep 2025 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516689; cv=none; b=gTansd6vaF3dqj4afdkmvJor4dK8pIW+TSEropMGmN7FC0+WGa7V62P4LoRg24Gxnx4W4AJ0dh38sfDktr5/cWCpCXR1ZWW3Gsg7vVUTsNio4VHiw5zMoIgcfQPJ1aMtWwqyYSF7AbZ1aLuRCqIu1v3diC1Zi6dLMQgs27jmO0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516689; c=relaxed/simple;
	bh=prLoTXx0EeY/Rt9MpIiPdx7TBaQnqSfvaV3CZjJc89Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=TbowhLPqFBGQQp7iWwpTYMOBAu4jAGaBLeDBs7w3FxZQMjRkTvABH+h2imY6i0xM9FjGsuLz9ZA8JwQy/qsM03P3to0husf/7u6UEPheWJCzCDX5kb2a45t6y2D6BCdMWUriNFINd26vA2JSb1KNUcHKLbcORrsWmIdZQh/3dyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PglYzR8X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PglYzR8X"
Received: by smtp.kernel.org (Postfix)
	id 703D5C4CEF0; Wed, 10 Sep 2025 15:04:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F007C4CEEB;
	Wed, 10 Sep 2025 15:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F007C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45de287cc11so4884985e9.1;
        Wed, 10 Sep 2025 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757516687; x=1758121487; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEnPsq6WeNaBYItOCrP3jZ8pp3FBK2CatmwjghkD9/E=;
        b=PglYzR8X2FLsCwlWX+baQvBAPrbWado+TaFkZ/pkm0Q2UYWmjXT5myX0CBxo5XZ6EZ
         7INNYfHx9mfv/Dnk+iAnGs3/0r6kFZUcZ7p/4NBzhTrpfenw0KkVchiyOllFh5sjKojh
         rz7QDzdVyx3w5N+XDSxXoNFaFxfSQS7iGhmz8L8tZkPV7Uqx0eFNvykmBAgRgc2mHLYo
         RZUpPzTLJ9DLC5XSRQjxK6neHd9GE5G7oXHBnz3XQTFiJLh1TqSkkBKXkuaLohGO/5WE
         tBfcK1BZnrNKkwi1WKJa1PxtC5gEoeuscZG0sl44iysfJ0UNe7aPZiSYVYaxQm1hdOBg
         pMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516687; x=1758121487;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEnPsq6WeNaBYItOCrP3jZ8pp3FBK2CatmwjghkD9/E=;
        b=n+JC0cJfqm2OhAjLAfO7SwEOp3OngnwPa/hF87nEiKe48fGm953hnXhYQLwp//WOgC
         6mWwmZ/MbEVo28L7xverLj2gTvv51Akcmzw7s+Y2iFCkpbfpsimCk8uIxDRuPgKRXreq
         NEpxrx2fxcetQ5lRe+dU9LgZX2rVHqD2X+axrWlNLhOrhYhD+hkKuJJ7aLpIifv9yl7e
         wN6lIV4JrFRcvR3g43x/KRBF1+7jsZTEixCn8v9TrEwWk9a76bqR6khWSovqsqPpWuq3
         JVmz/SD8LltogowXXWgjEnrZtA/3W5g1UDGY4coXx20C+mSjEcRVp6XO3VYWddquPpjY
         C2xg==
X-Forwarded-Encrypted: i=1; AJvYcCWecF7p5esoc/idqyHVHlSd9cbjIZV0eTXV7b8Ksg8kUC0beKLc4+XjaB1jWB8QulPInM4=@kernel.org
X-Gm-Message-State: AOJu0YzjVB4W+zE9eg+q6ndKfvHq4bUbzi0po/pzqqJ/ZAe2ISqIvVQu
	n0I1q3A+53GTg7B9vpUVdsSIM86fJ2iI13nQdLyjiJDVvJMIALWtulaUjW6+/A==
X-Gm-Gg: ASbGncsZMAceCMb9/QddvGnOnFk0l9MJbuFIB7ldoFBjUCAHCtp+7VDYAE+KXfongwg
	ZcpQ1JDTsm64FlHm6SCehmtd0M7crbQB6mdYysYGvYETldXDu74g33ngC/K1BcejYljGqLkEs1H
	uFYH2NOzclqRQi0AvzJGKW6AtsHdZ6w3MUmVxXhJFAxD/ckZ922BvCEPxpWROp2qIsQOJXb3ytV
	tYohb7/WEnqTUcJjSi+3pmZsbBmJGg0ldOOyQO8u31/E0y/WGK6OrFOKSvLrmZ1o5IovxgRZEV1
	Fc2dJcpFC9gweLNP/iIZh5fEXfW8eW/y3l3byXGRCVkxJX6wQwxxNcL1kJoDLgse0gNtl94PO/8
	/jgpjMRZffvaJ1tA0BqTeXe+W3uvrTAwxXjmZjoIArnDQGXEMrQlOhuIiIVF6jZp3jTa0u7nkGU
	Xl35cHV0U=
X-Google-Smtp-Source: AGHT+IFfRJaTgK+cpWWQ0yHfzQUrcxQc9YgGZ9tJUoJhEOdSGaPaKa9gYD0xqPDRW9QLUVmmDBVPcA==
X-Received: by 2002:a05:600c:4e47:b0:45d:dbf0:4831 with SMTP id 5b1f17b1804b1-45de0dde9c7mr149545905e9.0.1757516685887;
        Wed, 10 Sep 2025 08:04:45 -0700 (PDT)
Received: from [192.168.0.24] (static-39-127-60-95.ipcom.comunitel.net. [95.60.127.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223885csm7116646f8f.36.2025.09.10.08.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 08:04:44 -0700 (PDT)
Message-ID: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
Date: Wed, 10 Sep 2025 17:04:41 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek ARM64 DTS updates for v6.18
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

can you please have a look on the following patches.

Thanks a lot,
Matthias

---
The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/v6.17-next-dts64

for you to fetch changes up to 12a565af705542c4380e95f4e3a505a2c25ad754:

   dt-bindings: arm: mediatek: Add grinn,genio-510-sbc (2025-09-10 11:51:16 +0200)

----------------------------------------------------------------
mt7988 (bpi r4):
* enable network

mt7986:
* add dedicated sram node
* add interrupts for RSS to ethernet

mt7981:
* add thermal sensor and auxadc nodes

mt8395 (NIO 12L):
* enable UFS
* add gpio keys to the PMIC

mt8195:
* drop reset for PCIe device

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
       arm64: dts: mediatek: add thermal sensor support on mt7981

Frank Wunderlich (7):
       arm64: dts: mediatek: mt7986: add sram node
       arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt names
       arm64: dts: mediatek: mt7988: add basic ethernet-nodes
       arm64: dts: mediatek: mt7988: add switch node
       arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
       arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
       arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds

Guoqing Jiang (1):
       arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie0

Julien Massot (2):
       arm64: dts: mediatek: mt8395-nio-12l: Enable UFS
       arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support

Mateusz Koza (2):
       dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
       dt-bindings: arm: mediatek: Add grinn,genio-510-sbc

Rob Herring (Arm) (1):
       arm64: dts: mediatek: mt8183: Fix out of range pull values

  .../devicetree/bindings/arm/mediatek.yaml          |   2 +
  arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  31 ++-
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  20 +-
  .../dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   |  11 +
  .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
  .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  86 +++++++
  arch/arm64/boot/dts/mediatek/mt7988a.dtsi          | 285 ++++++++++++++++++++-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  14 +-
  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  14 +-
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   3 -
  .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  46 ++++
  11 files changed, 508 insertions(+), 23 deletions(-)
