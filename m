Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9287C30BB83
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093744; cv=none; b=Dkh9PU3QMwgzndkfyLRJLUuG8qtGDYxQi6Ba/61WxPamyLxoWRetZofvd7lktPNeXzsmVHvuQXZV6+EXJKAOriT2Rf49cc7dpfGTEfmcNrx2RuD1RuuPC8e7hMO4jJI92XQjRM22we/wkNLI5g3uACtkn4E1HbvIUrsBIeahoiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093744; c=relaxed/simple;
	bh=a2jsaX3ZsW/MsDCsX3SO+VcyxpSWNQi1H+lRQ/kZJIo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=YhlbXObmGY+WaDUcWknGki08QAZVrJq8XEeG10Kaz5NpKVbdLHTgbcswx603VS/paCaDkSNk4FguMgpNu/cDckAStFhukpn55fAt046Rl5gzR36AtKzFthAUy1llSPInkeAsejnO6gH7G9uDqfyqIOaXNi2Wms8ECMvvZDGuk/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o91FC7Cu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o91FC7Cu"
Received: by smtp.kernel.org (Postfix)
	id 7157CC19422; Thu, 22 Jan 2026 14:55:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D582C116C6
	for <soc@kernel.org>; Thu, 22 Jan 2026 14:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D582C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso11061065e9.3
        for <soc@kernel.org>; Thu, 22 Jan 2026 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769093742; x=1769698542; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lnv/c+j/dDiQDA/eMqxqzoMEwWCZc5OQuRRv6Q4OcAA=;
        b=o91FC7CuVzqZzTAbfbAxGw/ViZmHm7ShXolkWvd/wT7yUrlFdp9vUzpaQYW3FNSqdX
         uCvjhUCTh8PlZY/AOJaFPpSR862RDIdVMXEoKmzWKOG7WQ4nfOv0SwxGn+gVCt32/2ZL
         8IoB6rYaIR32XsxnS1RHt56qpAnVbgkBEPt5rq/SWCGOc8l/64gY7/rH8YTZpuL/k/L4
         c5cRjcG5oc8AWWkIsU2pLZwO6IU3U7LbCiWZ6Up3myVb9qK4b9xreOGOxYbrQQLL0Vn0
         BET3/71gC/CCdcp2bdxfzUNb77GemNGU5mNTzpig8t28JZlGNiH2WSWclZf8oKG6U3B8
         5Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093742; x=1769698542;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lnv/c+j/dDiQDA/eMqxqzoMEwWCZc5OQuRRv6Q4OcAA=;
        b=HJdAcSfKzD0BVnxqEtq4LA4ofYYn308MrBot+eabU331cBel+wIPyJJ7G9zQ31Ge46
         mvB+79bhhCoLD2mVA2WkSNO3SOkYsiY8LM3xMCkOLo93UFSjaqxFKPcc3pGKHBIE74Ud
         TKY7CkGumf65DfcUCPpU8uCqXEqBaxADftQ1KHCJZ6ZAuZ+rbLZOGKKuCPbygmBp2HIZ
         lcLw2G6/vlVBld6WlITJxsQnkD6DaFcKSxkptRTnSMT0+H5uI49xb+kmGlFRgvgox76X
         URd4P0IgNVWmY5V6xSdC9poSGUfl1utlQmAblI9VJ/UhhS4O9lG2oiwcWBgx4DDUXeKu
         hCJw==
X-Gm-Message-State: AOJu0YyoJftUmz6tg0ToQNrzoQMPSEzgDmOUz791aGymcd/XbuU0TD7W
	56BORJp6+QfPVfLGKHB5Fge+FuTB6HdL9XgxqmBiHB9p4m5qAi2+Lg/4mCUptsUeUmSAdt0a0co
	V8KUxHtX0Pw==
X-Gm-Gg: AZuq6aJ7neDxIALUx55a7KJtuHOfGG3X1A00xMvKTEtEkXE3oRZyOLvwPOlSVd2rXOn
	ofrbpREsNfUWSFDc57S+A49K7XzsLpv+SCaJarNjuvAEHeC9sJjSyLTcANbANxps1D5/qmMLhWj
	ifsTwAL5aY+ozGzvOqRLk3SPORr7HfnISNeq7ZwKz4r2A3XVuUJZRC3YDowoU/hwVdh5c34anzs
	k1pdkSea8RzpE0peA1OeDfhz8+Nmu23ObPJPDktnEseDzbDWmJJmEXtT2eQRjsk31TX/riOMmaj
	1Ps76V577oBO+CoJlY99BCpZXXdS8QS8KM3+zrFJ54pNmPjQUcSzoTaAqQRvXqIHyqi2DUZnejv
	9yFohKd3/1wrWKkhvBjAKTodmFyLuH5zAMEnBlbLcbtEkgRaW4BGexoUL1bz7c/FTxS3DAME1cL
	Kx25QX8EljMD0TCOKSYuV3ZfHpi6+Ozo4SiF2LqLpiTtDRoazWe+fmKL1DoA8F85k=
X-Received: by 2002:a05:600c:4f8a:b0:480:3c28:838 with SMTP id 5b1f17b1804b1-4803e78ffbemr143482445e9.8.1769093741349;
        Thu, 22 Jan 2026 06:55:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804703b90bsm86876285e9.6.2026.01.22.06.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:55:41 -0800 (PST)
Message-ID: <68dae86d-5c72-4f22-bfb1-1834c47ff0e6@linaro.org>
Date: Thu, 22 Jan 2026 15:55:40 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.20
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
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

Here's the Amlogic ARM64 DT changes for v6.20, fixing proper clock
assignment for MMC accros different SoC families, removing useless nodes
and various cleanups. Finally adds support for the Khadas VIM1S board and
enables NPU and the Type-C controller on the Radxa Zero 2.

Thanks,
Neil

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.20

for you to fetch changes up to 854583f9992671411bad28bd8a3867afba7cce77:

   arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface (2026-01-21 17:44:08 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.20:
- Cleanups:
   - Use lowercase hex
   - Use hyphen in node names
   - move CPU OPP table and clock assignment to SoC.dtsi
   - drop useless assigned-clock-parents
- MMC clock fixup across multiple families
- Add type-c controller on Radxa Zero 2 and enable NPU
- New board:
   - Khadas VIM1s based on Amlogic S4

----------------------------------------------------------------
Eric Neulight (1):
       arm64: dts: amlogic: meson-sm1-odroid: Eliminate Odroid HC4 power glitches during boot.

Jerome Brunet (9):
       arm64: dts: amlogic: drop useless assigned-clock-parents
       arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
       arm64: dts: amlogic: s4: fix mmc clock assignment
       arm64: dts: amlogic: c3: assign the MMC signal clocks
       arm64: dts: amlogic: a1: align the mmc clock setup
       arm64: dts: amlogic: axg: assign the MMC signal clocks
       arm64: dts: amlogic: gx: assign the MMC signal clocks
       arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
       arm64: dts: amlogic: g12: assign the MMC A signal clock

Krzysztof Kozlowski (2):
       arm64: dts: amlogic: Use hyphen in node names
       arm64: dts: amlogic: Use lowercase hex

Martin Blumenstingl (1):
       arm64: dts: amlogic: move CPU OPP table and clock assignment to SoC.dtsi

Nick Xie (5):
       dt-bindings: arm: amlogic: introduce specific compatibles for S4 family
       arm64: dts: meson-s4-aq222: update compatible string with s805x2
       arm64: dts: meson-s4-s905y4-khadas-vim1s: add initial device tree
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable eMMC storage
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface

Ricardo Pardini (2):
       arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
       arm64: dts: amlogic: add the type-c controller on Radxa Zero 2

  Documentation/devicetree/bindings/arm/amlogic.yaml |   8 +
  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |  13 +-
  .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   |   2 +-
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +-
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   6 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   9 +
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |   9 -
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   9 -
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   8 +
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |  13 --
  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |  24 ++
  .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  |   1 -
  .../meson-g12b-bananapi-cm4-mnt-reform2.dts        |   1 -
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |  12 -
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |  13 --
  .../boot/dts/amlogic/meson-g12b-dreambox.dtsi      |   1 -
  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |   1 -
  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |   1 -
  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  12 -
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |  13 --
  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   1 -
  .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |  12 -
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |  51 ++--
  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  |  24 ++
  .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |  12 -
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |   7 +
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |   1 -
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |   1 -
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |   1 -
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   1 -
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts    |   1 -
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |   1 -
  .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |   1 -
  .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   9 +
  .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |   1 -
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |   1 -
  .../dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts |   1 -
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   1 -
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |   1 -
  .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |   1 -
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dts      |   1 -
  .../boot/dts/amlogic/meson-gxl-s905x-vero4k.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   9 +
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   1 -
  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |   2 +-
  .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |   1 -
  .../dts/amlogic/meson-libretech-cottonwood.dtsi    |   1 -
  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |   2 +-
  .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   | 259 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  13 +-
  .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |   1 -
  .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |   8 -
  .../boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts |   1 -
  .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |   1 -
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |   8 -
  arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |   1 -
  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   8 -
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |   2 +
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  12 +-
  .../dts/amlogic/meson-sm1-s905d3-libretech-cc.dts  |   9 -
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   9 -
  .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   8 +
  79 files changed, 442 insertions(+), 247 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
