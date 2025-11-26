Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89649318143
	for <soc@lists.linux.dev>; Wed, 26 Nov 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146454; cv=none; b=XHCjHi3q277x7ArrvgEH7EyrMWchahgtTM/Q12wbxYSg+8m4WFz8lAqfsOx2QY6XUDGRpjpxwHA1I3tCSPA6P9BC2XZ/ij5ItCbciAGh4jmLsUseoDJGLWFcOD95wZlNbnxGofQ+iwfA4u3m7znCGRSxxF1t5X8VS4eBpCnXazo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146454; c=relaxed/simple;
	bh=QtnJb687NGpc8F4ngXGCCNzKHRoIjXc8hInm9vz6+zQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Po22w8GQDFOziiPbPoSAhzboWEoC/eNDhvl/kWx3vth+t90AxU/E+9YjYqJ6ToTRw+swR1nJcDWc9bUpMFaYuX+vMj1NdFTLmpVUjGhm1tp7apKWiI20vFNdFNhdE8pm7u7q9bTR+xENq15emxlfjAzxGoc9ww+TKET8yhQ3DHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EPce8lW4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPce8lW4"
Received: by smtp.kernel.org (Postfix)
	id 358E2C16AAE; Wed, 26 Nov 2025 08:40:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 486CDC116D0
	for <soc@kernel.org>; Wed, 26 Nov 2025 08:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 486CDC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso4792985e9.0
        for <soc@kernel.org>; Wed, 26 Nov 2025 00:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764146452; x=1764751252; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZRyLJQWLyu2ofm6THBGdej8nUflr7mrvYDLc8L0ZgQ=;
        b=EPce8lW4fEuLMrxEAXza2zeYd/g0VcH1z/PYn7A/HfEI0e7RO2r8U0oOtKMlLtfDv5
         mXGvc7UpnssR5i5WiZXyu6k8sdqEiamTnbaWLYTJhxkgJ8P3+qoJwm42EvXWt2y3Iop6
         tU6jy4Z87aKhr/cR4tefoKBgjQ+thQGleGDzZWKdT0b0FXh8983CQNLv2zGKq9JgSFCh
         az6y/kiTKxIN3usM6YPB5q75NrZU/2w0Ezg22RYm2o++s46JfKhDfqon3lTD/Y2FKg1f
         PSMP41GcLdbyKAPJ+zqsI/y+dpM57/JbcZLOz2DCxCtLJrzT7bSg98Xr8o0Mgw+PGJUy
         iZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146452; x=1764751252;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZRyLJQWLyu2ofm6THBGdej8nUflr7mrvYDLc8L0ZgQ=;
        b=V1pQik5NfoQcYrsSMXVBOr81kQ0xvNfZXS2rHWVxr+hjl6PadItQJa3w9+4O1cTgnR
         TKkPWfZq8G5mFLNFmbKdHbw/SOz0Tb7SpvEjQIQd2jc+Panh/CCud4eP5pMytgEposUy
         vkOGtcKFWy/W9AW/W8MY8+8UApsei1yUGR2roHTwesC8lQkUOjgZ+QNJ+dHxmVLwWEsT
         l4e2IqZJ2SX7B50TuIPPk6b3XB68HKnnrTjC38lWAOmQfwXzlBPAv2ia3scx57F0lMRZ
         6Wc1GRBJWDCXxyC3puib9k+g+EQAZ2l9bqVqM/lAj2x5rieLxGyvwzyX9hi+ogj6ck8O
         +27g==
X-Gm-Message-State: AOJu0YzWTpBxsRJIylltcd/d1m0/K6ee6Ftf7XEEuHBqneZG/5iR6dEa
	RV5/4OJB4XovU0HkLDFaz2WoMJt73T+rCDvu4Etqx5Y3Qjx9TLBihuZ/klWi09l/JHnG11MiE1I
	vSzcv
X-Gm-Gg: ASbGncshRoCES86czMk4Kz1Twy191YGlxB5S0SPHS8EpfOpQFKZ0um8chDmLi3xH7Sn
	HV5FfwZge/VUBcGLQF/ctjhSvRv7g9cS5G8iNUG+KPRaDiWMoi4eYeTvHnLL4U97Lc4y04dFGTt
	9Kd41HFqd6n6DpnlSnLFqBH50VEwinSIAK0f8GPAeFIs0i5dP+pbCRSaoSP/6KGBnEkx6dk/abu
	qDz1QY2IsVHqCvVFe3YhkW/W67babjDefNcPBa8LsLeZtcgIc4jHgUlh0I7Uicfwqp1LmskS3La
	pw94dGazKSpkh0X96bQuv829fiRpkkw4G290flIHpZoHaf44hV4PdeMfQBAl/86UBwXGpBxMTy7
	h1B7W3OtaDAKM3z3GpdAFaKhxBqlKf6jNu5iDeSl8aRkb/ndPPYsRy3MYry8YegEyNEDZCwPRnV
	1lD50qezHmxpUxelHxVT+1oXzdXzVZPiT7tiQzIXbU1vmxMAc+Y8pBNkGwWrbH
X-Google-Smtp-Source: AGHT+IGzRRMF+OnlXmN4I27NO53Fg8uCF8bhGoTJ8TUJhsPX0oqyzIKFxwBWRjR2h6rX86vbOV8tcg==
X-Received: by 2002:a05:600c:c8a:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477c04cfb70mr207353655e9.6.1764146451593;
        Wed, 26 Nov 2025 00:40:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:91ba:3a5e:334:4534? ([2a01:e0a:3d9:2080:91ba:3a5e:334:4534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052b3f5fsm36218435e9.4.2025.11.26.00.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:40:51 -0800 (PST)
Message-ID: <9e0a76ed-8eb5-4820-b64b-a0efa0f91170@linaro.org>
Date: Wed, 26 Nov 2025 09:40:50 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.19
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

Here's drivers updates for Amlogic SoCs, 2 non-urgent fixes for the canvas driver
and support for new SoCs.

Thanks,
Neil

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.19

for you to fetch changes up to ba8abbdfd09e64f51ead8b86afc6b586505919b4:

   soc: amlogic: meson-gx-socinfo: add new SoCs id (2025-11-19 15:47:15 +0100)

----------------------------------------------------------------
Amlogic Drivers for v6.19:
- Canvas device leak fix and error handling simplification
- Add more SoCs definitions
- Suport more SoCs for meson-gx-ao-secure

----------------------------------------------------------------
Johan Hovold (2):
       soc: amlogic: canvas: fix device leak on lookup
       soc: amlogic: canvas: simplify lookup error handling

Xianwei Zhao (2):
       dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
       soc: amlogic: meson-gx-socinfo: add new SoCs id

  .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml     |  3 +++
  drivers/soc/amlogic/meson-canvas.c                           | 12 ++++--------
  drivers/soc/amlogic/meson-gx-socinfo.c                       |  6 ++++++
  3 files changed, 13 insertions(+), 8 deletions(-)
