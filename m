Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE3B246788
	for <soc@lists.linux.dev>; Wed, 17 Sep 2025 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758104552; cv=none; b=OHTQp4+e6KsEt7G0kA/eZLugaNGkw8drmRfxzrYO5zByWimQen9dQ95zFdnbUh4g3/1OyjE/erH8sNkiWnIcxiVW+thc9PuGtQr9Ygk5RbrQxrnHq3UCVmBUeFcTnfspGJ1yxH0jSbYekUR+oQQJ9nDStuDGrQC03VbGwAIW6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758104552; c=relaxed/simple;
	bh=ChwpnRo4r573MejEB5FcUDNoIX+PZDS6zIF2JexF5Js=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=PhMCpVrMuhNHjJ2SHiURTSSy5JqcI/c9T3x7GtN7Yc87a4Bj+UfA/8jWXoXNEaNPIqznLOPZ8/y3uZ8NLM6B469MPOUi3oCrXDAVz0nTGUROGtKzi+AskTl2wzYmBguE+BKsogw5Tli2WpBCTQksikqY6N49fZ0RQUOlPjGS6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHuaJzGC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHuaJzGC"
Received: by smtp.kernel.org (Postfix)
	id 731D0C4CEF5; Wed, 17 Sep 2025 10:22:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47A5EC4CEF0
	for <soc@kernel.org>; Wed, 17 Sep 2025 10:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47A5EC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso46880595e9.3
        for <soc@kernel.org>; Wed, 17 Sep 2025 03:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758104548; x=1758709348; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACPHyaPhJERwEc5kXRghrR5x8oKBJTVDySHHRzag2Bs=;
        b=lHuaJzGCM5gRDyQ9lNi5WmLlQz2O+dsWDEH8ZxiAtS86QsxKnKma2X/cXWC1F1Yert
         5ZEfEkYEexhYusFZyaxuVkaxh9XG0fJ/8ttkKXIQL+NtPWfIFAyHh+AYReX/CEydl68y
         fL0NGyQQK0hvKPQc/xAlU5cK3x8drqOwfYaXMohFKdZM5/9/XThENYbHI49brjHOIssU
         DTJbHnU/DkltJiAEnfRHJkwlmZllGtYYj7ui94nbXugSu62eomn0tuu7QGbAR1zFW0sK
         bwtN2BNCvFu0VblwKlvkfc78PssOpuMWYqMHQxFuc9Po+6bJO5mmgG4FD+HGxvW1gZPm
         xPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758104548; x=1758709348;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACPHyaPhJERwEc5kXRghrR5x8oKBJTVDySHHRzag2Bs=;
        b=VN5OQPyErG7KO3rcOGLkffvPu1Bxu6mNRIkaUpKb1y3mowPpxsnnQiH97WjeeLsuS0
         F0tokiHOq4BAnswsfxLqhQQcFNjUDa5kzYXDjgq9+tQksWKZml++brCoI4FU3Dl8F+/v
         Cf8lD0A1UeqLJgSoq/0FF/6yg5xXA2N0U1olc+vp9X48pd13HvE0CvE3f2+8QMcOpYFq
         jauJQtgGkM7sYSJsYrHAhDK+IWADwJStzHUkGDNf0bCiVPtkuQC7QYoK205obUL4dH0A
         bM7BX5x/3PgG9i43W/VUnAi5L+eaK0wChXhTnIWcfHBeWEaKKXZV65T0hGSR8SaIdiA/
         MMVg==
X-Gm-Message-State: AOJu0YzxXGQTNMH7zpK0MAabKkEZNNOAS5ejTRBAdqKnYwLi8lGzJWr0
	DXen2zLWv16viBm4fiatzVJvl5bVzZzTMmbF9GqsSV1lPgLUVwn6xn2CrCYc3w==
X-Gm-Gg: ASbGncvRzQhXdlRfI9LNJeDFczuf5NwBWw77E5d72M27ba+0ZSDhysYzyAQ1aP3ZOOt
	AnwbCg0IYz82N87mYuipRlWcYUCv9DhmY/f2opE+zA++bZHsTsKFfXbzyaN4t2tTevPPo4ladZ/
	gx6aaIS4zM3E9xzJCsVokeU8+C4Shl5a3yQ4S1I3QbT37nVj+Me+9czbQSwkHyxCOIE2CUvnD68
	lT4By4+XuValekxhoXcoy7qy89YSmwcVRx9Flp6fpmWaLJ7uuAcNq8phOYXU3nL/JYkyONte9mf
	OiX3qaDrAccgr2kSnPbX34EpT1BjTfWaAtQqQUzuYcgcn3qVAk95INl1s+ZFvwBZbjA2l4BVq0L
	9OXZn5q93T8aqOALulB0XP/HZ8q1L
X-Google-Smtp-Source: AGHT+IHaqrW1NL1fyFZO67QCgQFhboRnQ+7WLeM8a9dV2PF3TUmmod1ucsnPTxYGdhQoaNaIB7TJNg==
X-Received: by 2002:a05:6000:288d:b0:3e5:4da4:d87a with SMTP id ffacd0b85a97d-3ecdfa0b667mr1402602f8f.35.1758104547428;
        Wed, 17 Sep 2025 03:22:27 -0700 (PDT)
Received: from [192.168.0.24] ([148.3.20.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e09f879sm30441365e9.19.2025.09.17.03.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 03:22:26 -0700 (PDT)
Message-ID: <c0e2e902-2a10-44a7-9592-491ba7382df0@gmail.com>
Date: Wed, 17 Sep 2025 12:22:25 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek ARM64 DTS updates for v6.18 - part two
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

can you please have a look on the following patches.

Thanks a lot,
Matthias

---
The following changes since commit 12a565af705542c4380e95f4e3a505a2c25ad754:

   dt-bindings: arm: mediatek: Add grinn,genio-510-sbc (2025-09-10 11:51:16 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/v6.17-next-dts64.2

for you to fetch changes up to ffe6a5d1dd4d4d8af0779526cf4e40522647b25f:

   arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible (2025-09-12 
16:18:04 +0200)

----------------------------------------------------------------
mt8188:
- change efuse compatible fallback to make GPU DVFS work
- enable SCP core for video decoding and encoding

mt8186:
- add correct touchscreen compatible for tentacruel and krabby

Fixes of DT warnings for many different SoCs and boards.

----------------------------------------------------------------
AngeloGioacchino Del Regno (21):
       arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node names
       arm64: dts: mediatek: mt6797: Fix pinctrl node names
       arm64: dts: mediatek: mt6797: Remove bogus id property in i2c nodes
       arm64: dts: mediatek: mt6795: Add mediatek,infracfg to iommu node
       arm64: dts: mediatek: mt6795-xperia-m5: Fix mmc0 latch-ck value
       arm64: dts: mediatek: mt6795-sony-xperia-m5: Add pinctrl for mmc1/mmc2
       arm64: dts: mediatek: Fix node name for SYSIRQ controller on all SoCs
       arm64: dts: mediatek: mt7986a: Fix PCI-Express T-PHY node address
       arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C node names
       arm64: dts: mediatek: mt7986a-bpi-r3: Set interrupt-parent to mdio switch
       arm64: dts: mediatek: acelink-ew-7886cax: Remove unnecessary cells in 
spi-nand
       arm64: dts: mediatek: mt8183: Fix pinctrl node names
       arm64: dts: mediatek: pumpkin-common: Fix pinctrl node names
       arm64: dts: mediatek: mt8183-pumpkin: Add power supply for CCI
       arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
       arm64: dts: mediatek: mt8183-kukui: Move DSI panel node to machine dtsis
       arm64: dts: mediatek: mt8195: Fix ranges for jpeg enc/decoder nodes
       arm64: dts: mediatek: mt8195-cherry: Move VBAT-supply to Tomato R1/R2
       arm64: dts: mediatek: mt8195-cherry: Add missing regulators to rt5682
       arm64: dts: mediatek: mt8395-kontron-i1200: Fix MT6360 regulator nodes
       arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible

Chen-Yu Tsai (3):
       arm64: dts: mediatek: mt8188: Change efuse fallback compatible to mt8186
       arm64: dts: mediatek: mt8186-tentacruel: Fix touchscreen model
       arm64: dts: mediatek: mt8188-geralt: Enable first SCP core

  arch/arm64/boot/dts/mediatek/mt6331.dtsi           |  10 +-
  arch/arm64/boot/dts/mediatek/mt6755.dtsi           |   2 +-
  arch/arm64/boot/dts/mediatek/mt6779.dtsi           |   2 +-
  .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    |  40 +++-
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           |   3 +-
  arch/arm64/boot/dts/mediatek/mt6797.dtsi           |  52 ++---
  .../dts/mediatek/mt7986a-acelink-ew-7886cax.dts    |   2 -
  .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  |  11 +-
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  12 +-
  .../dts/mediatek/mt8183-kukui-audio-da7219.dtsi    |   4 +-
  .../dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi  |   2 +-
  .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  27 +--
  .../boot/dts/mediatek/mt8183-kukui-kakadu.dtsi     |  43 +++-
  .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     |  40 +++-
  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi      |  40 +++-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     | 101 ++++-----
  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  12 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 239 ++++++++++++++++++++-
  .../boot/dts/mediatek/mt8186-corsola-krabby.dtsi   |   8 +-
  .../mt8186-corsola-tentacruel-sku262144.dts        |   4 +
  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi    |  25 +++
  arch/arm64/boot/dts/mediatek/mt8188.dtsi           |   2 +-
  .../boot/dts/mediatek/mt8195-cherry-tomato-r1.dts  |   1 +
  .../boot/dts/mediatek/mt8195-cherry-tomato-r2.dts  |   1 +
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |   3 +-
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           |  30 +--
  .../dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts  |  16 +-
  arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts    |   2 +-
  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |  18 +-
  29 files changed, 549 insertions(+), 203 deletions(-)
