Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9359F31A051
	for <soc@lists.linux.dev>; Wed, 26 Nov 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146605; cv=none; b=AhXtTvrz2+C4lVjfEvHvj1HQLD2ZTVm4ZYeKLEPAsUojETjIFJS18SNEP6XIsYQUVpOH6w6c9xdmh5f6ka/qo4nn7QevJuRjJD/AnwX3bv74D5rdLOY5XwHs+kbPl7EQ0NVqqsoNF/NS6Rxo6GNLCOcGD6LlpCuLm9CDldSV5Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146605; c=relaxed/simple;
	bh=kxeLmiAF8Cd0nLuoF+tB8ECt9D9vi0AAPf9/Slhg46A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=gO0kRFVP9XD8QCWiXBEWMC74ZK8sXUxSUHd7LgTTtZllMfH8zhyxaJtOL0cKRRB465U1ZBihP4FUJYzvdj0Ol7L/bdgBKLvTYnKwdmmyKhzXDLmRGW4i8uj3DRcpJi2bwdpx3uqtn2idomWyPOza77OsmguWPoGKBhCQstQczmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ziXMen7D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ziXMen7D"
Received: by smtp.kernel.org (Postfix)
	id 37870C116D0; Wed, 26 Nov 2025 08:43:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F8AEC16AAE
	for <soc@kernel.org>; Wed, 26 Nov 2025 08:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F8AEC16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477563e28a3so4131195e9.1
        for <soc@kernel.org>; Wed, 26 Nov 2025 00:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764146602; x=1764751402; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XruInUkMDiRfUB8yo5/J+YoWJdFLwmVpCDCt0tsy4IU=;
        b=ziXMen7DqxKmrB4+RhtF+r+FIaeAUfTdK0MEVmhcvYUCbkv5QXX7sN1RjJK7nKe/mz
         Uzxr5WcNoZRADbF1j4jTyIw6A5VD5imuLqmRwd3UoSGYrFrVpLlbWYHCXGNg70TMELFZ
         BKABN7FvOFj+6jUOB3hmcrQ3NR/5OvAzYjA+tyxdeI35naOLds7QjiHmJFbEoliLe6mK
         MmpD5GTrTwfy/iXMnXr/KkMtnbFZM6uB7ZmwcAcUs5dXhvT4EqDmLcaYqduNMIadYp27
         6CCpYr6KF17SgZu6HDVglOjCWYky+mGFMQ+3K2Cp5GV0xSnhb1NzLQLkRsy0TCO1xGTW
         g0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146602; x=1764751402;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XruInUkMDiRfUB8yo5/J+YoWJdFLwmVpCDCt0tsy4IU=;
        b=BOOAJ2ODNeBFXRrz0xxrNqao57lh/V4KV8WBlc81XirsFD5K56Ph3kZOzwpB3Y+aWh
         NwoySc+5IhF6tTKZLXo2mKxLiFf66GHkZz2Yhwkxnte97mtEia9hmXb2xUQvzp319bE/
         XdPVV+MPiBesF+SI8WgcJSajT05vXzv2fzMhVexsktSz4zto4kuoVGhnhEU+/3kGE4jg
         pRYNdOIQA8qmzMAk7Zc2F4bS+ALB1rjicOaySUTSP7lvATYLA+kDIlM0XTJgsHTHSGO8
         3e4XN6yeInIKeAyQv4fJ6dvs8loAkQcQjpywdrcBFeVtFgs7S1dP5tpBEvjKFq1+tW/m
         mH1Q==
X-Gm-Message-State: AOJu0YxOpHTpplnYfWPmvS967MtJf2u1BpcR9YWK3uLDotUKn+LBzST7
	2FYDnJYsf//tzeQxB1vcdSak1MC0LyfuYH4J5IRW123qy0adV8MCvrm2oYfGgAirvYKfVJJ9Hl+
	ZV5Tx
X-Gm-Gg: ASbGncu1alvsv74eEYKxk3QjLOoKs/QLRwKgRHRyhZDQ7ZpJxbosJXE1DAwByzccap2
	+4HKlKez7STzwv2ciggo9ByyUkDrfEQroYxBskwbnv5PJbWMpNN17FGPhMWH4e4xlMJ0HmLAZGk
	xsQvl5EeqEuPc6MLxHg8ZU9tSJqmqQbVaieqxIX/54UCW5gLkyRHSaKYihBl2vQ/mq3IwYX27Bp
	I9ONcQG9eanbtXTSDAqTiIKUss04QGm72LlHiIt9W6k3+DFu+hV5XmRY8xQRz/pVyjoGpEjm5d9
	+H3v9f3J6Ec9UUGXRkw1+aRq4SkFYjlQa+EREYP+JfDGdbDJPwjMJ6Haog/VypZw9GdnP9bhdUy
	BUJCl+YICyKCnwzZeTtx0nqamzoAdBgUlvyX+EGQnhfb9OzvS4KGbI9h5JVPc7eEy2/COVyKF2X
	FuMHn6QHqhQlFtFUuvIJ+di95bNuaWwMqxCbpIsSMwNVNjdyIrnkP2Og833Z0R
X-Google-Smtp-Source: AGHT+IFYo1aOFiVVd5emFHT/2Q/Aa0vH10uNANU4wEdWdlgfUVEUJxUFnPb3U+rfvktY3VmPyPwQDw==
X-Received: by 2002:a05:600c:c8a:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477c04cfb70mr207424865e9.6.1764146602375;
        Wed, 26 Nov 2025 00:43:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:91ba:3a5e:334:4534? ([2a01:e0a:3d9:2080:91ba:3a5e:334:4534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add60e2sm31255295e9.6.2025.11.26.00.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:43:22 -0800 (PST)
Message-ID: <8386665e-b465-4efc-a5c5-72354397623a@linaro.org>
Date: Wed, 26 Nov 2025 09:43:21 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.19
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

Here's the Amlogic ARM64 DT changes for v6.19, adding new base hardware nodes
for the Amlogic S6/S7/S7D SoCs, pinctrl for Amlogic A5, hardware camera ISP
nodes for the Amlogic C3, non urgent fix for the PCIe DBI memory region and
support for new Tanix TX9 Pro board.

Thanks,
Neil

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.19

for you to fetch changes up to a7ab6f946683e065fa22db1cc2f2748d4584178a:

   arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X CPUs (2025-11-26 09:35:42 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT Changes for v6.19:
- Fix the PCIe DBI memory region name
- Add ISP nodes for Amlogic C3
- Add power controller nodes for Amlogic S6/S7/S7D
- Add Pinctrl node for Amlogic A4
- Add AO Secure node for Amlogic S6/S7/S7D
- Add GPIO Interrupt node for Amlogic S6/S7/S7D
- Fix S922X cache layout
- New Boards:
   - Tanix TX9 Pro

----------------------------------------------------------------
Christian Hewitt (2):
       dt-bindings: arm: amlogic: add support for Tanix TX9 Pro
       arm64: dts: meson: add initial device-tree for Tanix TX9 Pro

Guillaume La Roque (1):
       arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X CPUs

Keke Li (1):
       dts: arm64: amlogic: Add ISP related nodes for C3

Manivannan Sadhasivam (1):
       arm64: dts: amlogic: Fix the register name of the 'DBI' region

Xianwei Zhao (7):
       dts: arm64: amlogic: add a5 pinctrl node
       arm64: dts: amlogic: s6: add ao secure node
       arm64: dts: amlogic: s7: add ao secure node
       arm64: dts: amlogic: s7d: add ao secure node
       arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
       arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
       arm64: dts: Add gpio_intc node for Amlogic S7D SoCs

hongyu.chen1 (3):
       arm64: dts: amlogic: s6: add power domain controller node
       arm64: dts: amlogic: s7: add power domain controller node
       arm64: dts: amlogic: s7d: add power domain controller node

  Documentation/devicetree/bindings/arm/amlogic.yaml |  1 +
  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 90 ++++++++++++++++++++++
  .../boot/dts/amlogic/amlogic-c3-c308l-aw419.dts    | 84 ++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 88 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 28 +++++++
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 28 +++++++
  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 28 +++++++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  4 +-
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  2 +-
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |  4 +-
  arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts  | 90 ++++++++++++++++++++++
  12 files changed, 443 insertions(+), 5 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts
