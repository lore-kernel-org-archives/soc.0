Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7B028C01F
	for <soc@lists.linux.dev>; Wed, 16 Jul 2025 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752651502; cv=none; b=GPZxlULc9skXaYU8gMpcvgg8/HawxfljsFXU5xaCaXfvg1TyNaqasdFQ/N6kQ8HN1DZuRP5cwOO/aktNZIFRvg38YUftPXgo6xl8z/IUbqg76rR24qDjnR1BB4Z8fqF0Zu4oKPRFDX2S3CiqiLBUD56wq+KI7Mwm5yY230tmYeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752651502; c=relaxed/simple;
	bh=zqj2WXvRznVAb+0N5curnFTpIfqMowCZorxpVkcw3oA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Sg9wAUm4fajfu9LYjPWazKKF9i5xH0iyz/KPT8DgWAde0PAQ+h7dD1GnAPAqoyoBgjGtM+hAr7fU4QCNQXm7/n/tciWSzAgO9pPkHokdHzXOVeBY77GCj9xtFuUh8hfpOnHS4pLdNANzmkqCuMaKL6szo3rdQCsblhbkXs811Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m5vB9Ga0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m5vB9Ga0"
Received: by smtp.kernel.org (Postfix)
	id 21C9EC4CEF0; Wed, 16 Jul 2025 07:38:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13C6FC4CEF7
	for <soc@kernel.org>; Wed, 16 Jul 2025 07:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13C6FC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso46800265e9.2
        for <soc@kernel.org>; Wed, 16 Jul 2025 00:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752651499; x=1753256299; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JTZyE17KIP8MeS2UO3NBP08211fLukiUHXp1mSFEsMA=;
        b=m5vB9Ga0FnyrxbAlD4z+RhUA1iFAhXKVBfJtgZ7kplb1wCjyc319Q8uIFt+LrUrOHI
         lxBrKRxsLDcb6LgbqZyka5Kno1XhzvfCtKMYb5DyyZ5KEih9ANj5vYm3ibVKsBDgmTrw
         abFjkUsig4TLgd0Q2a8SMJ5i2LFdEF1HJ5iS7V4fj3NAtB0wwWUqVV6mxR5ULAuvR/BC
         f5CD3vSWcMRGN9wGUgm9/25rBUU/JDdUbu/iUKSUlE7rmZ03DC5Fv+C2R4q7L0IPiRGQ
         tEZdKtkr/YNTyjUq9ysmVJamm1jFGsWRD0D8OQ6hLhIMn6smVnySXLzWEnrz03vAqcFW
         rq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752651499; x=1753256299;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTZyE17KIP8MeS2UO3NBP08211fLukiUHXp1mSFEsMA=;
        b=AqgTJySVaonVFwaeINWI8CIkCLxZBMrw5uHr7QO6Qe9xJmhjBThshBI++xglfgPCxe
         hnk7/NuOeRtrpcFM1IanNiUb5Ek7Nase9pl2DaZ8RqadwenFvvkWisXYgOElPbGvGSvM
         +F3SDvZuF4ct/dBgyEwgnVmqTsxR2Q/U5L73T3iyJPuPI4skhvkeaL1yu/1oPtoMBwek
         TWqUkDN756og2vX05dAxZNbOn1jOoWktVYp9o/w9kJn+arp5iAAgKnfHi0g8AIDKMRT3
         oFu2CxWPG3GP/i+Y2QKrU/7kYyWWG8jMPjyxH+ghEEHH1ExPqINvRa78O1EHtjllqeCk
         MYRg==
X-Gm-Message-State: AOJu0Yye4/TJ96KIKwGBBoEGEZbu8dcdQKfRXnfev6PXDIvWRoaoSwqC
	As9kJ0v/gMZxZe9iHYTfVbYpAw7lvkoMPldFqZgf4BQ2KUgMlSQV59Jk0F/ZT4BxBFSaAtz6sFN
	cvTHz
X-Gm-Gg: ASbGncs30yhi3D5j3x+hcDolDlX+ATQB+jkvmXbtlbLZJIKP4etDLkzQNeZXb+kpk6D
	0qziByQA6haXHbNbI0OgVhn1ZHIMeb0GihindttLnwhNzkYd2Yd96A6hiGsIqNPNEx7w/w8Qjfi
	al5p78ONE3MHC4FMqlOMMGJm/z+vf8wDssuyacdVldArUQPqMLwxBQsZWFN+mnygqgrXamoWEhU
	KJchQ02lCRiKSkTUXaxYkJeQzMOOGIT3qdMekqw5H1X61S8NfI7rnKwI9i6zjv3YqVOPiK3OTo0
	NI5UyjBabcHMeVoKQoee3FSsU52yTd/oARH9Vyy3TIsYsZU0sucesN6BT8ImljBsp7bomE5HFP7
	Zd5m2tRPYWA2xukgYhI+2OR5frxwkksjj0/3O/qXdxAhwFhRjDFDM6fwPHzq20+dYflL5LqufRt
	4=
X-Google-Smtp-Source: AGHT+IF5VHjUdfZNwYUlg6vQGhBqdvVW29xEpVXshvZF1iijy/MsoFJlMDLl1aBwa+n3fGJrEvN4ig==
X-Received: by 2002:a05:600c:3b29:b0:453:7713:546a with SMTP id 5b1f17b1804b1-4562f164b1bmr11491165e9.14.1752651499326;
        Wed, 16 Jul 2025 00:38:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:91d5:1399:613c:fd4a? ([2a01:e0a:3d9:2080:91d5:1399:613c:fd4a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e135sm17207431f8f.72.2025.07.16.00.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 00:38:19 -0700 (PDT)
Message-ID: <3d93b621-9544-4a68-85db-6f87a9e8fa5c@linaro.org>
Date: Wed, 16 Jul 2025 09:38:18 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.17
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
Content-Transfer-Encoding: 8bit

Hi,

Here's small but late PR for the Amlogic ARM64 DT changes, adding the S912 based Ugoos AM3
board, adding pinctrl support for new SoCs and finally enabling the NPU on the Alta
and VIM3 Amlogic G12B based boards now the kernel driver and userspace mesa supports
the NPU correctly.

Thanks,
Neil

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.17

for you to fetch changes up to 587c1c00f75565567d1f26a333a3392f7a21c28c:

   arm64: dts: amlogic: Enable the npu node for Alta and VIM3 (2025-07-04 17:10:16 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.17:
- Align wifi node name with bindings
- Add pinctrl nodes for Amlogic S7/S7D/S6 nodes
- Enable the NPU nodes on Alta & VIM3
- New boards:
   - Ugoos AM3

----------------------------------------------------------------
J. Neuschäfer (2):
       dt-bindings: arm: amlogic: Add Ugoos AM3
       arm64: dts: amlogic: Add Ugoos AM3

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: Align wifi node name with bindings

Tomeu Vizoso (1):
       arm64: dts: amlogic: Enable the npu node for Alta and VIM3

Xianwei Zhao (3):
       dts: arm64: amlogic: add S7 pinctrl node
       dts: arm64: amlogic: add S7D pinctrl node
       dts: arm64: amlogic: add S6 pinctrl node

  Documentation/devicetree/bindings/arm/amlogic.yaml |  1 +
  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 81 ++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 90 ++++++++++++++++++++
  .../dts/amlogic/meson-g12b-a311d-khadas-vim3.dts   |  4 +
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |  4 +
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 +-
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |  2 +-
  .../arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts | 91 ++++++++++++++++++++
  10 files changed, 371 insertions(+), 2 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts
