Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEAB17D355
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742228028; cv=none; b=bOZ3IxNHnpV8AkrONS5+SXkmAWYYEzcpu8HYrILK5DWDeNGD0w1waA1N3xf4LC6oAGTtlsO3zBuFw1EZkOVMU/KC3suXnCg5Gp8lwau9QWjjdnXr9LFsyOrmEy9omw5i8ukdFeS4jhUIxlWypCDmI7vOe8SNWIDxzboacS+MNVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742228028; c=relaxed/simple;
	bh=IRqPLjU5WT8Xey+X20kjkv/yQbUvn5bHIcF0L4WJ0nE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=iW6FiFCf1F9Z8mhBbAbjQMA/DgNCHU2k7DpITYJigGlbosU/gvWx5YqESTrI3x7RjWw23DoZvSJvpYhNGxpI7CTih+o/GIGf2ijz4EjfpIM1kP9J7RkkxB9HkWCtQ4aVCqznw+S5GZZd/aVqJiZhbmt1aJCUOLok1/yiGzaUT7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tcFBxSAG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tcFBxSAG"
Received: by smtp.kernel.org (Postfix)
	id C15E9C4CEEC; Mon, 17 Mar 2025 16:13:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C8A0C4CEE3
	for <soc@kernel.org>; Mon, 17 Mar 2025 16:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C8A0C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so16808415e9.2
        for <soc@kernel.org>; Mon, 17 Mar 2025 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742228025; x=1742832825; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3Q78GCQxaQzQ0+b/W0JORUc7kRo1vxatGamr7JrCU8=;
        b=tcFBxSAG6BMFsebbIViVRjujjufRJeghVGC79N1hP+49se1KRd6bMSURbhzQtJFN5V
         QCh00Eh5X6ffQLKfScYrqwwhx9s6kl94wBbLR1Vul5zziauI4etkNNK2CK2cx3DBHCef
         mDtvJFpsUDf33Lpmqkn2x0bNVV/LwPGOT76ruF7lZ5w9ccYQDv7SUMfTW0KFGhh9k8nI
         TwGcdXOQyibsrBZitt3So/k0mw1QKC+jnBq9OaYOYtqNwxqvb8gn2LlXUt30A6ye5Cda
         gIxknk5/Mn2+T8R4qI/kPZoYv3Z7/ONUXbCF0u9DJr1BJrzleLD3ziJ/lB6+2RIMRVZe
         vzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742228025; x=1742832825;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3Q78GCQxaQzQ0+b/W0JORUc7kRo1vxatGamr7JrCU8=;
        b=cR7xPS95UiCpn4hVo6bZyp4BCOWUTr5E6depSL5iTYW/gV/TbBhZbDomtkFcs4DksJ
         Gcd9Ad7z+F1oJaLW9654o2VDGYFruI88+MRk144Y1o+useNff12vvdoBs/GQvrRjygeI
         4fvWa99/IAeZbVUXJy3cUopM5eE859iOCfnm2IqkWbE8IluPKxkuZj7FL8ItIxWvRTEb
         kOqjeAA8YpfYzO03Gnzg26cw/SamMDHjYcFoTPpFz/1ziJeZlpWf3j7VXzpRUrXacixr
         R3FP8+ow5rJaKkFyX8P+saIOiZNFZu6qacdGKn2PAx8lPavYWxoWryymlp4b8xdstWSE
         62vg==
X-Gm-Message-State: AOJu0YyK0HKqitDG1ALQhWfoeUo5HxxYmauIeHfR9AFH9cmB0SVMbJ0Z
	AN106I4PbRQ1IGry+vwVRMvb2LvwZHpxVian74DFQ0+JjeT+03bQYxG+ovnTJ9mCV0QojONf736
	d
X-Gm-Gg: ASbGncslcDGirmd87GxWSdQXkUSvf3tOHQcPw6Qj6/hmqd01gxq/5jh/0vUaVo/UTjM
	ieiV2f7Ljgg7UCJGpqyODdioAqKJpqZXeSZ2cc2wM7LfNRc1HBaD81C16/mct5uIUCKZKShJRvu
	apiPbJ/OsSn1WUMo/kDgVJfUbABtBnyEQy1DPbyfVZbRsQwmuB4RDnRPGuV48vNwD/Dsd5l2ujt
	STG9Y9nzZ+LUGZTc8iHAhghoePtJGeq+53Gks8apa+7orvxk9Xje7unnP3gY+R66PhbAzv+kuS4
	JmduFJ9vcRUvZKhHuBRWa+tOQ9fgvSYDsk1NBQ30QNngdqjYtj18+OP+1iVAwghMbyxsJ04TAc3
	bzlKNkoABQxN1wuz817snx7YC4rV7COvh
X-Google-Smtp-Source: AGHT+IEgKKfqkoMTMNNyJOIvZMFmniBpdMldb9buXiNIZUZe25GcX5FBNKsqJaRSJPGODxAdF1Pg/A==
X-Received: by 2002:adf:a456:0:b0:390:df83:1f5d with SMTP id ffacd0b85a97d-3971f4116ecmr12318997f8f.35.1742228024672;
        Mon, 17 Mar 2025 09:13:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1a77:b55f:a550:458c? ([2a01:e0a:3d9:2080:1a77:b55f:a550:458c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm108830115e9.11.2025.03.17.09.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:13:44 -0700 (PDT)
Message-ID: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org>
Date: Mon, 17 Mar 2025 17:13:43 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.15
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

Here's a changeset for Amlogic ARM64 DT, also switching to the new PWM bindings,
adding pinctrl support for Amlogic A4 SoC with a brand new binding style then
finally gpio_intc node for Amlogic A4 & A5 SoCs.

Thanks,
Neil

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.15

for you to fetch changes up to 454e0353b226a47f3c3369b17c7a4893f74e29cd:

   arm64: dts: Add gpio_intc node for Amlogic A5 SoCs (2025-03-17 08:38:58 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.15:
- Add pinctrl support for Amlogic A4 SoC with new bindings
- switch to the new PWM controller binding
- Add gpio_intc node for Amlogic A4 & A5 SoCs

----------------------------------------------------------------
Martin Blumenstingl (3):
       arm64: dts: amlogic: gx: switch to the new PWM controller binding
       arm64: dts: amlogic: axg: switch to the new PWM controller binding
       arm64: dts: amlogic: g12: switch to the new PWM controller binding

Neil Armstrong (1):
       Merge branch 'ib-amlogic-a4' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into HEAD

Xianwei Zhao (7):
       dt-bindings: pinctrl: Add support for Amlogic A4 SoC
       pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
       pinctrl: Add driver support for Amlogic SoCs
       MAINTAINERS: Add an entry for Amlogic pinctrl driver
       arm64: dts: amlogic: a4: add pinctrl node
       arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
       arm64: dts: Add gpio_intc node for Amlogic A5 SoCs

  .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  126 +++
  MAINTAINERS                                        |    8 +
  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  139 +++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   12 +
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   24 +-
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   33 +-
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |    4 -
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |    4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |    4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |    2 -
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |    4 -
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |    2 -
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |    4 -
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |    4 -
  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |    4 -
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |    4 -
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |    8 -
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |    6 -
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |    6 -
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |    2 -
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |    8 +-
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |    2 -
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |    2 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |    2 -
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |    2 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi  |    2 -
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   25 +
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |    2 -
  .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |    2 -
  .../dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts |    2 -
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |    2 -
  .../dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    |    2 -
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi     |    2 -
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   25 +
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |    4 -
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |    2 -
  .../dts/amlogic/meson-libretech-cottonwood.dtsi    |    6 -
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |    6 -
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |    2 -
  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |    2 -
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |    2 -
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |    6 -
  drivers/pinctrl/meson/Kconfig                      |   11 +
  drivers/pinctrl/meson/Makefile                     |    1 +
  drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1053 ++++++++++++++++++++
  drivers/pinctrl/pinconf-generic.c                  |  130 +++
  drivers/pinctrl/pinconf.h                          |    4 +
  include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   46 +
  include/linux/pinctrl/pinconf-generic.h            |    4 +
  49 files changed, 1636 insertions(+), 123 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
  create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-a4.c
  create mode 100644 include/dt-bindings/pinctrl/amlogic,pinctrl.h
