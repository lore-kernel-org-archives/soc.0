Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BBC1F9EBA
	for <soc@lists.linux.dev>; Wed,  6 Nov 2024 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900654; cv=none; b=EAX6A1XNVXYoiq2jaUtAA2LN7voJ/e7T46LMBgEScR4bxxI2UECGz3JJ73mpWtbhgHUyFMe8EIVhrBgK5T8thm5Y2ptiyglWHeSguag4X2AUfS3pPvAlLHEln+eRSx+I+4MTMuBQAufYbdcycyTqbXrVSDLcRodHcvaEyHkpq90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900654; c=relaxed/simple;
	bh=NE+UZNzgFFGQh39BsJFRBKNaj2RekgtSb0QOv385gSM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=oXwQQI+wiO3gE8n0VQuSlfqgWmhuU3m2YOzGYld+F2ggE/sRCgdrbiPY1wP43tK8q9rbCnpKy9k7LYhKuolAjEKuXQIucPhdLIrFPGK4xCv+VGc9Og093v3ov+BXf1tgumFtr/O/wL9XJDnD85m3CbuhYukfevjhmbouvpSPGtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UE6vXa3K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UE6vXa3K"
Received: by smtp.kernel.org (Postfix)
	id 12AA6C4CED6; Wed,  6 Nov 2024 13:44:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C71EC4CED3
	for <soc@kernel.org>; Wed,  6 Nov 2024 13:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C71EC4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso52708235e9.1
        for <soc@kernel.org>; Wed, 06 Nov 2024 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730900651; x=1731505451; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1t9SmRdC1grTnxYfq0WRsgynjzOVFKr29y6dkcaAKA=;
        b=UE6vXa3K42h7LFCQqiBsfsJOERp7iptiIQpzCNJDpoDrXy8BNa/2v10aYJxJq29cNa
         NHs+3T80k+2jQZKoegQxQtOiw3RhIRvOpcOGAI1GmcOksIxtZQoO4G8y/dI8Ddvm/WQ/
         FBrqxNVUOutxSYlWhy1l6R8n2Rz/ib69L4L1FlpPR1aUckppbAzMLUoSTZ32y5KwpKjw
         zHXhdPn/WAufcUCrxdUOlqwWQK7JvM7xL+F9/S4VI9cH0IDawCj+eM4pxd+ZEPuAe3eV
         /k/fu7TMQbyEvcpK15DS+7U8JMIQZ7fnH8fjtlxZspwtPj5qXsFohMRTOnC0n1MhxSQX
         39ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900651; x=1731505451;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1t9SmRdC1grTnxYfq0WRsgynjzOVFKr29y6dkcaAKA=;
        b=cnk1VLjlGtAai0HTNu0rLpr0acuaiq3ShfMm3k5r7kelHUHBoPJFWGjLROI6Mw8XUF
         UN/6BNhn12SLROH+WzrTevlJB5uyKAd0GeGISDuVD3XoqpujieJI/smLtoFiNWs2s8wU
         HMrSkG9mWq26KFJtWGPoyupLT5i2w2kbC/2PgQCXBEOhUjF4KtRpxwZlgwZECU2pHbAa
         MEmqgL1ucUZ4gyW/YZuBGistK82hoR/dWK2ZAasrfyXdYqsILvPxfn4XPbxs3yoOlbob
         k5WlsljzwVCN1EG5AKG4d/zCAU0rr0c68c4fLC/mgC3VOURZV9mZIUQOh1dz2r9n2gTA
         4nDA==
X-Gm-Message-State: AOJu0YxgoqZR2cN4302zS/PJxvOazViRAJjxLeWxeMwGgPaNO8nlIwxR
	2wzS5AbsDn6I2lJX1TtZjJUvyHiRcHEU7FxgHd2Kzu0+a+1gcfmFNdFI98MLkkfuPIOu/DhOxDE
	bS90=
X-Google-Smtp-Source: AGHT+IEDfXHPYnEzdKdGDOIx5isWt6UJom2MOYrbNvWHKRq/DHETWuaNiRBX5ymPlQgTN2VRGVjI+g==
X-Received: by 2002:a05:600c:524c:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-4319ad24a7fmr381006385e9.29.1730900651357;
        Wed, 06 Nov 2024 05:44:11 -0800 (PST)
Received: from [172.16.23.252] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6ae726sm22960195e9.3.2024.11.06.05.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:44:10 -0800 (PST)
Message-ID: <ffaa3755-8c5d-4fc3-86bf-9129d3889bff@linaro.org>
Date: Wed, 6 Nov 2024 14:44:09 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.13
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

Here's the first set of fixes towards fixing all bindings check errors,
this set + the dt-bindings fixes picked by other subsystems fixes most
of the errors.

Thanks,
Neil

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.13

for you to fetch changes up to 2b901e9ef05d84e99582607e85393a6eba0e2363:
amlogic-arm-dt-for-v6.13
   ARM: dts: amlogic: meson8/8b: remove invalid pinctrl reg (2024-10-17 10:21:32 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.13:
- DT fixes to pass bindings chedk, including:
  - fixing nodes names
  - dropping meson6 ATV1200 board
  - add missing properties

----------------------------------------------------------------
Neil Armstrong (12):
       ARM: dts: amlogic: meson6: fix clk81 node name
       ARM: dts: amlogic: meson8: fix soc thermal-zone node name
       ARM: dts: amlogic: meson8: fix ao_arc_sram node name
       ARM: dts: amlogic: meson6: remove support for ATV1200 board
       ARM: dts: amlogic: meson8b-odroidc1: fix invalid reset-gpio
       ARM: dts: amlogic: fix /memory node name
       ARM: dts: amlogic: meson8: use correct pinctrl bank node name
       ARM: dts: amlogic: add missing phy-mode in ethmac node
       ARM: dts: amlogic: meson8-minix-neo-x8: fix invalid pnictrl-names
       ARM: dts: amlogic: meson8b-ec100: add missing clocks property in sound card
       ARM: dts: amlogic: meson8b-ec100: add missing gpio-line-names entry
       ARM: dts: amlogic: meson8/8b: remove invalid pinctrl reg

  arch/arm/boot/dts/amlogic/Makefile                |  2 -
  arch/arm/boot/dts/amlogic/meson6-atv1200.dts      | 33 ----------
  arch/arm/boot/dts/amlogic/meson6.dtsi             | 73 -----------------------
  arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts |  5 +-
  arch/arm/boot/dts/amlogic/meson8.dtsi             | 32 +++++-----
  arch/arm/boot/dts/amlogic/meson8b-ec100.dts       |  8 ++-
  arch/arm/boot/dts/amlogic/meson8b-mxq.dts         |  2 +-
  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts    |  4 +-
  arch/arm/boot/dts/amlogic/meson8b.dtsi            | 32 +++++-----
  arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts |  2 +-
  10 files changed, 43 insertions(+), 150 deletions(-)
  delete mode 100644 arch/arm/boot/dts/amlogic/meson6-atv1200.dts
  delete mode 100644 arch/arm/boot/dts/amlogic/meson6.dtsi
