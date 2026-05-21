Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A363E1712
	for <soc@lists.linux.dev>; Thu, 21 May 2026 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369579; cv=pass; b=heLDNLp16/9asDaVp4KI/vZpdm1kF4hYT4rL5JK+grFlqdZl9hg9rWXKfnXuwQKXL4P5dZfEqQlPfXXL/dkCRZ5VZwsYfhiC4KlNKAaXKO0+9mjfd9ErAxruUZV5xAJRjPIsgNAFGb16nzS9O2QGUT4aDaUlvut4GZsq5+NUIDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369579; c=relaxed/simple;
	bh=3Kxc7rrN/OrFFcIiDAHnp1YaVXxQbzCGAXQIyb096Ro=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=T9IU03LqZERZflI3SXeEIgVSxJX0QlkELcSdqFwZ0x/+y7LK0STDvRPxVO4Qls2Tffa+Kau9zXR/Qi49UZ0kLTc6UstgtgcN4vxqalj3O9kvXym0hkMI3sVE6GWmp148h8uJbrZw4Dorxqgj4tY/oR+vAAbCi5pVCDbLHedgdow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b5pmUTIb; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5pmUTIb"
Received: by smtp.kernel.org (Postfix)
	id 205CC1F00A3C; Thu, 21 May 2026 13:19:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779369578;
	b=x2rexPQYTBBw0L+CbibvlgphugrIe4CU+LYFvjT5Efe0M0crkxu1CSoCDmXiGdTvwDFY
	 70INV8ac+M7RSRh8VLo8pYvyZv5JIChpUQ+vvVN/xnk2KILYTkU9Q2R22osIrP6iJfKXm
	 OSNvaTzPvhy7VAnFpYZs5rQb63tinuTlTLQ8r7wqY3sxqBFVWcMutsgS5+SbaUwMNOQEA
	 pwenPp0W3vCT/9VmaIc31+t1+lv4UdYM4XAqfPiKbCMo8jUlcUek6ojwof9Bi1dpkc4Fj
	 +xcAURpWjv8cNbxNaVF57Z4lzgcH8KEe2LlrEI2M9vetfDA7+LwEjawdPlDJRU4Ew9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779369578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:Reply-To:To:Cc:Content-Language:
	 Autocrypt:Organization:Content-Type:Content-Transfer-Encoding;
	bh=kVStZuaynsxldxI4z6f6e5rL63M/lihgHYjp99abbpQ=;
	b=LDWMH2shB8RzomCYgZfNc5+iNDaY1ahiACbuCwJQ1BFI+F9lGP6fLD8V1+PioypnpaSr
	 Ri1lbtPOZWovRf49helz3N1b8HS5eNowVXKeIPoaPZ+a8xTAx9yR6MzaI1NoFCfcER7O7
	 6b1yl8Pgo0Dc4OkoJ+Ffno9l6kdI9bWQ31kkpBPNAKEwcfFMg9D5bmcow7OikXTi/k99O
	 f/g8gRrhIz/4p7gu5BSO73DAPsCOmiBcedQ8ZWBN+5PPQWtEQpXaUL+q3n6uQ4mXR5v3j
	 1Rlpggrbh1V1QJI7Dec8xRnIv4dHblFNMf61OYwxNfeoVYPxckK4TxT+s9tTxBtJ5Sw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b5pmUTIb;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7387E1F00A3B
	for <soc@kernel.org>; Thu, 21 May 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b5pmUTIb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7387E1F00A3B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d75312379so5108069f8f.1
        for <soc@kernel.org>; Thu, 21 May 2026 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779369576; x=1779974376; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kVStZuaynsxldxI4z6f6e5rL63M/lihgHYjp99abbpQ=;
        b=b5pmUTIbrP4wQrz7AFtsbZXv5d4hIGqM/43FK/v3O4kNXB/JBnoYqRQbpNnDBYRTmw
         U2MkF2aJu8Ns3jEF8VCGqoFRQokTDHGRm4TF2Q5WE5hVV/nUv9G6jjaftlY2iDkKBNQn
         MuI+SjyMSda3BFByS+yvWi6puviuEVq2gUXMj1G+13poeyheMVpZKvWK0LAuunmkt+CF
         C1KNvqXYOItK/XrUzBzRQ1ypX73ZICvKSjQWCYG31uh2tY5FxRaQ8k49haR2Plrih+Dp
         qM6OZ7QvoJ3EIM41f7fXVOs55XaOF1aZqnCxsSFdjRmMEBJBEM7dLEsA4ZhPnJZ0UjqH
         WTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369576; x=1779974376;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVStZuaynsxldxI4z6f6e5rL63M/lihgHYjp99abbpQ=;
        b=XDvc2zsZXF4E0b5no7PPvoAMy30vn8D8pDpCjBfJEaUaNYgbF4b26GKTEGstfijIqi
         D3dLoqsFzZBtNhcW5d+3aI1AKR9AzVRnKUpvdPfmrwWMesEOaZ6GFRF3e+T0wPKwCv2D
         Ct3s0hjRv9wpkh+CgfNv1/ExggQ4CoNNwcZOXg2xrpSN5ChxiFAP/HBpvbjpyu0iGAjG
         gyzII4ZZ/pUUt5vYBRK7WrevLMJJ80XfwLbCNzl4Uv+17NVL8W5qabguug81sH8wCAr3
         6K3ke2Am+Itqrp+8PRATahVFx+kCxVdMQfhqJFGtQsR+TIhqd+SCYoo4aJXMin/YmQ+s
         oVyQ==
X-Gm-Message-State: AOJu0Yzh1yZ8mCUEXs+KPzK3WL02dHtklR3fnOeVB55XA5Z7GEWaHgZ0
	KQS4Ocs5i6O1EVER21kyX6L8nhr4g8+Xs0IdV+WdsscoBVEGbZPK2zG1+uOGlFU2hoJy3NkuTxm
	IIpR2
X-Gm-Gg: Acq92OHCOBpSOJ3ub+G/7Hu4GEpWr07M8LLCaGyW1yWPjV9ahCK+N9gjWaCnHQ6yMV0
	hY2Xni2Qm0bos7q75NIlWue0yiedLe+BDVqYtJOa52n0MnR8aFBXukv9nfiV+yxBLIsNI2CpZmS
	ISD4L+QgpuaKpLX0LVJ9NSNHd67W1UKvj4YtMipkwc5TpTVodtdtyZ5bhZABhxntyFTES46e6iF
	bbsNCZNTiuRaxeVYJ7SJYYZoW6ZL2e92+dh3XJyXqmcvnIrE1m9N/an2+OggX/Kf2qk0d1i1Dne
	8GHEKvWUelpN8+ArLD0yiEIU6z3ws8atfCrPHrgrNcUp2TzHzEFuMlu33U+Kcj9k5h8RLMrCnNr
	QOD4toR67yEt23/eopte43ZG3NJr9R5ojObtCAyaAfspH+d5Xn5VdAmCPtCdufpkU0N8EXkHtRg
	n7Blj97jmNkfxA14px2JNXUBWuhY03hOaQw2uRyNS5AGzcEav9MXSp5QbPUV3eJh4cLVGmgJcku
	4LgrI4=
X-Received: by 2002:a05:600c:46d1:b0:490:3d3d:805a with SMTP id 5b1f17b1804b1-4903d3d823bmr15928265e9.12.1779369575712;
        Thu, 21 May 2026 06:19:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b? ([2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92f622sm3169586f8f.24.2026.05.21.06.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:19:34 -0700 (PDT)
Message-ID: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
Date: Thu, 21 May 2026 15:19:34 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
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

Here's the Amlogic ARM64 DT changes for v7.2, contains improvements for the Khadas VIM4
and VIM1s SBCs, plus some additions for the Phicomm N1 and a couple of low priority fixes.

This PR is largely the same as `amlogic-arm64-dt-for-v7.1`, but I sent the fixes
separately as `amlogic-fixes-v7.1-rc` as discussed with Arnd, so this tag
`amlogic-arm64-dt-for-v7.2-v1` is based on top of `amlogic-fixes-v7.1-rc`.

Thanks,
Neil

The following changes since commit 174a0ef3b33434f475c87e66f37980e39b73805a:

   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-21 15:46:29 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git amlogic-arm64-dt-for-v7.2-v1

for you to fetch changes up to 43e6ece01ba673c3bd8dd1638bcd93827d254b3d:

   arm64: dts: amlogic: t7: Add i2c pinctrl node (2026-05-18 16:23:29 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.2 take 1:
- Khadas VIM4 (T7 SoC) features:
  - Memory layout fixup
  - GIC register range
  - Model name fixup
  - PWM, eMMC, SD card and SDIO support
  - PWM LED
  - I2C pinctrl node
- Khadas VIM1s Features
  - Bluetooth
  - PWM LED
  - Power Key
  - Function Key via SARADC
  - RTC
  - Remote control keymap
- Bluetooth node for Phicomm N1

----------------------------------------------------------------
Jian Hu (1):
       arm64: dts: amlogic: t7: Add clock controller nodes

Jun Yan (1):
       arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node

Nick Xie (9):
       arm64: dts: amlogic: meson-s4: add UART_A node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
       arm64: dts: amlogic: meson-s4: add internal SARADC controller
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
       arm64: dts: amlogic: meson-s4: add VRTC node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap

Ronald Claveau (12):
       arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
       arm64: dts: amlogic: t7: Add PWM pinctrl nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
       arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
       arm64: dts: amlogic: t7: Add MMC controller nodes
       arm64: dts: amlogic: t7: Add PWM controller nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add SDIO power sequence and WiFi clock
       arm64: dts: amlogic: t7: khadas-vim4: Add MMC nodes
       arm64: dts: amlogic: t7: Fix missing required reset property
       arm64: dts: amlogic: t7: khadas-vim4: reorder root node
       arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
       arm64: dts: amlogic: t7: Add i2c pinctrl node

  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 215 +++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 482 +++++++++++++++++++++
  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     |  15 +
  .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   |  81 ++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  45 ++
  5 files changed, 838 insertions(+)
