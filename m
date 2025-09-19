Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CE82E22A6
	for <soc@lists.linux.dev>; Fri, 19 Sep 2025 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267969; cv=none; b=ioTpv7dNCUXh06mWjYO6jSLJ9oV8V2qqldYdWawGe4a53akRDw9D/73ac4tyJBEpggHp52JL46kEXU2eGidGYsAQTjhX/tBVu+3d8Pt3nnpgAmYGjC86W37a9JZlJNEY9Ev0lAmwCFLEFzJet2x0kNpgpIm10wIM14Xb1D2Ao/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267969; c=relaxed/simple;
	bh=PCyLq210rQ8aivMQs4onNBfOrV8Q90v3g6UdwJvBW0Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=enJV5oJxvXLC29GNU++R9Bos4sTnVJlDiu6pBiS6t5F2JIa9yx8KSnKwms7XqAe1go/2xd552Irn8PU9z6Wt2GY90a3UzclYNGx/8kWhAzZgXGY21UTbPyj1DApeoxugHHf21Rq2YaISZkzkr29tW6XLTrSzAHVGO3goFq+iJuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZZgTg6oj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZgTg6oj"
Received: by smtp.kernel.org (Postfix)
	id D7AD1C4CEF1; Fri, 19 Sep 2025 07:46:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41B14C4CEF0
	for <soc@kernel.org>; Fri, 19 Sep 2025 07:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41B14C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso10700325e9.3
        for <soc@kernel.org>; Fri, 19 Sep 2025 00:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758267965; x=1758872765; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sj//8F4fTHzOhzOgZFY9djcOmaWCzdNmUbED0aVzyoU=;
        b=ZZgTg6ojntxYe/rli4qIFGQb6PafPsocsvGgKH9sX9CsaETt7J9/POeJF7yb9k4Whu
         JqJfmHGBlhsldX16NRedIUZb7+Kg2K1yHCQKFTkse42odCUDecrbf6VoYopFmoYf9Sfe
         iX3T5fXOpacbxuk0MKytmT6QIGFKBRomIEUbtOZc6OiRxNIUbVy6g32pzDVqnL1E7y/w
         6tGyL3TNZiz/L4DDNxZ2vQwIN+kik01gFQlp+Ns20/gTDQSjxyurElemKrJS/YWDYaUm
         ssFj+gCRU+rtqI4SWIkyPodEoVpkJvdSqImjVlrpTu9zEkN8MZ/BNIrfgsBc+gkcwL7O
         IV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267965; x=1758872765;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj//8F4fTHzOhzOgZFY9djcOmaWCzdNmUbED0aVzyoU=;
        b=dIf1ZhUjFfk12i+cr+lUsOQy9Cdhkhz2jPen2zm/ChU/gLw0rxCj4EKWM3m1Yos4cI
         ZOlLCKzWvfgZ0nUpK1AIERFiAGbxkpXXZvkKujsfjwf9JPKSRNZTBPrQyK9PBzHQ0qo7
         VQDkKnIpgn8stnpvtTsYh1Bo0g1wxH4YPx6078/UW4vLlCqbnrF9xMHSPyZ+RBjUJPjU
         xJhd/EDV+6kraLElCK21yfmI7EKvRrs5qpd6U/UrwDYPH5P6+SRx33zVyPA8V1wcCOXY
         mk7utWmhLbqxKHR0+ZYyOumqYJiQGB1qdRi7Ni08CkhIK2RyVaNDI3gL/fsL4UUc08CW
         iFiw==
X-Gm-Message-State: AOJu0YzcpIHmg9VGHPGYx6XKvmDJZG8NhP9N0bVGtCAPckh3cP3QRjh7
	qy5Oac2I2/5e0nl6u3/yHPpRVNrWr/KgI5rAtGWl0UOX9XJhliDX4aKoFcTO1PLGgnUWXZJ4wKV
	ftsUHw94=
X-Gm-Gg: ASbGncuh+zIdRaZEKmvHRVK+I2yfBc/XB5Y5+Yij3h9fnkYQ10kpiCchHqWF5oc7Ydf
	DtgAlNj76GGZH1F2kl0dtiIiiMKUftGtEWN7SsD8k3Ar8K1NBhdeF3FRMrsHhLHzBYdl10iljAB
	nEuWXq50u/WnV20FxEEF+n4ewozorXB4vDLeFf5vG4rXcdbswMCl9F4VZZprNv8hZaK+p5cblsg
	yHdhm2HsqsXALZZB0eB0X7aLywtavULid7Qg8WuL+vavNt9qqkONpkAejKS8wEb2qXjTjnKqYvt
	/gVdzGSo/TCrcMSUQU+PJ4Ite4La/7iq3h++WIXDOQrdUSZcEW2pb2WY8WUr+VnGUPBP6xz8JjM
	+Q7hJh9T9P+E3SUl5Zpykst1LvldH3euW22O+dEUCHXJSC4d76IC5Wx0wf5YEOY/B4mlUNbwx
X-Google-Smtp-Source: AGHT+IF1xyuhwXqnZwy0ko9KlFPIehOGJYLXMgJOucjyGCzOVvKO3TFQuawkjLcp2ZJOEerqdy3ZqA==
X-Received: by 2002:a05:6000:2dc5:b0:3ec:df85:351e with SMTP id ffacd0b85a97d-3ee7c55272dmr1797890f8f.11.1758267965437;
        Fri, 19 Sep 2025 00:46:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f? ([2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0740841dsm6625247f8f.23.2025.09.19.00.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:46:05 -0700 (PDT)
Message-ID: <d40e7e96-4a7c-4e4f-b36f-750c6525b95c@linaro.org>
Date: Fri, 19 Sep 2025 09:46:05 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.18
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

Here's the Amlogic ARM64 DT changes for v6.18, mainly adding cache properties to all
ARM cores in Amlogic SoCs, enabling RTC on C3, fixing RTC node layout on C3 and fixing
long-running issues with SDCard on BananaPi S905x3 boards and the Odroid-C2.

Thanks,
Neil

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.18

for you to fetch changes up to 663bfe77b6f70bcb33b2607e16c94fcb1029580e:

   arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability for SD card (2025-09-10 09:32:09 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.18:
- Add cache information to the Amlogic SoCs
- Add RTC node for Amlogic C3 SoC
- Fix PWM node for Amlogic C3 SoC
- Remove UHS capability for Odroid-C2 SDCard

----------------------------------------------------------------
Anand Moon (11):
       arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
       arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
       arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
       arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
       arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
       arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC

Christian Hewitt (1):
       arm64: dts: amlogic: sm1-bananapi: lower SD card speed for stability

Valerio Setti (1):
       arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability for SD card

Xianwei Zhao (2):
       arm64: dts: amlogic: C3: Add RTC controller node
       dts: arm: amlogic: fix pwm node for c3

  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 37 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 41 +++++++++++-
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 36 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 74 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          | 15 +++++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         | 21 ++++++
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        | 27 ++++++++
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        | 62 ++++++++++++++++--
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          | 27 ++++++++
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  4 --
  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         | 24 +++++++
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |  5 +-
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         | 27 ++++++++
  13 files changed, 385 insertions(+), 15 deletions(-)
