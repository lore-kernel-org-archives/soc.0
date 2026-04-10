Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334CC3AA1AE
	for <soc@lists.linux.dev>; Fri, 10 Apr 2026 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811063; cv=none; b=utP6fuRAAn7hfxzWemPy2umQWRdjMUIh/qbtCo5XkMl+z/8uoKZHPvg98rjJHZowcRI9DCQGLJPBu1b8VwDnbT+QdRkpy1Z77LE2BR6zZG0ogg0ypwYjIvQsA40TYrNBsYbfBGp6uomtFoDT14IwRN+/5rkZsNpZN9+/PGVP8RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811063; c=relaxed/simple;
	bh=WYymINnq8+90iPgV4w6ggT6KKfX9Vb17ScDBRgRJ1gs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=SMTRgfVPRhfJpw2MmUcoF3om2ZlsfXdjP/8T9hnmSxwfLdMKob2RvPdSIfYEJv/4k7+r42mmUmXRWqCtCXmbK5wY6+4gXVd+lAnMaiOJtAM51ZDt8e37YgQenifHYxVn/CO5sUYwT47ksKT/qdo5PheIc2cbLFC+X5yGJQ1Luqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QZj7mWOx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZj7mWOx"
Received: by smtp.kernel.org (Postfix)
	id E1A1DC2BC87; Fri, 10 Apr 2026 08:51:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 09825C19421
	for <soc@kernel.org>; Fri, 10 Apr 2026 08:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 09825C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a29e6110so20367635e9.3
        for <soc@kernel.org>; Fri, 10 Apr 2026 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775811059; x=1776415859; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XflkUukoCSMhqOUO0g2fDV+ZPKs+PxpzityxwM9G4Qc=;
        b=QZj7mWOx/zQRGfZV5cUvFKSKdFPf/AD6khcPoKPqFCFF29Y86DeYpc6W4oSfzCFoeg
         0JEpRFR7m5af2TBSyNztlL61MJIOXB85A6AaJmRdTLlfKX15GJ0vnO0lZP8mmwm1pTxw
         AJYYcFXMWUg94uYsQKGH4i8lyDJ9WJBS04ILWLaMr9agabbfUTHOzV3p3iXP4iv5AklT
         +Zv3XK2R/sK5OnBtoNNHQpza4NnU5g0/2hlYeBmduhMoBmcfWxfoY+JNmD2GxAQuxjf7
         4TZjFRUh6gzsXZmh0TIwMMn0xTyGE9JyW45a7Em5Ya5B+5H4jVTHjnhB+LKwho6j0YZ0
         M2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811059; x=1776415859;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XflkUukoCSMhqOUO0g2fDV+ZPKs+PxpzityxwM9G4Qc=;
        b=h8TfAqtRaeftiahkoFm+NVTK3GYykzFVP9Y9kuRBmrVQ64fLHcztmu5DFPi/Laquiq
         ihPFu1wRJRzEM2idPuhBmCFOXFhFKys6yRqKzXUgVp1vbYdg1MqLYpL2niEKf2moQGxJ
         oRNXSZIYf3KhW5XQ6dqk0kz8w/tR8FpZqj3VHKdoL9tirfSHZqL5OaMYLBC3nl9tFN4i
         rT/BPKDkzM28anCA7cXBj74jJYLTfUZe3311wdc2p+UYTqdukueWK4hdBB5qzgqxG3ed
         TtM/15nbCopPzDuKjnLq8Y8wm8Fcmgv0xZ5PvnnHedVULYInLNnWJjzhTZpr4nrp6ybh
         TvRw==
X-Gm-Message-State: AOJu0Yz1FLXREe6TsJ4RFgCCFXxvkEhl8Ab4+4iWIWUTjUzAnP93cs2Q
	YWHJOB958VPSMm56E+j7eTQSF0DxQafZU/Ep7k3anq/kQn6opt+2Uv7sRNM+cG9hyzeIDqhJhzT
	NHzqlsCs=
X-Gm-Gg: AeBDievbCf7ZkzRhpVYaRMjLTt6KRnJGIM0V8dA5uA8LFFg2DRa4SluHEaFbdK/DePP
	XhwCqqE/ASLWm8IoSeaiEQ9VaiPdsNtMCTFVCeiBlDS+qM5C9ykNXxkepZFEr1pSACxJGguYqDj
	qCrH34zlBq9/bg5DC6iuP6vzzYF6rpuNJgTiIzjvi02t3wJk0t+GYbcpzf5QraQkXpwyp4GGtxB
	g1Z4TsfD1SwFElSUDusvqIu2A9ZyanU3I2K3vSSIUTDeym4soD4WqHnSsY8KgeMtDE156IztSl1
	qtM+hFydBeFKOItEc9V1Q3B9GWWF5qIpVsr47p4Zkhh7k3cewb7jKIUM2X17AIFHdAPyPDv+LrM
	BOKHiRKcDr52qtcWQBMRHJI2C7M+Woo3wAklEf3fnUx4k/2/4GJGmJxfFj1wMFWLZxCCIoy3Yr8
	C68fv+TstFzcLh+DI6s+LrI9v3JX26n7YA5iq8s7TRqGGFwUWDSRPV7dcasX1zA1MsFotfWV62C
	sqaJjE=
X-Received: by 2002:a05:600d:4:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488d68ab2bfmr21652155e9.24.1775811059152;
        Fri, 10 Apr 2026 01:50:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:66bc:1b4e:df7c:7dff? ([2a01:e0a:106d:1080:66bc:1b4e:df7c:7dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a74sm6183589f8f.3.2026.04.10.01.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:50:58 -0700 (PDT)
Message-ID: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
Date: Fri, 10 Apr 2026 10:50:58 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.1
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

Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
for the Phicomm N1 and a couple of low priority fixes.

Thanks,
Neil

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1

for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:

   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.1:
- Khadas VIM4 (T7 SoC) Fixes and features:
  - Memory layout fixup
  - GIC register range
  - Model name fixup
  - PWM, eMMC, SD card and SDIO support
- Khadas VIM1s Features
  - Bluetooth
  - PWM LED
  - Power Key
  - Function Key via SARADC
  - RTC
  - Remote control keymap
- Bluetooth node for Phicomm N1
- Misc fixes:
  - Drop CPU masks from GICv3 PPI interrupts
  - Fix ethernet PHY gpio irq index for P230

----------------------------------------------------------------
Anand Moon (1):
       arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0

Geert Uytterhoeven (1):
       arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts

Jian Hu (1):
       arm64: dts: amlogic: t7: Add clock controller nodes

Jun Yan (2):
       arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node
       arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number

Nick Xie (11):
       arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
       arm64: dts: amlogic: t7: khadas-vim4: fix board model name
       arm64: dts: amlogic: meson-s4: add UART_A node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
       arm64: dts: amlogic: meson-s4: add internal SARADC controller
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
       arm64: dts: amlogic: meson-s4: add VRTC node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap

Ronald Claveau (10):
       arm64: dts: amlogic: Fix GIC register ranges for Amlogic T7
       arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
       arm64: dts: amlogic: t7: Add PWM pinctrl nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
       arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
       arm64: dts: amlogic: t7: Add MMC controller nodes
       arm64: dts: amlogic: t7: Add PWM controller nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add SDIO power sequence and WiFi clock
       arm64: dts: amlogic: t7: khadas-vim4: Add MMC nodes
       arm64: dts: amlogic: t7: Fix missing required reset property

  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  10 +-
  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 205 ++++++++-
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 468 ++++++++++++++++++++-
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   6 +
  .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      |   3 +-
  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     |  15 +
  .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   |  81 ++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  45 ++
  8 files changed, 824 insertions(+), 9 deletions(-)
