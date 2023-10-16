Return-Path: <SRS0=eUZ1=F6=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3171CDB465
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 08:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA008C433C8; Mon, 16 Oct 2023 08:40:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7BFFC433C7
	for <soc@kernel.org>; Mon, 16 Oct 2023 08:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7BFFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40572aeb673so41605625e9.0
        for <soc@kernel.org>; Mon, 16 Oct 2023 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697445648; x=1698050448; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9UcWuUZM8+p3HcLlQfoaT/bye46PVROxoSbbOHkcbzE=;
        b=OG0YHSaS60zeXgXs0ZUlCEeXxi/cx1wHr3UcmVbiFRXwpzPzh7VvFkILtZsx9QCMoG
         z0XENNS+m5DCi30SGHcJ5tqw/F/WvuIvJJKt0DXNBxP+trEhZLssfOLmd3Tgoa+pkv4e
         xmaQylCztQYZrPnNLKzRVfpFDwCb3f18oxTuBAR3EgfQmtx+426fgEEO1hbwJOHhtOUI
         BC6679SBjPTWirnTKiNh01EaEG1RCgGG2hCixRAeVeujVz2YjQ1R05IsRowNON8pxO/f
         t3P8biVQzNGdZgVw/rki+7FedESp5YXjx52RnOE9NubcUdMhL8mSxeBUOXjK67nQe4i/
         zEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445648; x=1698050448;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UcWuUZM8+p3HcLlQfoaT/bye46PVROxoSbbOHkcbzE=;
        b=xM5dkPiEk4uR6tUeKTIkeOzdsGnF9RyUqmaSHoWwMNz4fMHUPOl6zeIhMImpkp4Vb3
         1mbinjzg/awlyy/W3okaSss3hptoOprwOpE/PwbuGRZhvuse/0wg49G1Mv5b43MRcYcb
         rfd94UsmbHv43Vs5UMYMW8ZPoabQEV0jriXJ7DjoIzOob8gmXwhsR16YHyCRYDQrEeBR
         sX59zV4HtmkGsZTlpeLCq9olWVL+g0OA3p6JodbXuGw/LkOi2GvZUR5FT8CMc/EQ8mMH
         LkToayVwgqXxiszGmissJeeZmV+8pZo4RbnCoDmaxtJpEBdcP2nbJqAm7qSc4kSueFmZ
         b1lg==
X-Gm-Message-State: AOJu0Yz4QqcJzci2lBbyzySXGkXs1o8awDL0SILUVBdkl8KNSm3skMeY
	G4ZCkMY0JdJ68ZOrjZJzl1XxoYU6HhTDI+p1e9bN5Mkt
X-Google-Smtp-Source: AGHT+IF1vtPzMqR2x0FMclW36S55OZY3Pajjd5WNGqVHY5t12WAkO6ICGAq+Wxt+RnIzadR2xUzmRQ==
X-Received: by 2002:a7b:c854:0:b0:401:b53e:6c3b with SMTP id c20-20020a7bc854000000b00401b53e6c3bmr27462213wml.6.1697445647919;
        Mon, 16 Oct 2023 01:40:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130? ([2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405959bbf4fsm6463999wmr.19.2023.10.16.01.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 01:40:47 -0700 (PDT)
Message-ID: <2e08bd06-09e0-4352-8207-bc3b5d26fba4@linaro.org>
Date: Mon, 16 Oct 2023 10:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic defconfig update for v6.7
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
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic Defconfig changeset for v6.7 enabling drivers that are
used with most of the Amlogic based boards:
   - KEYBOARD_GPIO_POLLED=m used to support buttons on pre-G12A boards, the old
     SoC do not support dual-edge gpio interrupts, so we rely on polling instead
   - KHADAS_MCU_FAN_THERMAL=m & MFD_KHADAS_MCU=m to control FAN over the MCU on Khadas VIM boards,
     those boards have an on-board MCU that controls (in addition of boot stuff) the FAN pins
   - MEDIA_CEC_SUPPORT=y & CEC_MESON_G12A_AO=m to enable the CEC bus
   - RTC_DRV_PCF8563=m to enable support for RTC on most SBC boards
   - VIDEO_MESON_VDEC=m to enable HW Video Decoder
   - MESON_DDR_PMU=m to enable DDR PMU perf driver on G12A & SM1 SoCs

Neil

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-defconfig-for-v6.7

for you to fetch changes up to a23bfeda86239d29f18a149a7e658cc3d4e5ef8a:

   arm64: defconfig: add various drivers for Amlogic based boards (2023-10-13 09:40:32 +0200)

----------------------------------------------------------------
Amlogic defconfig changes for v6.7:
- add various drivers for Amlogic based boards
   - KEYBOARD_GPIO_POLLED=m used to support buttons on pre-G12A boards
   - KHADAS_MCU_FAN_THERMAL=m & MFD_KHADAS_MCU=m to control FAN over the MCU on Khadas VIM boards
   - MEDIA_CEC_SUPPORT=y & CEC_MESON_G12A_AO=m to enable the CEC bus
   - RTC_DRV_PCF8563=m to enable support for RTC on most SBC boards
   - VIDEO_MESON_VDEC=m to enable HW Video Decoder
   - MESON_DDR_PMU=m to enable DDR PMU perf driver on G12A & SM1 SoCs

----------------------------------------------------------------
Marek Szyprowski (1):
       arm64: defconfig: add various drivers for Amlogic based boards

  arch/arm64/configs/defconfig | 8 ++++++++
  1 file changed, 8 insertions(+)
