Return-Path: <SRS0=u4mD=MG=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931BEC4345F
	for <soc@archiver.kernel.org>; Fri,  3 May 2024 08:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C35BC4AF1A; Fri,  3 May 2024 08:32:09 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70272C4AF18
	for <soc@kernel.org>; Fri,  3 May 2024 08:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70272C4AF18
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34b64b7728cso6708404f8f.0
        for <soc@kernel.org>; Fri, 03 May 2024 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725127; x=1715329927; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfZqj/uiTXAWVaICZsb8XGcycuISC2QrzlPyuabJPZQ=;
        b=dI9CfPSJzuRGBV35UdxwU8ZN0m+ojEySbvDhmQKUOymwflA544xoBKDuAPdN6ILJFw
         NGokgeCNX+dgej+THfa2OL5ur1EHKr4Lb89eopqWas+kdVK0LLxbgAxErmjBVtFGfKmW
         8xAZCEdCASnK8bgT2Bh4boQ8rI6QDPPUr9zPs8AZsHdClJa9Iv2KuArus1/39mGvGIyQ
         42wLCQwdktmXxxgeg3WZKgF1rUoTMe1eL4Hm0IrcfjebJNcgFkhLY9NC3zhlaYmjLe4S
         JhUqiMAv0O2y4pYXMyf92jO9JdcZvZVH4mL4wAwyVbTJMgfU/iPnjRDAYQBRX3V1lCrD
         lwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725127; x=1715329927;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfZqj/uiTXAWVaICZsb8XGcycuISC2QrzlPyuabJPZQ=;
        b=BnPBkw6xkmmNunoGOgQZQHvUT9WiJAPWDmeizijil6I/WtVjXTRLhrsrFcc1G63gz8
         cB/vjwrO9hQB/CD8uQbJ/+Eu691M8MBZyw5i8gkyizHZLP1/Hhai0MwhXAEh5GsQ0LTJ
         VfmZO/BeP00ZGudoc/vaiAjIL5+3Z+wvCtYpjxHP4FJcz4421nv2NChzM28Yq9s2dyAm
         uzRxAQ4xl8iU1metA8OnQbJI5iKqeNrFmue+fqJswf7HkpExHdRT8itwleJW2g8+BSPn
         t576hQpCN1H/I13U4j1tNVudqC20GnMYJ93ELAsFC8Z3gUoVi03VN4o+gUNOWGWK/Iu+
         g88A==
X-Gm-Message-State: AOJu0Yz4/rjMBujUN4+aeL4XPxd3F+SlWZTSkuCmAsSKdjHds7aTy3PP
	Lz0Y5/880srLwdAHUNFFaSAp2hMBJFqDo6a5YBoIgN6bylgzLqGq2OeLyKQaxus54Ri6C7xj/xB
	B16U=
X-Google-Smtp-Source: AGHT+IFhxQr+lmvVrOszWeI4LjVFeSB2fpxfi8yQWJUByV+T/Z2kBX/gj36Lqd2+kb9ElWT2vjllgw==
X-Received: by 2002:a05:6000:1379:b0:34d:7dee:649c with SMTP id q25-20020a056000137900b0034d7dee649cmr1532075wrz.13.1714725126617;
        Fri, 03 May 2024 01:32:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2? ([2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2])
        by smtp.gmail.com with ESMTPSA id i3-20020a5d6303000000b00347eb354b30sm3164818wru.84.2024.05.03.01.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:32:06 -0700 (PDT)
Message-ID: <6030a450-fb4e-4e27-a5c3-6f4e0f326d9a@linaro.org>
Date: Fri, 3 May 2024 10:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.10
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v6.10, with:
- Initial Amlogic A4 & A5 support
- MIPI DSI support for G12A, G12B & SM1 SoCs
- Overlay for Khadas TS050 panel for the Khadas VIM3/VIM3L
- Amlogic T7 reset controller
- New board: MNT Reform 2 CM4 adapter with a BPI-CM4 Module, AV400 (Amlogic A5),
BA400 (Amlogic A4)

Neil

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.10

for you to fetch changes up to a42f2e9ba13b8a4c556f43ed99e22ae14fb73130:

   arm64: dts: amlogic: Add Amlogic T7 reset controller (2024-04-23 10:04:25 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.10:
- New Boards:
   - MNT Reform 2 CM4 adapter with a BPI-CM4 Module
   - AV400 (Amlogic A5)
   - BA400 (Amlogic A4)
- Initial Amlogic A4 & A5 support
- MIPI DSI support for G12A, G12B & SM1 SoCs
- Overlay for Khadas TS050 panel for the Khadas VIM3/VIM3L
- Amlogic T7 reset controller

----------------------------------------------------------------
Neil Armstrong (4):
       dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
       arm64: meson: g12-common: add the MIPI DSI nodes
       arm64: meson: khadas-vim3l: add TS050 DSI panel overlay
       arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper

Xianwei Zhao (6):
       arm64: dts: meson: fix S4 power-controller node
       dt-bindings: arm: amlogic: add A4 support
       dt-bindings: arm: amlogic: add A5 support
       dt-bindings: serial: amlogic,meson-uart: Add compatible string for A4
       arm64: dts: add support for A4 based Amlogic BA400
       arm64: dts: add support for A5 based Amlogic AV400

Zelong Dong (1):
       arm64: dts: amlogic: Add Amlogic T7 reset controller

  Documentation/devicetree/bindings/arm/amlogic.yaml |  13 +
  .../bindings/serial/amlogic,meson-uart.yaml        |   4 +-
  arch/arm64/boot/dts/amlogic/Makefile               |   7 +
  .../boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts   |  42 +++
  arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi |  66 ++++
  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  40 +++
  .../boot/dts/amlogic/amlogic-a5-a113x2-av400.dts   |  42 +++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  40 +++
  arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h     | 197 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   7 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
  .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 384 +++++++++++++++++++++
  .../boot/dts/amlogic/meson-khadas-vim3-ts050.dtso  | 108 ++++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  13 +-
  14 files changed, 1028 insertions(+), 5 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtso
