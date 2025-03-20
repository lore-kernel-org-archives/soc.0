Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4921ADA0
	for <soc@lists.linux.dev>; Thu, 20 Mar 2025 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742460174; cv=none; b=OzeqHtwPf+hvF66viFcLMJ3olPjiQzskQFTgZ3SP8pKtasj9B1iT6O88JoADWtrAFgahks6jNXqkOx596MxOC/C2yCxk5wSzHvOe22FFCQJzqJ1e7iTZwSZaXta6F0Qda/mfmsz29nSJgRpR8QGBdp9Lh28H2XwmsP8kBdAl/Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742460174; c=relaxed/simple;
	bh=WwxKjCErCuQZl38tCPAwlNXgw99ihsdcHxz40b3wASM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=jM0WNIMjOOIjsFrRAxQeyBB64FDLGjBYugP/Ls1Wt2sL052RFe49qTQrP8fEXwjO/ryLlwnhaX0ApcQmlxBqWMV43dKfXgDoLFKP6xt0KQ8mY5JeAu4G0hzr9U4LmLitR6B3xXD2VwhuIznW04t9dAqUUZTViskB2Dm4RluBQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEsH00KD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEsH00KD"
Received: by smtp.kernel.org (Postfix)
	id D0620C4CEF0; Thu, 20 Mar 2025 08:42:52 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B329BC4CEE7
	for <soc@kernel.org>; Thu, 20 Mar 2025 08:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B329BC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39143200ddaso257038f8f.1
        for <soc@kernel.org>; Thu, 20 Mar 2025 01:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742460170; x=1743064970; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0kwE+SJqtUvsUuOi4gOltpyOEmelfpfJunPkTYkz3ZQ=;
        b=FEsH00KD+rIqXAwBbxco3e1ezxz+w+wJOCpodfD9Dwp93sTKGfbwn9hECZBT8JqQ6P
         wyGSxcoQsdyPXMWRljitOtE/Atkaa+vwmOBn6seEJLmyUOhAntg93mDsOQZHIW8CrdkG
         cv3D/y4O/JWAPAnQVstRCSfkpBF+vbn9U3gMJdgYc+XBDQH6NlkKjK8luZEvPOYbByFE
         G9QSFRiPbdV3j7TV2jTjIw3Tvujmip8b2jK6ZCHfqdGAaMFV2JHhrs6R0UhKxpWokY1A
         qnFFyfQg1HvDIlRsFWHfzDJKhZ9yfL1dYOc7SkLwrQO7i6+rzcGUlDjtbsaTshMVWwvW
         X2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460170; x=1743064970;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0kwE+SJqtUvsUuOi4gOltpyOEmelfpfJunPkTYkz3ZQ=;
        b=CKNPFywToEW4B6BsS3a77/Ldg8aWhIJ/mcEniaxlaqcFcBxvxdNlRSlUDF6uqMjEg5
         dH4z2z+lVsXOmGhiIq58Q2iJbHUvz+ZuWMYpFWE5kxnkF30gzOntK0sZNRwoSnfTj1nx
         L/M33eptk5P3ezCs/vzGa+miLJjb8JFeit8Su/raDNWGVQAEHeHwnKQavhcChfk0Oglf
         X9GLeqoSNFGKx3FdOYS9X1pwuCjGeETubicTVPjrxVNFExLoTX/jr24pnYLD59R1Urc+
         AHJYx3cb4mkhQ3YFfriLiOvxmg3LpGsr6bqsjrNS70h24Ji6/qlmQFFSkvtcmzmT5IMw
         dZFw==
X-Gm-Message-State: AOJu0YzQ5RHsYDG2T1evtFu1y9x0e0TEdx+c3XhR+uRk+2wxwbbJLAWe
	2jlZlCHfWzNR/FMy0V6rdomIbAFkEEDMSoupnx+OjXfDDxEaA7E7EuWgw709P53uSWf3nRniOY0
	B
X-Gm-Gg: ASbGnctF+c74gW2cEXeJQGu1A6bwxamdManKNBjpNrljR4ApggW93b1EY675gvMxGPy
	fIYIqLEzyttpQu+r3QyxoPz7N0STq2avrgyhv1KcCfW2fpFAUcD96hUs9g119vuAGJ/qYJ5r21n
	N1pSrRLqB+S050rkfiZLpIHEt84jT3BdH8RhjEw2YIHuKdCa5sOPj/Z03VlSklbeoZEIPYCK+d4
	eXfeSWDpZ+02MZHlhk/V3cF4TFeiQhPZDAiJME+GLaDBOuF9HH3H3PfMW4wj9DsBcta38HQPBdF
	dnLZEVHFWl9ilmbSFOZQQ9mexxy6Xn10sj2cW7GwDFPASYeQ1wmZbv9/GE2UJYskxDmxY5A4eMQ
	ZSzVWwHCdNGHVoiHYv4EDQ+Sgbw==
X-Google-Smtp-Source: AGHT+IESwEI4bW3h8OovwlFgf3Y/NiHOlvqY+nT0rDadnVX8ifaJ6wjqBUoAfB++I5vFZuv52jMAuw==
X-Received: by 2002:a05:6000:1448:b0:391:3b1b:f3b7 with SMTP id ffacd0b85a97d-399739c93dbmr6175104f8f.28.1742460169903;
        Thu, 20 Mar 2025 01:42:49 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:41cf:ed29:6024:4821:e502:e016? ([2a0d:e487:41cf:ed29:6024:4821:e502:e016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6b37sm23398901f8f.37.2025.03.20.01.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:42:49 -0700 (PDT)
Message-ID: <f6fb1b2b-955d-4271-b772-0a75fdba1e48@linaro.org>
Date: Thu, 20 Mar 2025 09:42:46 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL v2] amlogic ARM64 DT updates for v6.15
Reply-To: neil.armstrong@linaro.org
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

Here's a changeset for Amlogic ARM64 DT, switching to the new PWM bindings
which has been in -next for the last 3 months and the driver was designed to
fully support the old and new bindings, and finally adding gpio_intc
node for Amlogic A4 & A5 SoCs.

I removed the pinctrl changes, since they can wait another cycle.

Thanks,
Neil

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.15-v2

for you to fetch changes up to 67c2799bf11fd0f1323579dead240bfda5b6a3b6:

   arm64: dts: Add gpio_intc node for Amlogic A5 SoCs (2025-03-20 09:31:41 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.15 (v2):
- switch to the new PWM controller binding
- Add gpio_intc node for Amlogic A4 & A5 SoCs

----------------------------------------------------------------
Martin Blumenstingl (3):
       arm64: dts: amlogic: gx: switch to the new PWM controller binding
       arm64: dts: amlogic: axg: switch to the new PWM controller binding
       arm64: dts: amlogic: g12: switch to the new PWM controller binding

Xianwei Zhao (2):
       arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
       arm64: dts: Add gpio_intc node for Amlogic A5 SoCs

  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 21 ++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 ++++++++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         | 24 +++++++++++++---
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 33 ++++++++++++++++++----
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |  4 ---
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |  4 ---
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |  4 ---
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |  2 --
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |  4 ---
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |  2 --
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |  4 ---
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |  4 ---
  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  4 ---
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |  4 ---
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |  8 ------
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |  6 ----
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |  6 ----
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 --
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  8 +++---
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |  2 --
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  2 --
  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |  2 --
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |  2 --
  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi  |  2 --
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 25 ++++++++++++++++
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |  2 --
  .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |  2 --
  .../dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts |  2 --
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |  2 --
  .../dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    |  2 --
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi     |  2 --
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         | 25 ++++++++++++++++
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |  4 ---
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |  2 --
  .../dts/amlogic/meson-libretech-cottonwood.dtsi    |  6 ----
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |  6 ----
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |  2 --
  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 --
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  2 --
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |  6 ----
  40 files changed, 135 insertions(+), 123 deletions(-)
