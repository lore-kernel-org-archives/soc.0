Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA6525523C
	for <soc@lists.linux.dev>; Tue, 13 May 2025 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131517; cv=none; b=BQvgTOkFxOZV5ypzV+5H8uz4ZT743cq5L5gKpRjw2SClq9KfB2d+W6o6hLDTo7u6uCWHo2hPnTWCVlcpjfns7ngxFV0aeZuHXRHQdOAT67YcImdE7olJ7fpif8r2VtNTSi0W/mfZOrN6NWR0RrnY4WXqu7L/qw7hyRQGzNDu4Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131517; c=relaxed/simple;
	bh=9uhQCusVzrpJrxpxq7u0aMvdeuDozsO8iTOKYTN4dvM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=tJfahHRTmDNp86XijI3gujZMn3/BAxq7uQ1c5Np4sufYaYkgYL4vypYAv7m8LCgnRLV/c+4GM+keAllK9qbOiIxAC9X2aABkgYuYQzmoZV1gnu5IhM1B1YFUYBPx5BRV1iKhaiSKgw5iQP1yQ88NyAa0aEclq/c7sAKGxgl++dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jf96U9g8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jf96U9g8"
Received: by smtp.kernel.org (Postfix)
	id 2DE12C4CEEF; Tue, 13 May 2025 10:18:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0E18C4CEE4
	for <soc@kernel.org>; Tue, 13 May 2025 10:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0E18C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso54254035e9.2
        for <soc@kernel.org>; Tue, 13 May 2025 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131514; x=1747736314; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbgIPmxFtVM1BGwhXr/tVxdvgWwhEB3gww1YRaGjATo=;
        b=jf96U9g8F2lucn6E9XYK17fOB6cQ3jcMwY0h8MvAnb2bpdjOV/a18sZ3M4DkHn0mT5
         1BYVxh+7sLcngtSoIHhTiiSwNPtQ+byd6YcwrHxgcBkrnOzPzPtxIqKtX9StZiAJ7Gcc
         nWowhxeohrmcQqJ9OmwamjpnRVrQDsVUcPJoUscsbSck8kDgN7RXVXe+gvNXp8Tw91yy
         MBaYuInkm2aDOHoVNn93GoINI4oMqqa8frU1pKRl6pVUKWFzlf8VKHsqNwiGbC4VYErH
         gVfIx2cxzedLM9gOAs6g5KliCk/G4VvuDiUq23Qxhucj8D8trMaCs+kbdf6aFM6IE7ex
         NbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131514; x=1747736314;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbgIPmxFtVM1BGwhXr/tVxdvgWwhEB3gww1YRaGjATo=;
        b=i3KqT41hpCBH4hXAXplFqDwhv17PB0ri2kOCNLb9nwN5OwacFhJEeodYSKCMhfSnU8
         vGEYmjKi4E0+b4H1KVIpvgLh5I9s2BBL/YpGbiiYwTPxQNNth/Y8SmHK0eo5+UbT2svY
         zuQtu0kdDXduBgE1yEmepoRNzWkLzjy9UE/v/2TFa+WYvXmD2cQr0gwHL9Q7TZSoRBpg
         29bBic+1z8GCbj++6eKiyzktGUHUpeUCp8iDUJB8iUzz44zAX1pKDxgxMjQwFzdOPaQv
         r9ny4dV5uBL3SQFRwb2IfVF7M8IH6yJ2uLolTfcBxfMvp0IIOp9TIstDkhTswWYW9EuD
         qvKg==
X-Gm-Message-State: AOJu0YyPnAXPQI7/BEvAxfcbufxFNM8Tx765u2VI4zYlNr+hsaV/riK3
	L1Mc9LEpQjq3EBM4+//kAmtDqtvo6e6FSaaKLS7iHO1mnxEPu4H8QTRuUE0ojYFKskICpwx6Unt
	Q5ZQ=
X-Gm-Gg: ASbGnctUVoH37wIs/En2IPS5qLfO576udEbwSRyiflsHUHAorTfAFk2e3b3kHk2wMGl
	L+x2NuFcmGOojesWN9lktjEq2TBTD4Y2Tki6tqFQCQWTTwXdgBOhSgMVW6p/JNPnaZEj4nCOsCK
	NbYLeAxRLeuKsTGwbFl73PQINZNlu4cyN9UnOQiMdgjFsKnRX8FnSIgHekuuctcJkz8Yfp44n9e
	MNzXRzXIqzzQFRCji/E8tNOG/S0RiYtOevR+osLg/yh56jlJrTd5D9n894K+hy6vuF2D1toY6WL
	TrXv+akIey0nvqLeN91zwwilAN6JezLPtQa3p7YUIprgA2EbU96xqfgx4zSLpMZDw72zWvG++cO
	C7B2tOX9z9x1bLMS4zJ7ICns=
X-Google-Smtp-Source: AGHT+IELqlGYEyz0bgUWVEOHjILw2+jZZTXNzra6IJ+FQuqp14XzoRo/D2dnZ8V6LTyFM6eKT8E8lQ==
X-Received: by 2002:a05:6000:2509:b0:3a2:133:b1b2 with SMTP id ffacd0b85a97d-3a20133b622mr9093752f8f.31.1747131514243;
        Tue, 13 May 2025 03:18:34 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde0esm15899431f8f.18.2025.05.13.03.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:18:33 -0700 (PDT)
Message-ID: <5f7d3fa4-2d9d-450b-b384-abdd903284dc@linaro.org>
Date: Tue, 13 May 2025 12:18:32 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.16
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

Here's a quite large changeset for ARM64 based Amlogic SoC introducing pinctrl
for the A4 SoCs with new bindings, UART RX/TX default pull-up to avoid issues
with debug uart connectors, same for I2C on GXL based boards, finally SARADC
support for the S905L board, clock measure support for the S4 & C3 SoCs and
Reset support for A4 & A5 SoCs.
The new Amlogic S6, S7 & S7D SoCs initial support are introduced with the
corresponding Reference Boards.
Finally the S805Y Mi TV stick, known as xiami-aquaman, support is added.

Thanks,
Neil

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.16

for you to fetch changes up to f0911f29478992f37e91c208fe44c2ea5b378b61:

   arm64: dts: amlogic: Add A5 Reset Controller (2025-05-05 14:37:43 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.16:
- Amlogic A4 Pinctrl support
- UART RX/TX pull-up pinconf properties for all SoCs
- SARADC support for the S905L SoC variant
- Drop clock-latency in CPU node
- Amlogic clk measure support for S4 & C3 Socs
- Amlogic S6/S7/S7D initial support
- I2C default pull-up bias pinconf property on Amlogic GXL based boards
- Amlogic A4 & A5 Reset Controller support
- New Boards:
   - Amlogic S6 BL209 Reference Board
   - Amlogic S7 BP201 Reference Board
   - Amlogic S7D BM202 Reference Board
   - Amlogic S805Y xiaomi-aquaman/Mi TV Stick

----------------------------------------------------------------
Christian Hewitt (1):
       arm64: dts: amlogic: gxlx-s905l-p271: add saradc compatible

Chuan Liu (2):
       arm64: dts: amlogic: C3: Add clk-measure controller node
       arm64: dts: amlogic: S4: Add clk-measure controller node

Da Xue (1):
       arm64: dts: amlogic: gxl: set i2c bias to pull-up

Ferass El Hafidi (2):
       dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
       arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

Martin Blumenstingl (5):
       arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
       arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
       arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
       arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
       arm64: dts: amlogic: a1: enable UART RX and TX pull up by default

Rob Herring (Arm) (1):
       arm64: dts: amlogic: Drop redundant CPU "clock-latency"

Xianwei Zhao (7):
       arm64: dts: amlogic: a4: add pinctrl node
       dt-bindings: arm: amlogic: add S6 support
       dt-bindings: arm: amlogic: add S7 support
       dt-bindings: arm: amlogic: add S7D support
       arm64: dts: add support for S6 based Amlogic BL209
       arm64: dts: add support for S7 based Amlogic BP201
       arm64: dts: add support for S7D based Amlogic BM202

Zelong Dong (2):
       arm64: dts: amlogic: Add A4 Reset Controller
       arm64: dts: amlogic: Add A5 Reset Controller

  Documentation/devicetree/bindings/arm/amlogic.yaml |  25 ++
  arch/arm64/boot/dts/amlogic/Makefile               |   4 +
  arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     |  93 ++++++++
  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 133 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     |  95 ++++++++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   8 +
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   5 +
  .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   |  42 ++++
  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  97 ++++++++
  .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   |  41 ++++
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  99 ++++++++
  .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts |  41 ++++
  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  99 ++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   1 +
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  12 +-
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  10 +-
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |   4 -
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   4 -
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   1 +
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |   6 -
  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |   2 +
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   6 -
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |   6 -
  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   6 -
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   6 -
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |   6 -
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |   6 -
  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  |   2 +
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |   6 -
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  10 +-
  .../dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts | 262 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi   |  10 +
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  22 +-
  .../boot/dts/amlogic/meson-gxlx-s905l-p271.dts     |   4 +
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   5 +
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |   4 -
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |   4 -
  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   4 -
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   4 -
  .../dts/amlogic/meson-sm1-s905d3-libretech-cc.dts  |   4 -
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   4 -
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   1 +
  45 files changed, 1097 insertions(+), 119 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi
